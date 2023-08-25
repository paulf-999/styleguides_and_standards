# Git PR Creation: Best Practices

## Contents

1. Best Practices Addressed by Tools We Use
2. Best Practices for Git PR Creation
3. Checklist for a Good Git PR Creation

---

## 1. Best Practices Addressed by Tools We Use

Many of the best practices described below are addressed by the tools we use as a team.

As such, the icons below are used to indicate that the best practice is addressed by:

- :clipboard: A Git PR template
- :construction: CI/CD pipelines

---

## 2. Best Practices for Git PR Creation

Here are some good practices to follow when creating a pull request:

### 1. Clear Title and Description :clipboard

Can be addressed using a Git PR template.

- **Title:** Should be concise and descriptive, summarizing the purpose of the pull request.
- **Description:** Should provide context about the changes, the problem being addressed, and the solution being proposed.

### 2. Consistent Git Branch Naming :construction

Can be addressed using a CI/CD pipeline.

- Git branch naming standards are again largely used to help collaboration/communication.
- Without pre-defined standards, multiple variations of standards/conventions can accidentally be used over time - causing miscommunication issues.

### 3. Avoid Large Changes/Keep Changes Focused :construction

Can be addressed/prevented using a CI/CD pipeline.

**Avoid Large Changes:**

- Large PRs are harder to review and tend to introduce more complex issues.
- Whenever possible, break down large changes into smaller, manageable PRs.

**Keep Changes Focused:**

- This means we should avoid bundling unrelated changes into a single PR.

### 4. Regular Commits and Meaningful Messages

Make frequent and atomic commits that logically group related changes.
Use clear commit messages that explain what was done and why.

---

## 3. Checklist for a Good Git PR Creation

- Clear Title and Description :clipboard:
- Consistent Git Branch Naming :construction:
- Avoid Large Changes/Keep Changes Focused :construction:
- Regular Commits and Meaningful Messages
