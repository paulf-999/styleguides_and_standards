# CTE Styleguide

`with`

## Import CTEs

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

## Logical CTEs

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

## Final CTE

Join together your logical CTEs:

```sql
final_cte as (
    -- join together orders and customers
)
```

## Simple Select Statement

Perform your final SELECT statement:

```sql
SELECT *
FROM final_cte
```
