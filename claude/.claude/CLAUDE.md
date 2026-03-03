## Security

NEVER access: `.env`, `.envrc`, `.secrets`, `.vault`, `credentials.json`, `secrets/`
NEVER run: `git push -f`, `git reset --hard`, `rm -rf`, `terraform destroy`, `gcloud * delete`, `bq rm`
OK: `git push --force-with-lease`, `rm` (single file)

Per-repo overrides: `.claude/settings.json` or `.claude/settings.local.json`
