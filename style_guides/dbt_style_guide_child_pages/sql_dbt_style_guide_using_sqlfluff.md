# SQL/dbt Style Guide using SQLFluff

:bulb: The purpose of this page is to describe how SQLFluff is to be used to enforce SQL styling and formatting.

---

## Contents

1. SQLFluff (SQL Linter)
2. Implementation
   1. Local Developer Install (Prior to Raising Git MRs)
   2. Integration with GitLab CI/CD Pipeline
   3. SQLFluff Configuration (.sqlfluff file)
   4. Apply SQLFluff to dbt Project Files
   5. Using SQLFluff

---

## SQLFluff (SQL linter)

We make use of sqlfluff in order to implement linting and code formatting to our code. As a result of using sqlfluff, we don’t actually need to document our SQL design standards in the same we have for dbt!

**SQLFluff Dialect**

---

## Implementation

SQLFluff is designed to be used both as a utility for developers but also to be part of [CI/CD](https://en.wikipedia.org/wiki/Continuous_integration) pipelines.

### Local Developer Install (Prior to Raising Git MRs)

Using SQLFluff in both scenarios means that our local SQL code can be cleansed and standardised prior to raising a Git merge request.

### Integration with GitLab CI/CD Pipeline

SQLFluff will be implemented as part of a GitLab CI/CD pipeline within our dbt Git repo.

This means that each time a merge request is made on this repo, a series of SQLFluff tests are run to ensure the SQL developed adheres to certain standards.

Note: failure of an SQLFluff test will prevent a merge request from being approved.

### SQLFluff Configuration ( `.sqlfluff` file)

The SQLFluff configuration rules that come ‘out of the box’ have been overwritten to align with our design SQL styles. Shown below is the contents of the `.sqlfluff` file, which amongst other things, can be used as a basis for customising standard SQL standard rules:

```yaml
[sqlfluff]
dialect = snowflake
sql_file_exts = .sql,.sql.j2,.dml,.ddl
# allow aliasing in from clauses and join conditions.
exclude_rules = L031

[sqlfluff:indentation]
indented_joins = true
indented_using_on = true
template_blocks_indent = true

[sqlfluff:layout:type:comma]
line_position = leading

[sqlfluff:templater]
unwrap_wrapped_queries = true

# Some rules can be configured directly from the config common to other rules
[sqlfluff:rules]
tab_space_size = 4
max_line_length = 120
indent_unit = space
allow_scalar = true
single_table_references = consistent
unquoted_identifiers_policy = all

[sqlfluff:rules:L010] # Inconsistent capitalisation of keywords.
capitalisation_policy = upper
[sqlfluff:rules:L028] # References should be consistent in statements with a single table.
single_table_references = unqualified
[sqlfluff:rules:L030] # Inconsistent capitalisation of function names.
capitalisation_policy = upper
[sqlfluff:rules:L038] # trailing commas within select clauses
select_clause_trailing_comma = forbid
[sqlfluff:rules:L040] # Inconsistent capitalisation of boolean/null literal.
capitalisation_policy = upper
```

In addition to the above rules, we can also ensure SQLFluff performs linting/style checks on SQL used our dbt projects. To do so, the following args and parameters need to be passed in (see: Configuration — SQLFluff 1.2.1 documentation )

```yaml
[sqlfluff]
# set the templater
templater = dbt

[sqlfluff:templater:dbt]
# pass in our dbt project/cred details
project_dir = <relative or absolute path to dbt_project directory>
profiles_dir = <relative or absolute path to the directory that contains the profiles.yml file>
profile = <dbt profile>
```

### Using SQLFluff

You can use SQLFluff to either `lint` (i.e., highlight problems) or `fix` your SQL code in place. Run the following to fix the cosmetic rules of your SQL file: `sqlfluff fix <sql file here>`

For an exhaustive list of all SQLFluff rules applied, see: [Rules Reference — SQLFluff 1.2.1 documentation](https://docs.sqlfluff.com/en/stable/rules.html).
