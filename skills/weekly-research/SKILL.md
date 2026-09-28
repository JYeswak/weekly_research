---
name: weekly-research
description: "Operate the wr research desk: install, doctor, init, harvest, pin, claim, plan, check, export, review, synthesize, sign. Use when running weekly_research, building a review kit, or dispatching from a signed packet. NOT for general web search without a brief."
type: tool
lifecycle: active
---

# weekly-research — wr operator surface

Read repo `SPEC.md` and `AGENTS.md` before any write. Never call `wr sign`. Never commit `snaps/`.

## First session

1. `wr doctor` — stop on FAIL.
2. If no week folder: `wr init --week YYYY-Www` (copies `weeks/_template`).
3. Fill `protocol.yaml` C fields before `wr harvest`.

## Verb order

`doctor` → `pin`/`harvest` → `claim` → `plan` → `check` → `export` → wait for `reviews/` → `synthesize` → human `sign` → `test` / `show`.

## Robot mode

Pass `--robot` for JSON on stdout. Non-zero exit is the gate. Do not parse human banners.

## Hard rules

- Harvest writes sources only.
- `pin` is local/inbox files only.
- Do not fetch during `synthesize`.
- Do not promote Verified by model vote.
- Missing Jev/MCP/yt-dlp = WARN + ungraded/Unknown, not fake Verified.
- Missing `fmd` or mermaid renderer = doctor FAIL.
- `show/` PDF+PNG after L0 PASS are DRAFT until signed.
- Restricted license rows: no public excerpt.

## Config

Copy `wr.toml.example` → `wr.toml`. Workers: `command` and/or `url`. Do not commit secrets.
