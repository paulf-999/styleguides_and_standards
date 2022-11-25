# dbt: Naming Conventions for dbt Models

:bulb: The purpose of this page is to describe the naming conventions used for dbt projects.

---

## Contents

1. High-level Naming Conventions
2. Mart Naming Conventions
    1. Fact and Dimensions
    2. Audit (Metadata) Fields
    3. Null Handling

---

## 1. High-level Naming Conventions

**Case:** schema, table and column names should use `snake_case`.

**dbt Model Layer Naming Conventions:** of the two dbt model layers, the following file naming conventions should be used for each:

| Category | Naming Convention                  |
| -------- | ---------------------------- |
| Staging  | `stg_[source]__[entity]s.sql` |
| Marts    | • Dim & Fact tables are to use the naming convention: `dim_<entity>`/`fact_<entity>`<br/>• To be named after the entity they represent.<br/>• E.g., `dim_orders`, `dim_customer` or `dim_payment` etc. |

These 2 folders relate to the models folder within the overall dbt project structure shown below:

```bash
├── models
│   ├── marts
│   │   ├── _models.yml
│   │   └── dim_customer.sql (example)
│   ├── staging
│   │   ├── ${DATA_SRC}
│   │   │   ├── ${DATA_SRC}__docs.md (TBC)
│   │   │   ├── ${DATA_SRC}__models.yml
│   │   │   ├── ${DATA_SRC}__sources.yml
│   │   │   └── ${DATA_SRC}_stg__customer.sql (example)
│   └── utilities
│       └── all_dates.sql
```

The purpose of these 2 folders within the models directory are as follows:

| Folder    | Purpose                  | Usage | Target Schema | Materialization | Naming Convention | Comments |
| --------- | ------------------------ | ----- | ------------- | --------------- | ----------------- | -------- |
| `staging` | • The purpose of this layer is to create temporary/'staging' models of raw data (i.e., the RDS layer), per data source.<br/>• Whereby these staging objects contain the transformation logic used to prepare source data for ingestion into the data marts.<br/>• This layer is also used to rename and recast fields once. All subsequent data models should be built on top of the staging models, reducing the amount of duplicated code. | • For every distinct source, you need to create a subdirectory under the staging directory.<br/>• Every model, must follow the stg_[source]__[entity]s.sql notation.<br/>• A base sub-directory under the model’s directory, in case you need to join together staging models. | `TBC` | View | `stg_[source]__[entity].sql` | • Staging models help keep our code DRY and should be materialized as views. |
| `marts`   | • The purpose of the marts layer is to store the enterprise (dimensional) data model. | • The purpose of the marts layer is to store the enterprise (dimensional) data model. | `TBC` | Table | • `dim_<entity>.sql`<br/>• `fact_<entity>.sql` | • To give end users much faster performance, we materialise mart models here as tables.<br/>• This also saves costs recomputing these entire chains of models each time somebody refreshes a dashboard or runs a regression in python. |

**Database Keys**

| Related to | Naming Convention                  |
| -------- | ---------------------------- |
| Primary key  | Each model should have a primary key that can identify the unique row.<br/>• The primary key should be named `<object>_id`.<br/>• E.g. `account_id` – this makes it easier to know what id is referenced in downstream joined models. |
| Surrogate key    | • If a surrogate key is created, it should be named `<object>_sk`. |

<br/>

**Data Types**

| Related to | Naming Convention                  |
| -------- | ---------------------------- |
| Date/time columns | Date/time columns should be named according to these conventions:<br/>• **Timestamps**: `<event>_at`<br/>• Format: UTC<br/>• Example: `created_at`<br/><br/>• **Dates**: `<event>_date`<br/>• Format: Date<br/>• Example: `created_date` |
| Booleans   | • Booleans should be prefixed with `is_` or `has_`.<br/>• Example: `is_active_customer` and `has_admin_access` |
| Price/revenue fields | • Price/revenue fields should be in decimal currency (e.g. 19.99 for $19.99; many app databases store prices as integers in cents).<br/>• If a non-decimal currency is used, indicate this with suffixes, e.g. `price_in_cents`. |

<br/>

### General Approach for Model Naming

* Use names based on the *business* terminology rather than the source terminology.
* Avoid using reserved words as column names.
* Consistency is key! Use the same field names across models where possible.
* E.g., a customer table key should be named `customer_id` rather than `user_id`.

---

## 3. Mart Naming Conventions

### 3.1. Fact and Dimensions

TODO

### 3.2. Audit (Metadata) Fields

TODO

### 3.3. Null Handling

TODO
