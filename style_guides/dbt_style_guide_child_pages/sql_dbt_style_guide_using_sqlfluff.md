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
# For a full reference of the SQLFluff rules, see https://docs.sqlfluff.com/en/stable/rules.html
[sqlfluff]
dialect = snowflake
templater = dbt # The dbt templater is slower than the jinja templater, as it first compiles the dbt code into data warehouse code. If you don't need to use the dbt templater, uncomment the line below
# templater = jinja
#-----------------------------------------------------------------------------------
runaway_limit = 10 # Number of passes to run before admitting defeat
max_line_length = 120
sql_file_exts = .sql,.sql.j2,.dml,.ddl
large_file_skip_byte_limit = 30000 # Very large files can make the parser effectively hang

#-----------------------------------------------------------------------------------
# General Formatting Rules
#-----------------------------------------------------------------------------------
[sqlfluff:indentation]
indent_unit = space
tab_space_size = 4
indented_joins = true
indented_using_on = true
template_blocks_indent = true

# Comma rules
[sqlfluff:layout:type:comma]
line_position = leading
[sqlfluff:rules:convention.select_trailing_comma]  # trailing commas within select clauses
select_clause_trailing_comma = forbid

# Capitalisation rules
[sqlfluff:rules:capitalisation.keywords]  # Inconsistent capitalisation of keywords.
capitalisation_policy = upper
[sqlfluff:rules:capitalisation.identifiers] # Unquoted identifiers.
extended_capitalisation_policy = upper
ignore_words = None
[sqlfluff:rules:capitalisation.functions]  # Inconsistent capitalisation of function names.
extended_capitalisation_policy = upper
[sqlfluff:rules:capitalisation.literals]  # Inconsistent capitalisation of null & boolean literals.
capitalisation_policy = upper
[sqlfluff:rules:capitalisation.types] # Inconsistent capitalisation of data types.
extended_capitalisation_policy = upper

# Other
[sqlfluff:rules:ambiguous.column_references]  # Use column names in group by statements.
group_by_and_order_by_style = explicit
[sqlfluff:rules:aliasing.length] # The minimum length of an alias to allow without raising a violation.
min_alias_length = 3
# Some rules can be configured from the config common to other rules
[sqlfluff:rules]
allow_scalar = true
single_table_references = unqualified # table references aren't necessary in statements with a single table.
unquoted_identifiers_policy = all

#-----------------------------------------------------------------------------------
# Templater rules
#-----------------------------------------------------------------------------------
[sqlfluff:templater]
unwrap_wrapped_queries = true

[sqlfluff:templater:dbt] # pass in our dbt project/cred details
project_dir =
profiles_dir =
profile =

[sqlfluff:templater:dbt:context] # Default values for custom DBT macro context

[sqlfluff:templater:jinja]
apply_dbt_builtins = true
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
