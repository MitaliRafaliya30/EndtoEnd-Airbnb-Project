from airflow.sdk import dag,task
from datetime import datetime

@dag(
    dag_id = "airbnb_dbt_pipeline",
    start_date=datetime(2026,3,14),
    schedule="@daily",
    catchup=False,
    is_paused_upon_creation=False
)
def airbnb_dbt_pipeline():
    
    @task.bash
    def dbt_run_task():
        return "cd /opt/airflow/endtoend_airbnb_project && dbt run --profiles-dir ."


    @task.bash
    def dbt_snapshot_task():
        return "cd /opt/airflow/endtoend_airbnb_project && dbt snapshot --profiles-dir ."

    @task.bash
    def dbt_test_task():
        return "cd /opt/airflow/endtoend_airbnb_project && dbt test --profiles-dir ."


    run = dbt_run_task()
    snapshot = dbt_snapshot_task()
    test = dbt_test_task()

    run >> snapshot >> test

airbnb_dbt_pipeline()