# dbt Style Guide

:bulb: This is an adapted version of the dbt style guide published by dbt Labs. However, it has been customised slightly in parts ([as recommended](https://docs.getdbt.com/guides/legacy/best-practices#use-a-style-guide-and-for-your-project)) to fit our preferences.

**Note**: many of the proposed dbt styles come from a combination of the following sources:

* [dbt’s own style guide](https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md).
* [Best practices/recommendations provided within dbt reference documentation](https://docs.getdbt.com/reference/dbt_project.yml.).
* [dbt style guide put together by GitLab](https://about.gitlab.com/handbook/business-technology/data-team/platform/dbt-guide/#style-and-usage-guide).

---

## Contents

1. dbt Models
   1. Model Organisation
   2. Model Naming Conventions
   3. Minimum Requirements for dbt Models
2. SQL Style Guide
3. (Yaml) Resource Properties
4. Snapshots
5. Macros

---

## 1. dbt Models

### 1.1. Model Organisation

Our dbt models (typically) fit into two main categories:

| Category | Description                  |
| -------- | ---------------------------- |
| Staging  | Contains models that clean and standardise data. |
| Marts    | Contains models which combine or heavily transform data. |

For more detail about why we use this structure, check out this discourse post. The file and naming structures used for dbt models are as follows:

<details>

<summary>Click to expand</summary>

```bash
├── models
│   ├── marts
│   │   ├── _models.yml
│   │   └── dim_customer.sql
│   ├── staging
│   │   ├── {{ DBT_PROJECT_NAME }}
│   │   │   ├── {{ DBT_PROJECT_NAME }}__docs.md
│   │   │   ├── {{ DBT_PROJECT_NAME }}__models.yml
│   │   │   ├── {{ DBT_PROJECT_NAME }}__sources.yml
│   │   │   └── stg_{{ DATA_SRC }}__customer.sql
│   └── utilities
│       └── all_dates.sql
```

</details><br/>

### 1.2. Model Naming Conventions

TODO - WIP
See dbt: [Naming Conventions for dbt Models](dbt_style_guide_child_pages/naming_conventions_for_dbt_models.md).

<br/>

### 1.3. Minimum Requirements for dbt Models

| Attribute                       | Requirement                  |
| ------------------------------- | ---------------------------- |
| Primary Key                     | • Each model should have a primary key that can identify the unique row.<br/>• The primary key should be named `<object>_id.`<br/>◦ E.g., `account_id` – this makes it easier to know what id is referenced in downstream joined models. |
| dbt Tests                       | At a minimum, unique and `not_null` tests should be applied to the expected primary key of each model. |
| Model Selection                 | • Only models in `staging` should select from sources.<br/>• Models **not** within the `staging` folder should select from refs. |
| Use CTEs rather than subqueries | • When developing dbt models, aim to use CTE statements rather than subqueries.<br/>• For further details about why see [CTE vs Subquery \| docs.getdbt.com](https://docs.getdbt.com/terms/cte#cte-vs-subquery).<br/>• For more information, see [CTE Style Guide](https://github.com/paulf-999/styleguides_and_standards/blob/main/style_guides/cte_style_guide.md). |
| Ephemeral Models                | • If you want to separate more complex SQL into a separate model, you absolutely should keep things DRY ("don't repeat yourself") and easier to understand.<br/>• The config setting `materalized='ephemeral'` is one option that treats the model like a CTE.<br/>• See [dbt Model Materialisations - Ephemeral \| docs.getdbt.com](https://docs.getdbt.com/docs/build/materializations#ephemeral) for more details. |

---

## 2. SQL Style Guide

TODO
See dbt: [SQL/dbt Style Guide using SQLFluff](dbt_style_guide_child_pages/yaml_naming_conventions_for_resource_properties.md).

---

## 3. (Yaml) Resource Properties

<details>

**<summary>What are dbt Resource Properties? (Click to expand)</summary>**

Resources in your project (e.g., models, snapshots, seeds, tests etc.) can have several declared **properties.** As a rule of thumb, properties declare things *about* your project resources. For example, you can use resource **properties** to:

- Describe models, snapshots, seed files, and their columns.
- Assert "truths" about a model in the form of [tests](https://docs.getdbt.com/docs/building-a-dbt-project/tests), e.g. "this id column is unique".
- Define pointers to existing tables that contain raw data in the form of [sources](https://docs.getdbt.com/docs/building-a-dbt-project/using-sources), and assert the expected "freshness" of this raw data.

**Where can I define properties?**

In dbt, properties are declared in .yml files in the same directory as your resources. You can name these files `whatever_you_want.yml` and nest them arbitrarily deeply in subfolders within each directory. We recommend you define properties in dedicated paths alongside the resources they're describing.

</details><br/>

**Naming Conventions & Style Guide for Resource Properties**

TODO
See [YAML Naming Conventions & Style Guide for Resource Properties.](dbt_style_guide_child_pages/yaml_naming_conventions_for_resource_properties.md).

---

## 4. Snapshots

<details>

**<summary>Background: What are dbt Snapshots? (Click to expand)</summary>**

* Snapshots are a way to make point-in-time copies of source tables. dbt has [excellent documentation](https://docs.getdbt.com/docs/building-a-dbt-project/snapshots) on how snapshots work.
* Snapshot tables are created in dbt using the command dbt snapshot
* Snapshot definitions are stored in the [snapshots folder](https://gitlab.com/gitlab-data/analytics/tree/master/transform/snowflake-dbt/snapshots)
* The data source should organise snapshots to allow for easy discovery

The following is an example of how to create a snapshot table, following [dbt's recommended 'timestamp strategy](https://docs.getdbt.com/docs/building-a-dbt-project/snapshots#timestamp-strategy-recommended)':

```jinja
{% snapshot sfdc_opportunity_snapshots %}

    {{
        config(
          unique_key='id',
          strategy='timestamp',
          updated_at='<TS_field>',
        )
    }}

    SELECT *
    FROM {{ source('<db_object>') }}

{% endsnapshot %}
```

**Building Models on top of Snapshots**

Sometimes, there is a need to have a record per day rather than a record per changed record with timeframe constraints dbt_valid_from and dbt_valid_to. In this case, a technique called date spining can be used to create a model with daily snapshots.

In date spining, a snapshot model is joined to a date table based on `dbt_valid_from` and `dbt_valid_to`.

Another possibility to generate daily records is using the [dbt utility function date_spine](https://github.com/dbt-labs/dbt-utils/blob/main/macros/sql/date_spine.sql).

**Incremental Models on top of Snapshots**

Consider materialising the model incremental if you use date spining to generate daily records. This way, only new records will be added based on the snapshot_date condition.

</details><br/>

**Best Practices when developing/using dbt snapshots**

| Category | Description                  |
| -------- | ---------------------------- |
| Naming Convention | Follow the naming convention `{source_name}_{source_table_name}_snapshot.sql` for your file name |
| Best Practice     | *Always* select from a **source table**. Even if some deduplication is required, a source table must be chosen, as selecting from a downstream dbt model is prone to failure. |
| Best Practice     | • Avoid any transformations in snapshots, potentially aside from deduplication efforts.<br/>• Instead, always look to clean data downstream |
| Best Practice     | Contains models which combine or heavily transform data. |

---

## 5. Macros

Adhere to the following standards when developing/using dbt Macros:

| Category           | Description                  |
| ------------------ | ---------------------------- |
| Naming conventions | The file name must match the macro name. |
| `macros.yml`/`macros.md` | dbt macros should be documented either in the `macro.yml` file or in a `macros.md` file, providing the options for longer, more meaningfull descriptions |
| [`dbt-utils`](https://hub.getdbt.com/fishtown-analytics/dbt_utils/latest/) | We make use of the `dbt-utils` package. This adds several macros that are commonly useful. Important ones to take note of:<br/>• `group_by` - This macro builds a group by statement for fields 1…N<br/>• `star` - This macro pulls all the columns from a table, excluding the columns listed in the except argument<br/>• `surrogate_key` - This macro takes a list of field names and returns a hash of the values to generate a unique key |
