# **Maternal Age and Birth Weight Trends Analysis**  
*A Data Engineering Project*  

## **Overview**  
Maternal age is a known factor in neonatal health outcomes. Birth weight, a key indicator of neonatal health, may vary depending on the mother’s age. This project analyzes CDC natality data (2017–2023) to:  
- Track shifts in maternal age distribution.
- Correlate maternal age with birth weight trends.
- Provide scalable data pipelines for public health research.

---

## **Project Deliverables**  
### **Data Engineering Criteria Met**  
1. **Data Ingestion**  
   - Collected CDC natality data (2017–2023) from public sources.  
   - Automated downloads using Python (`requests`/`wget`) or cloud tools (e.g., AWS S3).  
2. **Data Processing**  
   - Cleaned and standardized fields (e.g., maternal age groups, birth weight categories).  
   - Handled missing data (e.g., imputation for outliers in birth weight).  
3. **Storage**  
   - Stored processed data in a structured format (BigQuery and GCS) for analysis.
4. **Analysis & Visualization**  
   - Generated aggregated statistics (e.g., average birth weight by age group).  
   - Built dashboards (Tableau/Power BI/Plotly) for trend visualization.  
5. **Automation**  
   - Scheduled pipelines (Airflow/Luigi) for periodic data updates.  

---

## **Getting Started**  
For setup and reproducibility instructions, see the [project documentation](docs/README.md).  

---

## **Dashboard**  
![Dashboard Preview](docs/dashboard.png)  
*Interactive dashboard showing maternal age trends and birth weight distributions.*  

---

## **Why It Matters**  
- **Healthcare**: Identifies high-risk age groups for targeted interventions.  
- **Policy**: Supports evidence-based maternal health programs.  
- **Engineering Impact**: Demonstrates scalable pipelines for public health data.  

---

## **Future Work**  
1. Expand data pipeline to include real-time CDC API feeds.  
2. Deploy cloud-based ETL (e.g., AWS Glue, Databricks).  
3. Add predictive modeling (e.g., low birth weight risk by age).  

---

### **Data Sources**  
- [CDC Natality Data](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm)  

---

### **Key Features for Data Engineers**  
- **Modular Code**: Separates ingestion, processing, and analysis.  
- **Documentation**: Clear setup instructions and dependencies.  
- **Scalability**: Designed for larger datasets (e.g., full CDC NVSS database).  