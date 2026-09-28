# wr_plan_v1 — weekly_research bible

Living plan. **This file is the single source of product + process decisions.**
Live `.beads/issues.jsonl` overrides implementation *order*. Locks change only here + UPGRADE_LOG.
Status: `planned` | `active` | `committed` (committed = fixture + terminal receipt).

---

## 0. Reality-check 2026-09-28 (external graders)

Reviewed against commit family `afbc83a` / this fold.

**VERDICT: fix-then-plan.** No `wr` binary. Do not treat locks as properties.

Accepted strikes:
- Beads JSONL is a seed, not a proved `br` import (dependency *objects* vs string ids).
- `artifacts/robot_envelope_v1.json` is an **example**. Contract = schema + `cargo test --locked --test doctor_contract` (does not exist yet).
- README / skill / ntm template **must not** invent verbs. Canonical list is Q13 only.
- `scripts/install.sh` `status_of` / `bin_ok` is **broken** (runs a command named `bin_ok`). Treat installer as untrusted until a fixture proves PATH cases.
- S4 must list five predicates, not four groups.
- Pin string is `=0.5.0` everywhere (PINS.md aligned).
- Cancel-correct harvest is **planned**, not proved. Foreign PATH/URL workers are unbounded unless the worker declares timeout + process-group supervision.
- Jaccard is alignment only, not promotion. Second path must be independently fetched bytes, not a mirror URL.
- Schema cannot express two evidence paths per claim yet — L0/Verified is unspecified in SQL.
- `install.sh --robot` promised, not implemented.
- Product thesis is **not** validated (see fork below). Mentors kill clean-room builds without an incumbent-failure constraint.

**Executed baseline update (2026-09-28):** `docs/step0/notes/WR_VS_FR.md` records fresh FR fixture/installation/transfer runs and a limited review-prompt diagnostic. None establishes a wr advantage. Analyst recommendation remains defer separate implementation and evaluate the smallest FR extension. Historical pilot combine/kill wording is not comparative proof or owner build authorization. `GPT_RESEARCHER_HANDOFF.md` records the runnable local-model handoff and its actual validation boundary.

**Fork (pick before more crates):**
- **Build-doctor:** close `wr-doctor` with fixtures (environment proof only).
- **Validate-thesis:** `wr-validate-product-thesis` — six real decisions, three workflows (human+agent vs existing researcher vs researcher+franken-research), predeclared scores; adopt / wrap / build. No crate required.

---

## 1. What this is

Public `JYeswak/weekly_research`, MIT. Intended CLI `wr` on M3 Ultra. Weekly desk: harvest → claim → kit → optional Opus → human sign → show.
Audience: AI-friendly ops/engineers. Not client acquisition.

Weeks: **2026-W40** smallest honest harvest; **2026-W41** mechanisms vs Franken grading. One question per protocol (G12-C). Q35 A+B **struck**.

Whether a *separate Rust CLI* is justified remains **Unknown** until the thesis bead or an explicit owner override (RULE 0).

---

## 2. Invariants (intended; unproved until receipt)

1. One question per `protocol.yaml` week.
2. Hunt writes `proposers`. Harvest writes `sources`. Models select resolver-issued span IDs; they never supply authoritative offsets.
3. One Region / one writer per week db. Fan-out inside. Second writer **exit 5** before mutation.
4. Cancel-correct harvest is **planned**. Exit 130 means cleanup **completed** (joined tasks, reaped owned workers, settled snap reservations, commit or rollback done). Cleanup failure is exit 1, not 130. SIGKILL/power loss is recovery, not cooperative cancel. PATH organs: timeout, process group, TERM→KILL, drained pipes; drop is not a certificate. URL cancel is local transport only unless the worker acks remote stop.
5. Git = pointers + kit. Snaps CAS-only.
6. Human signs. Opus writes only `synth/` and `dispatch/`.
7. Beads = build graph. `ntm.json` = signed-week dispatch.
8. `asupersync = { version = "=0.5.0", default-features = false }`. No tokio-compat. No Chrome UA.
9. Only a terminal receipt proves execution.
10. Demotion always allowed.

---

## 3. Shape

One package `wr`. Pins in PINS.md. sqlite3 file; fsqlite only after Adopt packet.
Extract = configured PATH worker. Doctor is **read-only** (does not install).

Doctor exits (Q25 + M8):
- missing/wrong **required** renderer (fmd, frankenmermaid) or configured extract worker → findings **exit 1**
- optional missing (br, jev, focr, MCP, yt-dlp, tts) → WARN, doctor may still **exit 0** if no FAIL findings
- Python required only if the extract command is Python
- **exit 4** = operational worker failure *outside* doctor inventory
- **exit 5** = harvest lock, not doctor

`schema.sql`: sources, proposers, claims, runs, grades. Claims cannot yet store two evidence paths — do not implement Verified until a migration bead lands.

---

## 4. Lock register

### Product Q

| ID | Lock |
|---|---|
| Q4 | Local + NIM proposers; URLs only into `proposers` |
| Q11 | Isolated proposers. Verified needs **two independently fetched, hash-verified** sources. Mirrors/reposts/same-text blogs are one source. Support review covers negation/scope/units/context. Jaccard never promotes. |
| Q12 | Kit export; Opus optional; human signs |
| Q13 | **Only** these verbs: install doctor init harvest pin claim check export synthesize sign show service |
| Q15 | Jev fail-open |
| Q16 | sqlite3 file |
| Q18 | Typed repair; new row; no mutate |
| Q19 | Public |
| Q20 | pin = inbox |
| Q21 | license class is classification not permission; unknown/restricted export metadata+pointers only unless a recorded authorization |
| Q22 | All classes planned; X/Reddit via existing MCP |
| Q23 | allow/deny hosts |
| Q24 | L0 PASS → PNG + PDF |
| Q25 | see §3 doctor exits |
| Q30 | command or url; each worker declares timeout + output cap |
| Q31 | curl + uv/pipx for Python organs |
| Q32 | envelope keys; types live in a **schema file not yet written** |
| Q33/M1 | Drive WARN if unset |
| Q34/M3 | service default off; never unattended sign |
| Q35 | STRUCK |
| Q36 | PINS MIT FR copy-list |

### Harvest G

| ID | Lock |
|---|---|
| G1 | X x-cli-infisical; Reddit MCP get_subreddit_posts / get_post_comments |
| G2 | NIM → proposers only. Source admission needs fetch receipt + CAS hash |
| G3 | local proposer missing WARN |
| G4 | ptr_kind byte / page / youtube_t / …; resolver computes coords |
| G5 | Jaccard ≥ 0.6 alignment heuristic only |
| G6 | withheld = label |
| G7 | searched_at + freeze protocol hash and UTC cutoff at run start |
| G8 | exact host or dot-suffix; deny wins; recheck redirects |
| G9 | 403 fallback only with affirmative auth for that route; not circumvention |
| G10 | robots + terms.txt; absent terms ≠ permission; 402 blocked |
| G11 | UA weekly_research/0.1 (+repo) |
| G12 | one question / week |

### Synth S

S4 predicates (all five):
1. Every `plan.md` path exists
2. Every ntm `inputs[]` exists; `depends_on` ids exist
3. No URL in synthesis.md that is not a source row
4. matrix.md claim ids exist in ledger
5. No extra files under synth/ beyond the five names

Plus: check-synth validates claim **text and tier** against the registry, not only ids.

S7: export only manifest-listed artifacts from publication-approved records. Same rights check on md/json/pdf/png/wav.

### D / M

D7 A+ stands. Storage still **unspecified**: driver, journal, busy, queue cap, publish-snap-before-row, never hold a txn across network. Freeze those before harvest code.

M4: **both** ≤90s **and** ≤800 chars per public YT quote; aggregate budget by underlying work; not a fair-use harbor.
M5: CAS + pins; compact.md before gc; GitHub is not ACM archival.
M8: 0 / 1 / 2 / 4 / 5 / 130 as above.

---

## 5. Canonical verbs

Q13 only. README, SKILL.md, and `ntm.json` examples that say plan/test/review are **stale**. Fix those files before claiming operator-surface committed.

---

## 6. Verb status

All verbs `planned`. First possible committed: `doctor` after doctor_contract receipt.

---

## 7. Known defects (do not close beads on these files)

- install.sh inventory (`bin_ok`)
- no Cargo.toml / src
- no robot schema / doctor_contract
- AGENTS.md missing RULE 0 + 12 patterns verbatim
- GAPS.md / KERNEL.md duplicate authority (defer merge until doctor exists — process-porn to expand them now)

---

## 8. Amend

Change this file + UPGRADE_LOG row. Do not close a bead on prose.
