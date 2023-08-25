# Git PR Creation

## Contents

1. Overview
2. Tools to Implement PR Best Practices

* Git PR Templates
* pre-commit
* CI/CD Pipelines

3. Git PR Creation: Best Practices

---

## 1. Overview

An informative pull request can make the review and merging process smoother. The overall goal is to:

* Avoid ‘nit-picky’ PRs
* Clearly communicate the goal of the PR.

There are a number of best practices that should be followed when creating PRs, described here: [Git PR Creation: Best Practices](link_to_best_practices).

However, there are also a number of tools available to implement these best practices, as described below.

## 2. Tools to Implement PR Best Practices

### Git PR Templates

A Git PR template can greatly assist in:

* Minimising the time/effort required to create a good PR.
* Implementing good practices consistently.

They consist of a pre-defined format that contributors must fill out when creating a new PR. This ensures that PRs:

* Contain all of the necessary information
* Facilitate better collaboration by communicating effectively the purpose of the PR
* Follow established guidelines
* Ultimately create consistency

Shown below is an example Git PR template:

<details>
<summary>Click to expand</summary>
<!-- Paste your Git PR template here -->
</details>

### pre-commit

`pre-commit` is a tool commonly used to help ensure code quality and consistency within a codebase.

It automatically runs a set of checks, tests, and formatting tasks on your code before you commit it to the repository.

Some example pre-commit tests we use to supplement Git PR best practices include:

* `check-added-large-files`: This is used to prevent giant files from being committed.
* `no-commit-to-branch`: Prevents users from pushing their code to protected branches.
* `check-merge-conflict`: Checks if staged files accidentally contain Git merge conflict strings.

### CI/CD Pipelines

CI/CD pipelines can again be used to:

* Minimise the time/effort required to create a good PR.
* Ensure consistent Git standards are being used.

Two key examples are:

* Git branch name validation: Qualifying that the branch name follows pre-defined standards (using REGEX).
* Number of files being committed.

To make your PR easy to understand, it shouldn’t contain too many new/changed files. A CI/CD pipeline can be used to prevent this from happening.

## 3. Git PR Creation: Best Practices

See [Git PR Creation: Best Practices](link_to_best_practices).
