# weekly_research specification

Frozen from the planning session (2026-09-27/28). Amendments need a date and reason.

## Product

- Repo: `JYeswak/weekly_research` (public)
- CLI: `wr`
- Audience: AI-friendly ops / engineers; build-in-public lab notebook
- `localbench` proves models and harnesses. It is not this repo.
- Franken starter-kit discipline applies on implementation (pin, tiers, packets).

## Locks

| ID | Decision |
|---|---|
| Q4 | Hunt proposers: local default + NVIDIA free models as secondary URL lists only |
| Q11 | Isolated proposers. `Verified` needs a second evidence path (HTML vs focr/LDR), not a second model on one excerpt |
| Q12 | Export kit default. Optional `--worker opus` writes the same review/synth files a paste would. You sign |
| Q13 | Twelve verbs: doctor pin harvest claim plan check show test export review synthesize sign |
| Q14 | Cron W2 writes ledger + kit + empty synth/ + dispatch/ + SIGN.md stub. No Opus until reviews/ has a file |
| Q15 | Jev on snap text before excerpt enters a prompt or public kit. Missing Jev = WARN + ungraded, not halt |
| Q16 | Standard `.sqlite3` file is the contract. FrankenSQLite is an optional engine after a packet says Adopt |
| Q18 | Typed repair: ≤2 transient retries; empty HTML → one focr or one LDR; G1 Withheld never retried; log repairs[] |
| Q19 | Public repo created first; spec lives in-tree |
| Q20 | `pin` = inbox/local file only. Git SHAs belong on harvest rows |
| Q21 | Every source row has license class: `open | fair-use-quote | unknown | restricted`. `restricted` never appears as a public excerpt |
| Q22 | Week-1 classes: web, arxiv, github, inbox, youtube, openalex, x, reddit. X/Reddit via existing MCPs. Posts stay grey-lit for Verified |
| Q30 | Each worker may set `command` or `url` (or both). doctor checks whichever is set. Missing = WARN + Unknown |

## Protocol (brief C fields)

Required before `wr harvest`:

question, inclusion, exclusions, since, until, source_classes, max_sources, grey_lit, conflict

`searched_at` is on the run, not the protocol window.

Grey-lit (X, Reddit, vendor blogs) = Inference / leads. Conflict policy is report or halt, never average.

## Planes

- Ledger: git + sqlite file + local snaps
- Mailbox: Drive or `mailbox/` copy of the review kit
- Watch: small crons (doctor, ledger, empty-reviews, synth-after-review) + file alarms

## Grades

- G0 `wr check` — no model
- G1 Jev on snap — withhold injection-like pages
- G2 Jev Score/Choice on (claim, span) — abstain if ambiguous
- G3 localbench goldens on `wr`

## Workers

Python extras: `httpx`, `trafilatura`.

PATH: `focr`, `jev`, `localbench`, `fmd`, optional `fsqlite`, SearXNG/LDR, yt-dlp.

See `wr.toml.example` for command-or-url slots.

## Open

Domain allow/deny? fmd/mermaid week 1? doctor checklist? robot JSON? episode 1 brief? cron weekday? Drive connector vs copy? Exact MCP names/URLs (fill wr.toml locally, do not commit secrets)?
