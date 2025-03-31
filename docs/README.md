
### **Key Features for Data Engineers**  
- **Modular Code**: Separates ingestion, processing, and analysis.  
- **Documentation**: Clear setup instructions and dependencies.  
- **Scalability**: Designed for larger datasets (e.g., full CDC NVSS database).  

---

## **Project Deliverables**  
### **Data Engineering Criteria Met**  
1. **Data Ingestion**  
   - Collected CDC natality data from public sources.  
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
