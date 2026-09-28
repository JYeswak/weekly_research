# Early kernel (before wr harvest exists)

Stamp every franken-shaped repo the same way. Do not run FR `init.sh` over AGENTS.md.

## 1. Law

`AGENTS.md`: one rule + 12 forbidden patterns verbatim (starter-kit).
Asupersync mega-skill lives on the operator machine; do not treat this file as a substitute for `SKILL.md` + `NATIVE-GREENFIELD.md`.

Lane: **Native Greenfield** (ADOPTION-LANES.md lane 1).

- `#[asupersync::main]` / `&Cx` first on owned async APIs
- `Scope` / child regions for fetch, jev, focr — no detached tasks
- `cx.checkpoint()` in harvest loops
- two-phase snap write (tmp + rename + sqlite txn)
- Lab / native cancel tests are part of doctor, not polish
- no Tokio in core; workers stay subprocess (already Q30)

Anti-patterns we refuse: executor swap, hidden Cx, tokio::spawn in harvest, drop-as-cleanup, happy-path-only tests.

## 2. Beads start here

`.beads/issues.jsonl` (JSONL fallback) or `br init` if `br` is on PATH — **after** AGENTS.md exists, and never let `br agents --add --force` overwrite wr-specific AGENTS.

Day-one beads (outcomes, not chores):

| id | title | acceptance |
|---|---|---|
| wr-pin-runtime | Pin asupersync + fmd + frankenmermaid tags | PINS.md names SHAs |
| wr-doctor | doctor FAIL set is executable | `wr doctor --robot` exit 1 on missing fmd |
| wr-region | harvest is one Region | cancel test: no orphan snap tmp, no half row |
| wr-schema | schema.sql applied | empty harvest creates four tables |
| wr-robot | Q32 envelope | golden JSON fixture |

Close only with `close_reason` citing commit or receipt. Retired ids stay.

Beads = implement wr. `dispatch/ntm.json` = run a signed week. Two graphs.

## 3. Then code

`cargo new` wr crate in this repo. First binary: `wr doctor`. Then `wr init`. Harvest last.
