1. Typical Git Workflow

**Step 1 - Create Your Feature Branch**

You'll first need to create your changes on your own feature branch.

| Git Command           | Description                          | Example                     |
|-----------------------|--------------------------------------|-----------------------------|
| `git pull`            | You first need to make sure you've got the latest code changes. | Run `git pull` to get the latest code changes. |
| `git checkout master` | Make sure you're first on the master branch. | `git checkout master` |
| `git pull`            | -                                    | `git pull`                  |
| `git checkout -b <new_branch_name>` | You should make your changes on a separate feature branch - i.e., to silo your proposed changes. In the future, feature branches should be named with a `feature/` prefix. E.g.: `feature/<your-change-here>` | `git checkout master`<br>`git checkout -b feature/my_new_feature` |

**Step 2 - Add & Push your Feature Branch Changes**

| Git Command       | Description                                                  | Example                                  |
|-------------------|--------------------------------------------------------------|------------------------------------------|
| `git add <filename>`        | This is used to 'stage' the adding of files to your git feature branch. To 'stage' your files is to identify the files you'd like to push to git. Avoid using `git add *` as this leads to unintentionally adding files to git, e.g., accidentally adding sensitive files. Instead, you should look to add individual files to git, i.e.: `git add <filename>` | `git add my_example_dbt_model.sql`       |
| `git commit -m "<message here>"` | This command specifies the message you want to send in your git push. | `git commit -m "this is my change description"` |
| `git push -u origin <feature branch name here>` | This is to push your changes to the remote git repo - i.e., have your code changes visible on the GitHub UI. | `git push -u origin feature/my_new_feature` |
