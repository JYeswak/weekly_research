# Cloud agent: Runner

Only after Joshua pastes: freeze hash, system id, revision, task id, remaining cap (agent-hours + human minutes).

## Destination (unambiguous)

- **Private lab repo or Ultra campaign dir** — full bundle before the VM dies:
  `inputs/`, `config.json`, `stdout.log`, `stderr.log`, `exit.txt`, `usage.json` (tokens/agent-hours if visible), `sha256sums.txt`.
- **Public PR** — sanitized note only (`docs/step0/notes/runs/<system>-<task>-<trial>.md`): pass/fail/blocked, hashes of private files, no secrets, no restricted excerpts.

Do not leave the only copy in `/tmp`. Do not paste 80 log lines to a public PR.

Do not read `docs/step0/oracles`. Do not edit `wr_plan_v1.md`.
Stop when the pasted cap is hit.
