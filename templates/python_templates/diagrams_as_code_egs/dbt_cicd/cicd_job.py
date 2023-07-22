from diagrams import Cluster
from diagrams import Diagram
from diagrams.azure.devops import Pipelines
from diagrams.custom import Custom

DBT_ICON = "dbt.png"
SQLFLUFF_ICON = "sqlfluff.png"
GIT_BRANCH_ICON = "git_branch.png"
DATA_DIFF_ICON = "data_diff.png"

with Diagram(
    "Current State: CICD pipeline design for the dbt repo",
    show=False,
    filename="op/current_state_dbt_cicd_job",
):
    az_pipeline = Pipelines("Azure CICD Pipeline")

    with Cluster(""):
        with Cluster("Validate the changes\nare 'non-breaking'") as dq_checks:
            dbt_qa_job = Custom("dbt 'QA' Job\n\n(dbt_qa_job.sh)", DBT_ICON, fontweight="bold")

        with Cluster("Code Quality Checks") as cq_checks:
            sqlfluff_lint = Custom("SQLFluff lint\n\n(sqlfluff_lint.sh)", SQLFLUFF_ICON)

        with Cluster("Governance &\nStandards Checks") as standards_checks:
            git_branch_validation = Custom("Git branch name validation\n\n(git_branch_validation.sh)", GIT_BRANCH_ICON)

        az_pipeline >> dbt_qa_job >> sqlfluff_lint >> git_branch_validation

with Diagram(
    "Future State V1: CICD pipeline design for the dbt repo",
    show=False,
    filename="op/future_state_v1_dbt_cicd_job",
):
    az_pipeline = Pipelines("Azure Test Pipeline")

    with Cluster(""):
        with Cluster("Validate the changes\nare 'non-breaking'") as dq_checks:
            dbt_qa_job = Custom("dbt 'QA' Job\n\n(dbt_qa_job.sh)", DBT_ICON)

        with Cluster("Data Quality Checks") as dq_checks:
            with Cluster("dbt-checkpoint: check if the required DQ tests have been set") as dq_checks:
                with Cluster("'Generic' dbt tests") as generic_dbt_tests:
                    dbt_uniqueness = Custom("Uniqueness", DBT_ICON)
                    dbt_not_null = Custom("Completeness\n\n('not nulls')", DBT_ICON)
                    dbt_accepted_values = Custom("Validity\n\n('accepted values')", DBT_ICON)

        with Cluster("Code Quality Checks") as cq_checks:
            sqlfluff_lint = Custom("SQLFluff lint\n\n(sqlfluff_lint.sh)", SQLFLUFF_ICON)

        with Cluster("Governance &\nStandards Checks") as standards_checks:
            git_branch_validation = Custom("Git branch name validation\n\n(git_branch_validation.sh)", GIT_BRANCH_ICON)

            az_pipeline >> dbt_qa_job
            dbt_qa_job >> dbt_uniqueness
            dbt_uniqueness >> dbt_not_null >> dbt_accepted_values
            dbt_accepted_values >> sqlfluff_lint >> git_branch_validation

with Diagram(
    "Future State V2: CICD pipeline design for the dbt repo",
    show=False,
    filename="op/future_state_v2_dbt_cicd_job",
):
    az_pipeline = Pipelines("Azure Test Pipeline")

    with Cluster(""):
        with Cluster("Validate the changes\nare 'non-breaking'") as dq_checks:
            dbt_qa_job = Custom("dbt 'QA' Job\n\n(dbt_qa_job.sh)", DBT_ICON)

        with Cluster("Data Quality Checks") as dq_checks:
            with Cluster("dbt-checkpoint: check if the required DQ tests have been set") as dq_checks:
                with Cluster("'Generic' dbt tests") as generic_dbt_tests:
                    dbt_uniqueness = Custom("Uniqueness", DBT_ICON)
                    dbt_not_null = Custom("Completeness\n\n('not nulls')", DBT_ICON)
                    dbt_accepted_values = Custom("Validity\n\n('accepted values')", DBT_ICON)

                with Cluster("Timeliness") as validity_checks:
                    dbt_freshness = Custom("dbt freshness", DBT_ICON)

                with Cluster("Relevance") as validity_checks:
                    dbt_relevance = Custom("dbt data tests\n\n('business rule tests')", DBT_ICON)

        with Cluster("Code Quality Checks") as cq_checks:
            sqlfluff_lint = Custom("SQLFluff lint\n\n(sqlfluff_lint.sh)", SQLFLUFF_ICON)

        with Cluster("Governance &\nStandards Checks") as standards_checks:
            git_branch_validation = Custom("Git branch name validation\n\n(git_branch_validation.sh)", GIT_BRANCH_ICON)

            az_pipeline >> dbt_qa_job
            dbt_qa_job >> dbt_uniqueness
            dbt_uniqueness >> dbt_not_null >> dbt_accepted_values
            dbt_freshness >> dbt_relevance
            dbt_accepted_values >> sqlfluff_lint >> git_branch_validation
            dbt_relevance >> sqlfluff_lint >> git_branch_validation
