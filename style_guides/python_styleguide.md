# Python Style Guide

Here is a Python style guide following commonly accepted conventions and best practices.

---

## Contents

1. Naming Conventions
2. Code Layout
3. String Formatting
4. Function and Method Definitions
5. Comments and Docstrings
6. Error Handling
7. General Guidelines

---

> ℹ️ **Summary: Use Python Linters and Automatters to Facilitate the Implementation of Coding Standards**
>
> * Implementing the below styles/coding standards requires proactive efforts from end users.
> * I recommend teams use Linters and code autoformatters to maintain code quality and standardised formatting.
> * For more information, see Python - Linting and Auto-Formatting.


## 1. Naming Conventions

In summary:

1. Use `snake_case` for all module, package, function and variable names.
2. Use `CamelCase` for classes.
3. Use `SCREAMING_SNAKE_CASE` for constants.

<details>

<summary>What is `snake_case`?</summary>

snake_case combines words by replacing each space with an underscore (_), and all letters are lowercase, as follows:

Raw: user login count
Snake case: user_login_count
* The following link explains the differences between different case styles.
* One of the benefits of snake_case is that many of the allowed characters are compatible across S3 and Snowflake.

</details>

### Case Style Specification

* Module names: `lowercase_with_underscores.py`
* Package names: `lowercase_with_underscores`
* Class names: `CamelCase`
* Function and method names: `lowercase_with_underscores`
* Variable names: `lowercase_with_underscores`
* Constants: `UPPERCASE_WITH_UNDERSCORES`

### 1.2. Avoid Abbreviations

• Function names, variables and filenames should all be meaningful, descriptive, and eschew abbreviations.

<details>

<summary>For example (click to expand)</summary>

Good
def load_customer_data():
Bad
def load_data():

</details>

•	Don’t use abbreviations that are ambiguous to readers outside your projects
•	Don’t abbreviate by deleting letters within a word


---

## 2. Code Layout

* Use 4 spaces for indentation (avoid tabs).
* Limit lines to a maximum of 79 characters.
* Use a newline after imports and before the class or function definition.
* Separate methods and classes with two blank lines.
* Use a single space around operators and after commas.

---

## 3. Imports

* Import modules on separate lines.
* Use absolute imports whenever possible.
* Avoid wildcard imports (`from module import *`).
* Place imports in the following order: standard library modules, third-party modules, local modules.

---

## 4. Comments

* Use inline comments sparingly and keep them concise.
* Use docstrings to document modules, classes, methods, and functions.
* Write clear, self-explanatory code and minimize the need for comments.

---

## 5. Strings

* Use single quotes for string literals.
* Use double quotes inside strings to avoid escaping.
* Use triple quotes for docstrings and multi-line strings.

---

## 6. Function and Method Definitions

* Define function parameters without spaces around the equals sign.
* Use a single space after the comma in function definitions.
* Place default arguments at the end of the argument list.

---

## 7. Control Structures

* Use a space after commas in control structures (e.g., `if`, `for`, `while`).
* Avoid unnecessary parentheses around conditions.
* Use a blank line before a `return` statement if it improves readability.

---

## 8. Error Handling

* Prefer specific exceptions over catching all exceptions (`except Exception:`).
* Use `try-except-else` blocks when possible.
* Use `finally` blocks sparingly and only when necessary.

---

## 9. Miscellaneous

* Use meaningful variable and function names.
* Avoid using mutable types as default arguments.
* Use list comprehensions and generator expressions for concise and readable code.
* Follow [PEP 8 guidelines](https://pep8.org/) for any conventions not covered here.


Remember, consistency is key when it comes to style guides. It's essential to follow the established style within a project or organization to maintain code readability and maintainability.
