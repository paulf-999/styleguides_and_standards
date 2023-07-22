from diagrams import Cluster
from diagrams import Diagram
from diagrams import Edge
from diagrams.generic.os import Ubuntu
from diagrams.programming.language import Bash
from diagrams.azure.devops import Pipelines

# from diagrams.onprem.workflow import Airflow

# from diagrams.programming.language import Python
# from diagrams.saas.analytics import Snowflake

with Diagram("dbt CICD Pipeline", show=False, filename="dbt_cicd_pipeline"):
    az_pipeline = Pipelines("Azure Pipeline")

    with Cluster("Azure CICD Pipeline for the dbt repo"):
        dbt_qa_job = Bash("dbt QA Job\n\n(dbt_qa_job.sh)")
        sqlfluff_lint = Bash("SQLFluff lint\n\n(sqlfluff_lint.sh)")
        git_branch_validation = Bash("Git branch validation\n\n(git_branch_validation.sh)")

    az_pipeline >> dbt_qa_job >> sqlfluff_lint >> git_branch_validation
