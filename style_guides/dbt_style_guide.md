# dbt Style Guide

:bulb: This is an adapted version of the dbt style guide published by dbt Labs. However, it has been customised slightly in parts ([as recommended](https://docs.getdbt.com/guides/legacy/best-practices#use-a-style-guide-and-for-your-project)) to fit our preferences. **Note**: many of the proposed dbt styles come from a combination of the following sources:

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

TODO
See dbt: [Naming Conventions for dbt Models]().

### 1.3. Minimum Requirements for dbt Models

TODO
| Category | Description                  |
| -------- | ---------------------------- |
| Staging  | Contains models that clean and standardise data. |
| Marts    | Contains models which combine or heavily transform data. |

---

## 2. SQL Style Guide

See dbt: [SQL/dbt Style Guide using SQLFluff]().

---

## 3. (Yaml) Resource Properties

TODO
<details>

<summary>What are dbt Resource Properties? (Click to expand)</summary>

</details><br/>

**Naming Conventions & Style Guide for Resource Properties**

TODO
See ...[]().

---

## 4. Snapshots

<details>

<summary>Background: What are dbt Snapshots? (Click to expand)</summary>

</details><br/>

**Best Practices when developing/using dbt snapshots**

TODO
| Category | Description                  |
| -------- | ---------------------------- |
| Staging  | Contains models that clean and standardise data. |
| Marts    | Contains models which combine or heavily transform data. |

---

## 5. Macros

Adhere to the following standards when developing/using dbt Macros:

TODO
| Category | Description                  |
| -------- | ---------------------------- |
| Staging  | Contains models that clean and standardise data. |
| Marts    | Contains models which combine or heavily transform data. |
