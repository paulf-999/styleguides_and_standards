# Summary of Hooks (I.e., Tests)

Listed below are the set of the `pre-commit` tests used in this repo:

## General Hooks

| Hook | Description |
| -------| -----------------------------|
| [check-added-large-files](https://github.com/pre-commit/pre-commit-hooks#check-added-large-files) | Prevents giant files from being committed. |
| [detect-private-key](https://github.com/pre-commit/pre-commit-hooks#detect-private-key) | Checks for the existence of private keys. |
| [double-quote-string-fix](https://github.com/pre-commit/pre-commit-hooks#double-quote-string-fixer) | Replaces double quoted strings with single quoted strings. |
| [end-of-file-fixer](https://github.com/pre-commit/pre-commit-hooks#end-of-file-fixer) | Ensures that a file is either empty, or ends with one newline. |
| [trailing-whitespace](https://github.com/pre-commit/pre-commit-hooks#trailing-whitespace) | Trims trailing whitespace. |

## JSON/YAML Hooks

| Hook | Description |
| -------| -----------------------------|
| [check-json](https://github.com/pre-commit/pre-commit-hooks#check-json) | Checks json files for parseable syntax. |
| [pretty-format-json](https://github.com/pre-commit/pre-commit-hooks#pretty-format-json) | Verifies all your JSON files are pretty. "Pretty" means keys are sorted & indented. |
| [check-yaml](https://github.com/pre-commit/pre-commit-hooks#check-yaml) | Checks yaml files for parseable syntax. |
| [yamllint](https://github.com/adrienverge/yamllint.git) | A linter for YAML files. |

## Python Hooks

| Hook | Description |
| -------| -----------------------------|
| [check-ast](https://github.com/pre-commit/pre-commit-hooks#check-ast) | Checks whether files parse as valid python |
| [flake8](https://github.com/PyCQA/flake8) | Enforces flake8 style consistency across Python projects. |
| [reorder_python_imports](https://github.com/asottile/reorder_python_imports) | This hook reorders imports in python files. |
| [pyupgrade](https://github.com/asottile/pyupgrade) | This hook automatically upgrades syntax for newer versions |
| [name-tests-test](https://github.com/pre-commit/pre-commit-hooks#name-tests-test) | Verifies Python test files are named correctly - ensure tests match `.*_test\.py` |
| [debug-statements](https://github.com/pre-commit/pre-commit-hooks#debug-statements) | Checks for debugger imports and py37+ `breakpoint()` calls in python source. |

## Git Hooks

| Hook | Description |
| -------| -----------------------------|
| [check-merge-conflict](https://github.com/pre-commit/pre-commit-hooks#check-merge-conflict) | Checks for files that contain merge conflict strings. |
| [no-commit-to-branch](https://github.com/pre-commit/pre-commit-hooks#no-commit-to-branch) | Protect specific branches from direct check-ins |

## Other Hooks

| Hook | Description |
| -------| -----------------------------|
| [sqlfluff](https://github.com/sqlfluff/sqlfluff) | Lints sql files with `SQLFluff`. |
