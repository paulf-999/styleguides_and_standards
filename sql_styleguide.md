# SQL Style Guide

This is a stripped back adaptation of the following [SQL style guide](https://www.sqlstyle.guide/).

## Contents

1. General
2. Naming conventions
3. Query syntax
4. Ordering
5. Comments

---

## 1. General

* Indentation: indents should be four spaces, except for predicates, which should line up with the `WHERE` keyword.
* Line length: lines of SQL should be no longer than 80 characters

## 2. Naming conventions

### General do's and don'ts

*Do*

* Always use the singular name and avoid plurals
* Use `snake_case`, i.e.:
    * Only use letters, numbers and underscores in names
    * Use underscores where you would naturally include a space in the name (e.g., `first name` would become `first_name`)
    * Names must begin with a letter and may not end with an underscore
* **Aliasing**: when aliasing, always use the `AS` keyword

*Avoid*

* `CamelCase`: it is difficult to scan quickly
* Plurals: use the more natural collective term where possible instead.
    * For example, staff instead of employees or people instead of individuals.
* Abbreviations: if you have to use them, make sure they are commonly understood
* Prefixing table names with `tbl` or any other such descriptive prefix.
* For columns - avoid simply using `id` as the primary identifier for the table

---

## 3. Query syntax

* **Commas**: Use trailing commas
* **Reserved words**: Always use uppercase for reserved keywords like `SELECT` and `WHERE`.
* Spaces: spaces should be used to line up the code so that the reserved keywords are all aligned and end on the same character boundary.
Notice that `SELECT`, `FROM`, etc. are all right aligned while the actual column names and implementation specific details are left aligned.

    SELECT      f.species_name,
                AVG(f.height) AS average_height, AVG(f.diameter)
    FROM        flora AS f
    WHERE       f.species_name = 'Banksia'
        OR      f.species_name = 'Sheoak'
        OR      f.species_name = 'Wattle'
    GROUP BY    f.species_name, f.observation_date

* Line Spacing: always include newlines in the following scenarios:
    * Before `AND` or `OR`
    * After semicolons to separate queries for easier reading
    * After each keyword definition
    * After a comma when separating multiple columns into logical groups
    * To separate code into related sections, which helps to ease the readability of large chunks of code

Keeping all the keywords aligned to the right hand side and the values left aligned creates a uniform gap down the middle of query. It makes it much easier to scan the query definition over quickly too.

    SELECT  a.title,
            a.release_date, a.recording_date, a.prod_date -- grouped dates together
    FROM    albums AS a
    WHERE   a.title = 'Charcoal Lane'
        OR  a.title = 'The New Danger';

#### Joins

* Joins should be indented and placed on a new line:

        SELECT  c.last_name
        FROM    customers AS c
            INNER JOIN bikes AS b
            ON r.bike_vin_num = b.vin_num
            AND b.engine_tally > 2

* Joining multiple tables: if joining two or more tables, _always_ prefix your column names with the table alias. If only selecting from one table, prefixes are not needed.
* Explicit joins: be explicit about your join (i.e. write `inner join` instead of `join`). `left joins` are normally the most useful, `right joins` often indicate that you should change which table you select `from` and which one you `join` to.
* Avoid table aliases in join conditions: especially initialisms. It's harder to understand what the table called "c" is compared to "customers".
* `UNION ALL`: aim to use `UNION ALL` as opposed to `UNION` [*](http://docs.aws.amazon.com/redshift/latest/dg/c_example_unionall_query.html)
#### Sub-queries

Sub-queries should also be aligned to the right side of the river and then laid out using the same style as any other query.

    SELECT  r.last_name,
            (SELECT MAX(YEAR(championship_date))
                FROM champions AS c
                WHERE c.last_name = r.last_name
                AND c.confirmed = 'Y') AS last_championship_year
    FROM    riders AS r
    WHERE   r.last_name IN
            (SELECT c.last_name
                FROM champions AS c
                WHERE YEAR(championship_date) > '2008'
                AND c.confirmed = 'Y');

---

## 4. Ordering

* Fields should be stated before aggregates / window functions
* Aggregations should be executed as early as possible before joining to another table.
* Ordering and grouping by a number (eg. group by 1, 2) is preferred over listing the column names (see [this rant](https://blog.getdbt.com/write-better-sql-a-defense-of-group-by-1/) for why). Note that if you are grouping by more than a few columns, it may be worth revisiting your model design.

---

## 5. Comments

Include comments in SQL code where necessary. Use the C style opening `/*` and closing `*/` where possible otherwise precede comments with `--` and finish them with a new line.

    SELECT file_hash  -- stored ssdeep hash
    FROM file_system
    WHERE file_name = '.vimrc';

Example with C style opening `/*` and closing `*/`

    /* Updating the file record after writing to the file */
    UPDATE file_system
    SET file_modified_date = '1980-02-22 13:19:01.00000',
        file_size = 209732
    WHERE file_name = '.vimrc';
