---
name: create-pr
description: "Create a github pr with all the details"
---

# Pull Request Skill

Create well-documented pull requests with comprehensive descriptions.

## Usage

```
/create-pr
```

## Behavior

1. Analyze commits since branching from main
2. Generate a descriptive PR title
3. Create detailed description with:
   - Summary of changes
   - QA Testing instructions
   - Screenshots (if UI changes)
4. Create PR via `gh pr create`
5. Assign this PR to me

## PR Template

```markdown
## Ticket

Ticket ID link to jira

## Task description

Brief description of changes

- List of specific changes made

## QA Testing

How to test these changes

- List of steps

## Screenshots

(if applicable)

## Aditional Notes (optional)

Some notes for deployment settings changed in this PR
```

## Requirements

- GitHub CLI (`gh`) installed and authenticated
- On a feature branch (not main)
