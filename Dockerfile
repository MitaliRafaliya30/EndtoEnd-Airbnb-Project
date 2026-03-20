FROM apache/airflow:3.1.7

USER airflow

RUN pip install --no-cache-dir \
    dbt-core \
    dbt-snowflake