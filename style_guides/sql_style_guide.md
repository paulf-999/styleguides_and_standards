# SQL Style Guide

This is a stripped back adaptation of the following [SQL style guide](https://www.sqlstyle.guide/).

## Contents

1. Summary: General Do's and Don'ts
2. Query Syntax
3. Naming Conventions
4. Joins
5. Ordering
6. Commenting

---

## 1. Summary: General Do's and Don'ts

### Do's

| Attribute | Description |
| --------- | ---------------------------- |
| Use `SQLFluff` | * We make use of [sqlfluff](https://github.com/sqlfluff/sqlfluff) to implement code formatting and linting to our SQL code.<br/>* As a result, we don’t need to spent too much time documenting our SQL design standards!<br/>* We can use it to define the basic structure and style of the SQL that we write and move the review of that structure and style into the hands of the authors. |
| Use `snake_case` | I.e.:<br/> * Only use letters, numbers and underscores in names.<br/>* Use underscores where you would naturally include a space in the name.<br/>E.g., `first name` would become `first_name`.<br/>* Names must begin with a letter and may not end with an underscore. |
| Use CTEs & Jinja | * Make your code DRY using CTEs and Jinja.<br/>* If you type the same line twice, it needs to be maintained in two places. |
| Use the **singular name** | * Use the **singular name** and avoid plurals. |

### Don'ts

| Attribute | Description |
| --------- | ---------------------------- |
| Use `CamelCase` | * It is difficult to scan quickly. |
| Use subqueries | Aim to use CTE statements over subqueries. |
| Use **plurals** | * Use the more natural collective term where possible instead.<br/>* E.g., use staff instead of employees or people instead of individuals. |
| Use **abbreviations** | * If you have to use them, make sure they are commonly understood. |

---

## 2. Query Syntax

| Attribute | Description | Example                  |
| --------- | ---------------------------- | ------- |
| Commas | Use trailing commas. | - |
| Reserved words | Always use uppercase for reserved keywords like `SELECT` and `WHERE`. | - |
| Reserved words | Always use uppercase for functions. | `SELECT MAX(revenue)` |
| Line Spacing | Always include newlines:<br/>* Before `AND` or `OR`<br/>* After each keyword definition<br/>I.e., after every: `SELECT`, `FROM`, `WHERE`, `JOIN`, `ON`<br/> | `SELECT` [columns]<br/>`FROM` [tables]<br/>`WHERE` [conditions]<br/>`AND` [condition]<br/>`OR` [condition]<br/>`LEFT JOIN` [table]<br/>`ON` [conditions] |

---

## 3. Naming Conventions

| Attribute | Description |
| --------- | ---------------------------- |
| Tables | Do not prefix with tbl or any other such descriptive prefix. |
| Columns | Where possible avoid simply using id as the primary identifier for the table. |
| Aliasing | Always use the AS keyword. |

---

## 4. Joins

| Attribute | Description |
| --------- | ---------------------------- |
| Joins | Joins should be indented and placed on a new line. For example: |

```sql
SELECT  c.last_name
FROM    customers AS c
    INNER JOIN bikes AS b
    ON r.bike_vin_num = b.vin_num
        AND b.engine_tally > 2
```

| Attribute | Description |
| --------- | ---------------------------- |
| Joining Multiple tables | If joining two or more tables, _always_ prefix your column names with the table alias.<br/>If only selecting from one table, prefixes are not needed. |
| Explicit joins | Be explicit about your join. I.e.:<br/>* Write `INNER JOIN` instead of `JOIN`.<br/>* `LEFT JOINs` are normally the most useful<br/>* `RIGHT JOINs` often indicate that you should change which table you select `from` and which one you `join` to.<br/>* `UNION ALL`: aim to use `UNION ALL` as opposed to `UNION` [*](http://docs.aws.amazon.com/redshift/latest/dg/c_example_unionall_query.html) |

---

## 5. Ordering

| Attribute | Description |
| --------- | ---------------------------- |
| Field ordering | Fields should be stated before aggregates/window functions. |
| Aggregations | Aggregations should be executed as early as possible before joining to another table. |
| Ordering/grouping by number | * Ordering and grouping by a number (eg. group by 1, 2) is preferred over listing the column names (see [this rant](https://blog.getdbt.com/write-better-sql-a-defense-of-group-by-1/) for why).<br/>Note that if you are grouping by more than a few columns, it may be worth revisiting your model design. |

---

## 6. Commenting

Include comments in SQL code where necessary. Use the C style opening `/*` and closing `*/` where possible otherwise precede comments with `--` and finish them with a new line.

```sql
SELECT file_hash  --  inline comment here
FROM file_system
WHERE file_name = '.abc';
```

Example with C style opening `/*` and closing `*/`

```sql
/* Updating the file record after writing to the file */
UPDATE file_system
SET file_modified_date = '1980-02-22 13:19:01.00000',
    file_size = 209732
WHERE file_name = '.abc';
```
