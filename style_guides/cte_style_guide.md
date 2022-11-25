# CTE Styleguide

---

## Contents

1. Use CTEs rather than Subqueries
2. CTE Groupings
3. Grouping Descriptions
   1. Import CTEs
   2. Logical CTEs
   3. Final CTEs
   4. Simple SELECT Statement

---

## 1. Use CTEs rather than Subqueries

- When developing dbt models, aim to use CTE statements rather than subqueries.
- For further details about why, see [CTE vs Subquery \| docs.getdbt.com](https://docs.getdbt.com/terms/cte#cte-vs-subquery).

## 2. CTE Groupings

When creating CTEs, we should aim to use four logical groupings of CTEs:

- '**Import**' CTEs
- '**Logical**' CTEs
- '**Final**' CTE
- A simple SELECT statement

In practice, this would look like something similar to this:

<details>

<summary>Click to expand</summary>

```sql
with

import_orders as (
    -- query only non-test orders
    select * from {{ source('jaffle_shop', 'orders') }}
    where amount > 0
),

import_customers as (
    select * from {{ source('jaffle_shop', 'customers') }}
),

logical_cte_1 as (

    -- perform some math on import_orders

),

logical_cte_2 as (

    -- perform some math on import_customers
),

final_cte as (

    -- join together logical_cte_1 and logical_cte_2
)

SELECT * FROM final_cte
```

</details>

---

## 3. Grouping Descriptions

### Import CTEs

These should be 'base queries', initially referencing your source table for later use:

```sql
base_orders as (

    SELECT *
    FROM {{ source('jaffle_shop', 'orders') }}
),

base_customers as (
    SELECT *
    FROM {{ source('jaffle_shop', 'customers') }}
),
```

### Logical CTEs

Use logical CTEs to perform some preparation/transforms on the base tables.

```sql
customers as (

    -- perform some preparation/transforms on base_customers
    SELECT first_name || ' ' || last_name AS name,
    *
    FROM base_customers
),

orders as (

    -- perform some preparation/transforms on base_orders

)
```

### Final CTE

Join together your logical CTEs:

```sql
final_cte as (
    -- join together orders and customers
)
```

### Simple Select Statement

Perform your final SELECT statement:

```sql
SELECT *
FROM final_cte
```
