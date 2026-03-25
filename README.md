# 🏡 Airbnb End-to-End Data Engineering Pipeline  
![AWS S3](https://img.shields.io/badge/AWS%20S3-Cloud%20Storage-yellowgreen)
![Python - EDA](https://img.shields.io/badge/Python-3.12-blue)
![DBT](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-DataWarehouse-blue)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-red)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Visualization-yellow)

---

## Project Overview

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

---

## Architecture Diagram 

<p align="center">
  <img src="Airbnb%20pipeline%20architecture.png" alt="Airbnb Pipeline Architecture" width="800">
</p>

---

## Why This Project Matters
This project simulates a real-world data engineering pipeline used in modern data-driven organizations.

It demonstrates:
- Scalable data architecture design
- Data transformation best practices
- Automated workflow orchestration
- Business-focused analytics delivery

This aligns with industry standards followed in companies using modern data stack tools.

--- 

## Tech Stack
- **Python** : EDA 
- **Cloud Storage**: AWS S3  
- **Data Warehouse**: Snowflake  
- **Transformation Tool**: dbt  
- **Orchestration**: Apache Airflow (Docker + Celery)  
- **Visualization**: Power BI  
- **Languages**: SQL, Python  
- **Containerization**: Docker

---

## Dataset
The dataset consists of three relational tables:

- **Hosts** → Information about hosts  
- **Listings** → Property details  
- **Bookings** → Reservation transactions  

### Dataset Size

| Table | Records |
|------|--------|
| Hosts | 200 |
| Listings | 500 |
| Bookings | 5000 |

--- 

## Pipeline Workflow

1. **EDA**
   - Understand and Explore data using Python pandas, numpy, matplotlib, seaborn 
   
2. **Data Ingestion**
   - CSV files uploaded to AWS S3
   - Loaded into Snowflake STAGING schema

3. **Bronze Layer**
   - Raw data ingestion using dbt
   - Incremental loading implemented

4. **Silver Layer**
   - Data cleaning and transformations
   - Feature engineering
   - Business logic validation

5. **Gold Layer**
   - One Big Table (OBT)
   - Star Schema (Fact + Dimensions)
   - Surrogate key implementation
   - SCD Type 2 using snapshots
     
6. **Orchestration**
   - Airflow DAG runs:
     - dbt run
     - dbt snapshot
     - dbt test

7. **Visualization**
   - Power BI dashboard for insights

--- 

## Snowflake Data Warehouse
Snowflake is used as the central data warehouse.

- BROWNZE schema for raw data
- SILVER schema for cleaned data
- GOLD schema for analytics-ready data

<p align="center">
  <img src="Airbnb%20pipeline%20architecture.png" alt="Snowflake warehouse" width="800">
</p>
