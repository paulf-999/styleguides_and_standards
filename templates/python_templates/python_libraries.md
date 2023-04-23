# Python Libraries

The purpose of this page is to describe a list of standard Python libraries to be installed by team end-users.

Note: I recommend first installing the dbt packages listed below, due to dependencies caused by the library [snowflake-connector-python](https://pypi.org/project/snowflake-connector-python/).

## dbt-Releated libraries

| No. | Python Library Name            | Summary                               |
|-----|--------------------------------|---------------------------------------|
| 1   | [snowflake-connector-python](https://pypi.org/project/snowflake-connector-python/) | Snowflake Connector for Python.    |
| 2   | [dbt-snowflake](https://pypi.org/project/dbt-snowflake/)              | The Snowflake adapter plugin for dbt. |
| 3   | [sqlfluff-templater-dbt](https://pypi.org/project/sqlfluff-templater-dbt/)     | Lint your dbt project SQL.            |
| 4   | [shandy-sqlfmt[jinjafmt]](https://pypi.org/project/shandy-sqlfmt/)    | sqlfmt is an opinionated CLI tool that formats your sql files.            |

## Commonly Used/CLI Tool libraries

| No. | Python Library Name | Summary                                                                       |
|-----|---------------------|-------------------------------------------------------------------------------|
| 1   | [awscliv2](https://pypi.org/project/awscliv2/)            | Wrapper for AWS CLI v2.                                                   |
| 2   | [boto3](https://pypi.org/project/boto3/)               | The AWS SDK for Python.                                                   |
| 3   | [j2cli](https://pypi.org/project/j2cli/)               | Command-line interface to Jinja2 for templating in shell scripts.         |
| 4   | [jq](https://pypi.org/project/jq/)                  | jq is a lightweight and flexible JSON processor.                          |
| 5   | [pre-commit](https://pypi.org/project/pre-commit/)          | A framework for managing and maintaining multi-language pre-commit hooks. |
| 6   | [pytest](https://pypi.org/project/pytest/)              | Simple powerful testing with Python.                                      |
| 7   | [pyyaml](https://pypi.org/project/PyYAML/)              | YAML parser and emitter for Python.                                       |
| 8   | [urllib3](https://pypi.org/project/urllib3/)             | HTTP library with thread-safe connection pooling, file post, and more.    |
| 9   | [s3fs](https://pypi.org/project/s3fs/)                | Convenient Filesystem interface over S3.                                  |
| 10  | [virtualenv](https://pypi.org/project/virtualenv/)          | Virtual Python Environment builder.                                       |
| 11  | [virtualenvwrapper](https://pypi.org/project/virtualenvwrapper/)   | Set of extensions for virtualenv. These include wrappers for creating/deleting virtual environments - making it easier to work on more than one project at a time without introducing conflicts in their dependencies. |
| 12  | [wget](https://pypi.org/project/wget/)                | Pure python download utility.                                             |
| 13  | [yq](https://pypi.org/project/yq/)                  | Command-line YAML/XML processor - jq wrapper for YAML/XML documents.      |

## Code Quality libraries

| No. | Python Library Name | Summary                                                |
|-----|---------------------|--------------------------------------------------------|
| 1   | [black](https://pypi.org/project/black/)           | The uncompromising code formatter.                     |
| 2   | [flake8](https://pypi.org/project/flake8/)          | The modular source code checker: pep8 pyflakes and co. |
| 3   | [pylint](https://pypi.org/project/pylint/)          | Python code static checker.                            |
| 4   | [sqlfluff](https://pypi.org/project/sqlfluff/)        | The SQL Linter for Humans.                             |

## File Parsing libraries

| No. | Python Library Name     | Summary                                                                  |
|-----|-------------------------|--------------------------------------------------------------------------|
| 1   | [numpy](https://pypi.org/project/numpy/)               | Fundamental package for array computing in Python.<br/>Prerequisite for pandas.                       |
| 2   | [openpyxl](https://pypi.org/project/openpyxl/)            | A Python library to read/write Excel 2010 xlsx/xlsm files.               |
| 3   | [pandas](https://pypi.org/project/pandas/)              | Powerful data structures for data analysis, time series, and statistics. |

## Database-Related libraries

| No. | Python Library Name            | Summary                                                                                                                  |
|-----|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| 1   | [duckdb](https://pypi.org/project/duckdb/)                     | DuckDB embedded database.                                                                                                |
| 2   | [pymssql](https://pypi.org/project/pymssql/)                    | DB-API interface to Microsoft SQL Server for Python.                                                                     |
| 3   | [pyodbc](https://pypi.org/project/pyodbc/)                     | pyodbc is an open source Python module that makes accessing ODBC databases simple.                                       |
| 4   | [snowflake-connector-python](https://pypi.org/project/snowflake-connector-python/) | Snowflake Connector for Python.                                                                                          |
| 5   | [SQLAlchemy](https://pypi.org/project/SQLAlchemy/)                 | Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL. |

## Airflow-Related libraries

| No. | Python Library Name      | Summary                                                       |
|-----|--------------------------|---------------------------------------------------------------|
| 1   | [apache-airflow](https://pypi.org/project/apache-airflow/)       | Programmatically author, schedule and monitor data pipelines. |
| 2   | [gunicorn](https://pypi.org/project/gunicorn/)             | WSGI HTTP Server for UNIX.                                    |
| 3   | [pendulum](https://pypi.org/project/pendulum/)             | Python datetimes made easy.                                   |
| 4   | [pyarrow](https://pypi.org/project/pyarrow/)              | Python library for Apache Arrow.                              |
| 5   | [pylint-airflow](https://pypi.org/project/pylint-airflow/)       | A Pylint plugin to lint Apache Airflow code.                  |

## General Purpose/Other libraries

| No. | Python Library Name      | Summary                                                                 |
|-----|--------------------------|-------------------------------------------------------------------------|
| 1   | [diagrams](https://pypi.org/project/diagrams/)             | Diagram as Code.                                                        |
| 2   | [Faker](https://pypi.org/project/Faker/)                | Faker is a Python package that generates synthetic (fake) data for you. |
| 3   | [humanfriendly](https://pypi.org/project/humanfriendly/)        | Human-friendly output for text interfaces using Python.                 |

---

## How to Install

The following libraries can be installed in bulk by:

1. Storing the collated list with a `requirements.txt` file
2. Installing the libraries in bulk using the following (terminal) pip command: `pip install -r requirements.txt`
