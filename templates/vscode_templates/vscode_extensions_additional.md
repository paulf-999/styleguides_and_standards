# VSCode Extensions: Additional

Listed below is the standard set of VSCode extensions to be used by the team:

## Code Standardisation Extensions

|    | VSCode Extension | Description                  | Criticality<br/>(Must, Should, Could, Want) | Comments |
| -- | -------| ----------------------------- | --- | --- |
| 1 | [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) | • Prettier is an opinionated code formatter.<br/>• It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary. | Must | Tool to help seamlessly standardise team code. |
| 2 | [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | Provides:<br/>1. YAML validation - detects whether the entire file is valid yaml<br/>2. Auto completion - auto completes on all commands<br/>3. Hover support - hovering over a node shows description if provided by schema<br/>4. Formatter - Allows for formatting the current file | Must | Very useful for dbt development, e.g., for source/schema.yml files. |
| 3 | [Prettify JSON](https://marketplace.visualstudio.com/items?itemName=mohsen1.prettify-json) | Prettify ugly JSON inside VSCode. | Must | Tool to help seamlessly standardise team code. |
| 4 | [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) | A basic spell checker that works well with code and documents. | Must | • Prevents grammar typos from entering code.<br/>• Should also add the following VSCode setting to ensure it uses en-GB:<br/>`"cSpell.language": "en-GB"` |
| 5 | [Change Case](https://marketplace.visualstudio.com/items?itemName=wmaurer.change-case) | Quickly change the case of the current selection or current word. | Should |  |

## Standardisation Extensions: Python-Specific

|    | VSCode Extension | Description                  | Criticality<br/>(Must, Should, Could, Want) | Comments |
| -- | -------| ----------------------------- | --- | --- |
| 1 | [AutoDocstring - Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) | Quickly generate docstrings for python functions. | Must | Strongly recommend this - provides functionality to easily add Docstring comments to your Python functions. |
| 2 | [isort](https://marketplace.visualstudio.com/items?itemName=ms-python.isort) | Reorders and tidies your python import code. | Must | Simple but good for standardising code. |
| 3 | [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments) | Improve your code commenting by annotating with alert, informational, TODOs, and more. | Should |  |

## Extensions to Streamline End-User Development

|    | VSCode Extension | Description                  | Criticality<br/>(Must, Should, Could, Want) | Comments |
| -- | -------| ----------------------------- | --- | --- |
| 1 | [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight) | Highlight `TODO`, `FIXME` and other annotations within your code.<br/>Sometimes you forget to review the `TODOs` you've added while coding before you publish the code to production. So I've been wanting an extension for a long time that highlights them and reminds me that there are notes or things not done yet. | Should | Helps to prevent notes from entering source controlled code. |
| 2 | [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) | Visual Studio Code plugin that autocompletes filenames. | Should |  |
| 3 | [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow) | • Makes indentation easier to read.<br/>• This extension colourises the indentation in front of your text, alternating four different colors on each step. | Should |  |
| 4 | [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) | Highlight CSV and TSV files, run SQL-like queries. | Should |  |
| 5 | [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) | Markdown linting and style checking. | Should | • Improves README/markdown documentation, e.g., for Git repos.<br/>• Also has a 'preview' feature to aid Markdown development in VSCode.  |
| 6 | [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) | Makes it easy to build, manage, and deploy containerized applications from Visual Studio Code. It also provides one-click debugging of Node.js, Python, and .NET Core inside a container. | Should |  |
| 7 | [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) | Material Design Icons for Visual Studio Code | Could |  |

## Python-Specific Extensions to Help Streamline End-User Development

|    | VSCode Extension | Description                  | Criticality<br/>(Must, Should, Could, Want) | Comments |
| -- | -------| ----------------------------- | --- | --- |
| 1 | [Python indent](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent) | Ensures your code is correctly indented during code development. | Should |  |
| 2 | [Python Type Hint](https://marketplace.visualstudio.com/items?itemName=njqdev.vscode-python-typehint) | Provides type hint auto-completion for Python, with completion items for:<br/>• Built-in types,<br/>• Classes,<br/>• and the typing module.| Should |  |
