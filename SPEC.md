# weekly_research specification

Frozen from the planning session (2026-09-27/28). Amendments need a date and reason.

## Product

- Repo: `JYeswak/weekly_research` (public)
- CLI: `wr` — operator and agent entry (`--robot` JSON)
- Install: `curl | bash` `scripts/install.sh` on the Ultra; `uv tool install` / `pipx install` from this repo on other machines
- Init: `wr init --week YYYY-Www` copies `weeks/_template`; `wr init --skill` copies the skill into the agent surface
- Agent skill: `skills/weekly-research/`

## Locks

| ID | Decision |
|---|---|
| Q4 | Local proposer + NIM secondary URL lists |
| Q11 | Isolated proposers; Verified needs second path |
| Q12 | Export kit; optional Opus; human signs |
| Q13 | Twelve verbs |
| Q14 | W2 shells only; no Opus until reviews exist |
| Q15 | Jev fail-open |
| Q16 | sqlite3 file; fsqlite optional |
| Q18 | Typed repair budget |
| Q19–Q23 | public repo; pin=inbox; license class; all classes + MCP; optional hosts |
| Q24 | L0 PASS → fmd PDF + mermaid PNG (DRAFT if unsigned) |
| Q25 | doctor FAIL: extras + gitignore + sqlite + fmd + mermaid. WARN: jev, focr, MCP, yt-dlp |
| Q30 | worker command or url |
| Q31 | Both installers: curl script + uv/pipx |

## Agent ergonomics

- `--robot` on every verb
- Non-zero exit is the gate
- Skill forbids `wr sign` and snap commits
- `wr init` is the only week-folder constructor

## Open

Robot JSON schema? episode 1 brief? cron weekday? Drive connector? local MCP URLs?
