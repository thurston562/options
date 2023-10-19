from datetime import datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': days_ago(2),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
    # 'wait_for_downstream': False,
    # 'dag': dag,
    # 'sla': timedelta(hours=2),
    # 'execution_timeout': timedelta(seconds=300),
    # 'on_failure_callback': some_function,
    # 'on_success_callback': some_other_function,
    # 'on_retry_callback': another_function,
    # 'sla_miss_callback': yet_another_function,
    # 'trigger_rule': 'all_success'
}

dag = DAG('etl_python', description = 'tdameritrade etl job',schedule_interval='`15 15 * * 1-5',start_date=datetime(2020,9,8), catchup=False)

t1 = BashOperator(
    task_id='getoptiondata',
    bash_command='python3.6 $TD_HOME/python_scripts/opt_tdamer.py 2>$TD_HOME/logs/opt_rep.out',
    dag=dag,
)


