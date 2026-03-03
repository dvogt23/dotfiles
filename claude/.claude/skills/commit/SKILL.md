---
name: commit
description: "Commit actual git changes conventional"
---

# Git Commit Skill

Create well-formatted git commits following conventional commit standards.

## Usage

```
/commit
```

## Behavior

1. Analyze staged changes with `git diff --staged`
2. Generate a conventional commit message
3. Create the commit with proper formatting
4. Title should be max. 70 chars long
5. Include Ticket ID to the title from the branch name, exactly after the slash / ie PROJ-1234.

## Commit Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Types

- feat: New feature
- fix: Bug fix
- docs: Documentation changes
- style: Code style changes
- refactor: Code refactoring
- test: Adding or modifying tests
- chore: Maintenance tasks

## Example Output

```
feat(auth): PROJ-1234 add password reset functionality

- Add forgot password form
- Implement email verification flow
- Add password reset endpoint
```
