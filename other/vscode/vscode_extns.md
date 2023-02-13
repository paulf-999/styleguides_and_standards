# VSCode Extensions

Listed below are the set of the minimum VSCode extensions to be used by the team.

| No | VSCode Extension | Description                  | Criticality<br/>(Must, Should, Could, Want) | Comments |
| -- | -------| ----------------------------- | --- | --- |
| 1 | [dbt Power User](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user) | This extension makes vscode seamlessly work with dbt. With this extension, you’re able to use the UI to:<br/><br/>* Run a dbt model using the play button in the UI<br/>* Execute all or individual model tests<br/>* View query results<br/><br/>Other core features:<br/><br/>* Generate models from your source definitions<br/>* Autocompletion of models, macros, sources and docs<br/>* dbt logs viewer (force tailing) | Must | Key for transitioning dbt Cloud users to dbt Core. |
| 2 | [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) | Popular extension with rich support for Python that includes features such as:<br/><br/>* IntelliSense (Pylance)<br/>* Linting<br/>* Debugging<br/>* Code navigation<br/>* Code formatting<br/>* Refactoring | Must | * An industry standard extension for Python developers, when using VSCode.<br/>* Will be very useful for dbt development. |
| 3 | [Snowflake](https://marketplace.visualstudio.com/items?itemName=snowflake.snowflake-vsc) | Connect to Snowflake, write and execute sql queries, and view results without leaving VS Code. | Must | Means we can work towards having a single IDE for all of our development, rather than switch between dev environments. E.g., the Snowflake UI or DataGrip. |
