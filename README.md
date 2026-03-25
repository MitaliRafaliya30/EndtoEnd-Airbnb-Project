# 🏡 Airbnb End-to-End Data Engineering Pipeline  
![AWS S3](https://img.shields.io/badge/AWS%20S3-Cloud%20Storage-yellowgreen)
![Python - EDA](https://img.shields.io/badge/Python-3.12-blue)
![DBT](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-DataWarehouse-blue)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-red)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Visualization-yellow)

---

## 📌 Project Overview

This project demonstrates a complete end-to-end data engineering pipeline built with a modern data stack.

Following initial Exploratory Data Analysis (EDA), raw Airbnb datasets are ingested from AWS S3 into Snowflake. The data is then transformed via dbt using a Medallion Architecture (Bronze → Silver → Gold), orchestrated by Apache Airflow, and visualized through an interactive Power BI dashboard. The pipeline is engineered for scalability and modularity, featuring automated data quality checks, incremental processing, and dimensional modeling.

The pipeline is designed to be scalable, modular, and production-ready, incorporating data quality checks, incremental processing, and dimensional modeling.

---

## Project Highlights

✔ End-to-End Data Pipeline  
✔ Medallion Architecture (Bronze → Silver → Gold)  
✔ Incremental Data Processing (dbt)  
✔ Star Schema Data Modeling  
✔ Surrogate Keys + SCD Type 2  
✔ Automated Orchestration (Airflow)  
✔ Docker-based Production Setup  
✔ Interactive Power BI Dashboard  
✔ Data Quality Validation & Testing  
