## Main SQLFluff Commands

You can use SQLFluff to either lint (i.e., highlight problems) or fix your SQL code in place. E.g.:

Command | Description
--------|------------
`sqlfluff lint <sql file>` | This is used to lint input SQL files
`sqlfluff fix <sql file>` | This is used to fix input SQL files

Note: you can run sqlfluff commands against a directory of SQL files, rather than individual files, e.g.: `sqlfluff lint models/base/caledon/`

## Handy Tips

Tip | Description | Solution | Example
----|-------------|----------|--------
Use the `--FIX-EVEN-UNPARSABLE` arg | To significantly accelerate SQLFluff development, I recommend using the arg `--FIX-EVEN-UNPARSABLE`.<br/><br/>When SQLFluff renders your SQL, it encounters Jinja syntax, which can be problematic, e.g.:<br><br>* `{{ source() }}`<br><br>* `{{ ref() }}`<br><br>Though even more problematic is when SQLFluff encounters custom dbt Macros we’ve created, e.g.:<br><br>* `{{ meta_columns }}`<br><br>* `{{ limit_rows }}` | By using the --FIX-EVEN-UNPARSABLE arg, you’re telling SQLFluff to:<br/><br/>* Not try to attempt to render this Jinja<br/>* Skip past any unparsable sections - which are often encountered by custom macros. | `sqlfluff fix <sql_file> --FIX-EVEN-UNPARSABLE`
Use the `--ignore=templating` arg | Similar (but not as effective at the above), you can use the arg `--ignore=templating` to help SQLFluff parse your SQL. | By using the `--ignore=templating` arg, you’re telling SQLFluff to not try to attempt to render this Jinja.<br><br>This in turn removes any linting errors that are caused by Jinja macros. | `sqlfluff fix <sql_file> --ignore=templating`
Note: Only use this option if time needed to resolve SQLFluff errors is taking too long<br><br/>Use the `pre-commit --no-verify` arg | The biggest issues that arise with using SQLFluff is when people are making changes to files that were created before SQLFluff was used.<br><br>In these scenarios, rather than linting your simple code change, you’re instead having to resolve linting errors that have existed in the SQL file for a long period of time.<br><br>This can be time-consuming and impact the business, particularly if a change needs to be implemented by a certain deadline. | In such scenarios, where deadlines are an issue, or resolving linting errors is taking too long, you can use the `pre-commit --no-verify` option to prevent the pre-commit SQLFluff check from being performed. | `git commit -m "my eg change" --no-verify`
