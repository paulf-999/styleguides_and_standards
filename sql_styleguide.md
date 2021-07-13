# SQL Style Guide

This is a stripped back adaptation of the following [SQL style guide](https://www.sqlstyle.guide/).

## Contents
1. Query syntax
    1. Reserved words
    2. White space
    3. Indentation
2. General do's and don'ts
3. Naming conventions
4. Comments

---

## 1. Query syntax

### i. Reserved words
Always use uppercase for reserved keywords like SELECT and WHERE.

### ii. White space

#### Spaces
Spaces should be used to line up the code so that the reserved keywords are all aligned and end on the same character boundary.
Notice that SELECT, FROM, etc. are all right aligned while the actual column names and implementation specific details are left aligned.

    SELECT  f.species_name,
            AVG(f.height) AS average_height, AVG(f.diameter)
    FROM    flora AS f
    WHERE   f.species_name = 'Banksia'
        OR  f.species_name = 'Sheoak'
        OR  f.species_name = 'Wattle'
    GROUP BY f.species_name, f.observation_date

#### Line Spacing
Always include newlines:
* before AND or OR
* after semicolons to separate queries for easier reading
* after each keyword definition
* after a comma when separating multiple columns into logical groups
* to separate code into related sections, which helps to ease the readability of large chunks of code

Keeping all the keywords aligned to the right hand side and the values left aligned creates a uniform gap down the middle of query. It makes it much easier to scan the query definition over quickly too.

    SELECT  a.title,
            a.release_date, a.recording_date, a.prod_date -- grouped dates together
    FROM    albums AS a
    WHERE   a.title = 'Charcoal Lane'
        OR  a.title = 'The New Danger';

### iii. Indentation

#### Joins

Joins should be indented and placed on a new line.

    SELECT  c.last_name
    FROM    customers AS c
        INNER JOIN bikes AS b
        ON r.bike_vin_num = b.vin_num
        AND b.engine_tally > 2

#### Subqueries

Subqueries should also be aligned to the right side of the river and then laid out using the same style as any other query.

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

## 2. General do's and don'ts

### Do
* Always use the singular name and avoid plurals
* Use underscores where you would naturally include a space in the name (first name becomes first_name)
* Always use lowercase except where it may make sense not to such as proper nouns
* Avoid abbreviations and if you have to use them make sure they are commonly understood
* Names must begin with a letter and may not end with an underscore
* Only use letters, numbers and underscores in names

### Avoid
* CamelCase - it is difficult to scan quickly
* Plurals - use the more natural collective term where possible instead. For example, staff instead of employees or people instead of individuals.

---

## 3. Naming conventions

### Tables
Do not prefix with tbl or any other such descriptive prefix.

### Columns
Where possible avoid simply using id as the primary identifier for the table.

### Aliasing
Always use the AS keyword.

---

## 4. Comments

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
