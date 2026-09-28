# weekly_research specification

Frozen from the planning session (2026-09-27/28). Amendments need a date and reason.

## Product

- Repo: `JYeswak/weekly_research` (public)
- CLI: `wr` — operator and agent entry (`--robot` JSON)
- Install: curl `scripts/install.sh` on the Ultra; uv/pipx from this repo elsewhere
- Init: `wr init --week YYYY-Www`; `wr init --skill`
- Agent skill: `skills/weekly-research/`
- Mailbox: local `mailbox/` now; Google Drive early in implementation

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
| Q25 | doctor FAIL includes fmd + mermaid; WARN jev/focr/MCP/yt-dlp |
| Q30 | worker command or url |
| Q31 | curl + uv/pipx |
| Q32 | robot envelope with counts/repairs/warnings/kit_hash |
| Q33 | Drive is an early build requirement; same mailbox layout |
| Q34 | No Automations clock until `wr doctor` PASS on the Ultra. First weeks are manual `wr` |

## Agent ergonomics

- `--robot` on every verb. Non-zero exit is the gate.
- Skill forbids `wr sign` and snap commits.

## Open

Episode 1 brief (first public protocol.yaml question)? Local MCP URLs stay in uncommitted wr.toml.
