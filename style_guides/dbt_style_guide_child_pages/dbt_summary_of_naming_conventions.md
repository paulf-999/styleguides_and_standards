# dbt: Summary of Naming Conventions

## 1. dbt Model (and Snapshot) Naming Conventions

| Category                       | Naming Convention            | Example |
| ------------------------------ | --------------------------- | ----------- |
| Case                           | `snake_case` should be used throughout the dbt project, e.g., for schema, table and column names. | `my_example_table` |
| Data Model Layer: Staging      | `stg_[source]__[entity]s.sql` | `stg_<data_src>_customers` |
| Data Model Layer: Marts        | * Dimension tables: `dim_<entity>`<br/>* Fact tables: `fact_<entity>`<br/>* To be named after the entity they represent. | * `dim_orders`<br/>* `dim_customer`<br/>* `dim_payment`
| Snapshots                      | `{source_name}_{source_table_name}_snapshot.sql` | `weatherapi_forecast_snapshot` |
| Macros                         | The file name must match the macro name. | `example_macro.sql` |
| YAML (resource property files) | `stg_[source]__[entity]s.sql` | `stg_<data_src>_customers` |

## 2. (YAML) Resource Property Naming Conventions

* YAML files used for resource property configs should be prefixed with an underscore ( `_` ) to keep it at the top of the subdirectory.
* Each top-level `configuration` should use a separate `.yml` file (i.e., sources, models).
  * Listed in the table below are resource property .yml files for common configuration items:

| Configuration Item | Naming Convention           | Description | Example |
| ------------------ | --------------------------- | ----------- | ------- |
| **Sources**        | `_${DATA_SRC}__sources.yml` | Used to store configurations **exclusively** relating to a given data source. | `_weatherapi__sources.yml` |
| **Models**        | `_${DATA_SRC}__models.yml` | Used to store configurations Used to store configurations exclusively relating to your dbt models. relating to your dbt models. | `_weatherapi__models.yml` |
