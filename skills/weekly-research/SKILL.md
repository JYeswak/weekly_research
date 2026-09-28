---
name: weekly-research
description: "Operate the wr research desk: install, doctor, init, harvest, pin, claim, plan, check, export, review, synthesize, sign. Use when running weekly_research, building a review kit, or dispatching from a signed packet. NOT for general web search without a brief."
type: tool
lifecycle: active
---

# weekly-research — wr operator surface

Read repo `SPEC.md` and `AGENTS.md` before any write. Never call `wr sign`. Never commit `snaps/`.

## First session

1. `scripts/install.sh --dry-run` — inventory.
2. `scripts/install.sh --yes` — install only missing **pinned** required tools (`httpx`, `trafilatura`, `fmd` v0.4.5, frankenmermaid v0.2.0). Needs `cargo` already on PATH.
3. `wr doctor` when the CLI exists — stop on FAIL.
4. `wr init --week YYYY-Www` if no week folder.
5. Fill `protocol.yaml` C fields before `wr harvest`.

## Verb order

`doctor` → `pin`/`harvest` → `claim` → `plan` → `check` → `export` → wait for `reviews/` → `synthesize` → human `sign` → `test` / `show`.

## Robot mode

Pass `--robot` for JSON on stdout. Non-zero exit is the gate.
Installer for agents: `scripts/install.sh --yes` (no prompt).

## Hard rules

- Harvest writes sources only.
- `pin` is local/inbox files only.
- Do not fetch during `synthesize`.
- Do not promote Verified by model vote.
- Missing Jev/MCP/yt-dlp = WARN + ungraded/Unknown.
- Missing `fmd` or frankenmermaid = doctor FAIL.
- Do not `curl | bash` unpinned `main` installers.
- Restricted license rows: no public excerpt.

## Config

Copy `wr.toml.example` → `wr.toml`. Do not commit secrets.
