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

This project demonstrates an end-to-end data engineering pipeline built using a modern data stack.

Airbnb data is ingested from AWS S3 into Snowflake, transformed using dbt with a Medallion Architecture (Bronze → Silver → Gold), orchestrated via Apache Airflow, and visualized in Power BI.

The pipeline is fully automated, scalable, and designed with data quality checks, incremental processing, and dimensional modeling.

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
  <img src="images/Airbnb%20pipeline%20architecture.png" alt="Airbnb Pipeline Architecture" width="90%">
</p>

---

## Why This Project Matters

This project reflects real-world data engineering practices used in modern organizations.

It demonstrates my ability to:
- Design scalable data pipelines  
- Build transformation workflows using dbt  
- Orchestrate pipelines using Airflow  
- Deliver business insights through dashboards  

It showcases end-to-end ownership from raw data to analytics.

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
   - Performed exploratory analysis using Python (Pandas, Matplotlib, Seaborn)

2. **Data Ingestion**
   - Raw CSV data uploaded to AWS S3
   - Loaded into Snowflake staging layer

3. **Data Transformation (dbt)**
   - Bronze: Raw ingestion  
   - Silver: Cleaning & transformations  with incremental loading 
   - Gold: Business-ready models (Fact + Dimensions)

4. **Data Modeling**
   - Star schema with fact and dimension tables  
   - Surrogate keys and SCD Type 2 implementation  

5. **Orchestration (Airflow)**
   - Automated pipeline execution:
     - `dbt run`
     - `dbt snapshot`
     - `dbt test`

6. **Visualization**
   - Insights delivered through Power BI dashboard
--- 

## Snowflake Data Warehouse
Snowflake is used as the central data warehouse.

- BROWNZE schema for raw data
- SILVER schema for cleaned data
- GOLD schema for analytics-ready data

<p align="center">
  <img src="images/Snowflake%20warehouse.png" alt="Snowflake Warehouse" width="90%">
</p>

## DBT Lineage
dbt lineage graph shows the flow from source → bronze → silver → gold.

<p align="center">
  <img src="images/DBT%20Linage%20graph.png" alt="DBT Lineage Graph" width="90%">
</p>

---

## Data Modeling (Star Schema)
A Star Schema was implemented:

- **Fact Table** → Booking-level data  
- **Dimension Tables** → Hosts, Listings, Bookings  

This improves query performance and supports BI analytics.

<p align="center">
  <img src="images/Data%20Modeling.png" alt="Data Modeling" width="90%">
</p>

---

## Revenue Intelligence Dashboard

<p align="center">
  <img src="images/Revenue%20Intelligence%20dashboard.png" alt="Revenue Intelligence Dashboard" width="80%">
</p>

This interactive Power BI dashboard provides insights into Airbnb revenue, bookings, and listing performance.
It helps identify trends, high-performing segments, and supports data-driven decision-making.

---

# 🔄 Airflow DAG

<p align="center">
  <img src="images/Airflow%20DAG.png" alt="Airflow DAG" width="90%">
</p>

The Airflow DAG orchestrates the end-to-end pipeline by executing dbt transformations, snapshots, and tests in sequence.
This ensures automated, reliable, and production-ready data workflows.

---

## Docker Setup

```
airflow-apiserver
airflow-scheduler
airflow-worker
postgres
redis
```

---

## Run Project

```
1. Clone repository
2. Setup `.env` file
3. Run Docker:

   docker-compose up -d

4. Access Airflow UI:
   http://localhost:8090

5. Trigger DAG
```

---

## DBT Commands

```
dbt run  
dbt test  
dbt snapshot  
dbt docs generate  
dbt docs serve 
```

---

## Future Improvements

- Add real-time streaming (Kafka)
- Implement CI/CD for dbt pipelines
- Add data quality monitoring tools
- Optimize Airflow scheduling & retries
- Deploy dashboard to cloud (Power BI Service)

---

## Author

- **Mitali Rafaliya**
- Aspiring Data Engineer

Connect with me on LinkedIn 
https://www.linkedin.com/in/mitali-rafaliya-60876a252/
---

