# NATALITY DATA PIPELINE DOCUMENTATION

## REPRODUCTION GUIDE

### PREREQUISITES
- **Docker** with Docker Compose (v27.5.1+)
- **Terraform** (v1.10.5+)
- **Google Cloud Platform** account with:
  - Billing enabled
  - Owner permissions (for initial setup)

### SETUP INSTRUCTIONS

#### 1. REPOSITORY SETUP
```sh
git clone https://github.com/shawnanx/natality_zoomcamp.git
cd natality_zoomcamp
```

#### 2. GCP CONFIGURATION
1. Create a project named `natality-data-project-dez`
2. Create a service account with:
   - BigQuery Admin role
   - Storage Admin role
3. Generate a JSON key and save it as `gcp-key.json` in the project root
   - **Important**: Keep this file safe and never commit it to version control

#### 3. IaC SETUP
```sh
cd terraform
# Review and modify variables.tf as needed
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

#### 4. LAUNCH PIPELINE
```sh
cd ../docker
docker-compose up -d
```
Access Kestra UI at: [http://localhost:8080](http://localhost:8080)

---

## PIPELINE EXECUTION

### TASK 1: GCP SETUP (`01_gcp_setup`)
1. Edit variables in Kestra UI:
   - **Project ID**: `natality-data-project-dez`
   - **Bucket name**: `[your-bucket-name]`
2. Execute flow to create:
   - GCS bucket
   - BigQuery dataset
![Task 1 Execution Preview](./task_execution_1.png) 
### TASK 2: DATA BACKFILL (`02_gcp_bq`)
1. Enable backfill trigger
2. Set date range:
   - **Start**: `2014-01-01 00:00:00`
   - **End**: `2023-01-02 00:00:00`
3. Execute backfill
   - **Important**: Ensure the data in the date range is complete, as data from years before 2014 might require manual schema adjustments if used
![Task 2 Execution Preview](./task_execution_2.png) 
### TASK 3: DBT TRANSFORMATION (`03_dbt_bq`)
1. Execute flow to:
   - Create analytics views
![Task 3 Execution Preview](./task_execution_3.png) 
---

## DATA VISUALIZATION

### LOOKER STUDIO SETUP
1. Connect to BigQuery
2. Select dataset
3. Build dashboards
![Dashboard Preview](./dashboard.png) 


---

## ARCHITECTURE FLOW
![Architecture Preview](./architecture.png) 

---

## IMPORTANT NOTES

### SECURITY
- **Never** commit `gcp-key.json` to version control

### FILE REQUIREMENTS
- JSON key **must** be named exactly `gcp-key.json`
- Must be placed in the project root

---

## TROUBLESHOOTING

### COMMON ISSUES

#### Docker Failures
- Run: `docker system prune -a`
- Rebuild containers
   
#### GCP Permission Errors
- Verify that both roles are assigned correctly
- Check that the service account email matches

#### Backfill Problems
- Check Kestra executor logs
- Verify date range format
- `Important Note`: Data files from years before 2014 may:
   - Lack certain columns used in this analysis
   - Require manual schema adjustment if included

