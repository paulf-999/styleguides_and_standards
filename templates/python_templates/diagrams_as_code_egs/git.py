from diagrams import Cluster
from diagrams import Diagram
from diagrams.azure.devops import Pipelines
from diagrams.custom import Custom

dbt_icon = "dbt.png"
sqlfluff_icon = "sqlfluff.png"
git_branch_icon = "git_branch.png"

with Diagram(
    "Current State: CICD pipeline design for the dbt repo",
    show=False,
    filename="op/current_state_dbt_cicd_job",
):
    az_pipeline = Pipelines("Azure CICD Pipeline")

    dbt_icon = "dbt.png"
    sqlfluff_icon = "sqlfluff.png"
    git_branch_icon = "git_branch.png"
    with Cluster(""):
        with Cluster("Data Quality Checks") as dq_checks:
            dbt_qa_job = Custom("dbt 'QA' Job\n\n(dbt_qa_job.sh)", dbt_icon)

        with Cluster("Code Quality Checks") as cq_checks:
            sqlfluff_lint = Custom("SQLFluff lint\n\n(sqlfluff_lint.sh)", sqlfluff_icon)

        with Cluster("Governance &\nStandards Checks") as standards_checks:
            git_branch_validation = Custom("Git branch validation\n\n(git_branch_validation.sh)", git_branch_icon)

        az_pipeline >> dbt_qa_job >> sqlfluff_lint >> git_branch_validation

with Diagram(
    "Future State: CICD pipeline design for the dbt repo",
    show=False,
    filename="op/future_state_dbt_cicd_job",
):
    az_pipeline = Pipelines("Azure CICD Pipeline")

    dbt_icon = "dbt.png"
    sqlfluff_icon = "sqlfluff.png"
    git_branch_icon = "git_branch.png"
    with Cluster(""):
        with Cluster("Data Quality Checks") as dq_checks:
            dbt_qa_job = Custom("dbt 'QA' Job\n\n(dbt_qa_job.sh)", dbt_icon)

        with Cluster("Code Quality Checks") as cq_checks:
            sqlfluff_lint = Custom("SQLFluff lint\n\n(sqlfluff_lint.sh)", sqlfluff_icon)

        with Cluster("Governance &\nStandards Checks") as standards_checks:
            git_branch_validation = Custom("Git branch validation\n\n(git_branch_validation.sh)", git_branch_icon)

        az_pipeline >> dbt_qa_job >> sqlfluff_lint >> git_branch_validation
