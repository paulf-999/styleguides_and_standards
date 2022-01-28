## :pencil2: Description

[Summary of the change here]

---

## :hammer_and_wrench: Type of Change


Please delete the option that isn't relevant:

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)

---

## :guardsman: Merge Request Details
Please populate the details below:

|   | Item | Details |
| - |------| --------|
| 1 | Issue Number | [Link to issue number here] |
| 2 | Execution runtime | [Execution runtime here] |
| 3 | Target table row count | [Row count here] |
| 4 | Snowflake warehouse size used | [MAX WH size here] |

---

## :dart: Checklist

- [ ] Issue number: I have captured the issue number

- [ ] Execution runtime: I have captured the execution runtime

- [ ] Timezone-aware: I've developed my DAG to make use of the local Timezone (i.e., using the Pendulum library)

- [ ] Runtime metadata: My DAG posts runtime statistics into Snowflake by calling the shared Airflow DAG, 'get_dag_runtime_stats'

- [ ] Tag (category): I've assigned a tag to my DAG, to help categorise it

- [ ] SQL file uploaded: I've stored the original SQL as a separate .sql file, within the DAG folder

- [ ] `SQLFluff`: I've linted my SQL code using SQLFluff

- [ ] `pylint-airflow`: My Airflow DAG has been linted using pylint-airflow
