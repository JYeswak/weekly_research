# wr_plan_v1 — weekly_research bible

Living plan. **This file is the single source of product + process decisions.**
Live `.beads/issues.jsonl` + `AGENTS.md` override *implementation order*, not these locks.
Amendments: dated row in UPGRADE_LOG.md + reason. Status words: `planned` | `active` | `committed` (committed = artifact + terminal receipt).

Mapped to Jeffrey’s trees (asupersync, beads_rust): one design bible, beads as executable graph, proof-lane JSON, UPGRADE_LOG, commit-on-main citing bead ids, no feature-branch requirement.

---

## 0. What this is

Public repo `JYeswak/weekly_research`, **MIT**. CLI `wr` on a Mac M3 Ultra (512 GB, no DGX). Weekly public research desk: harvest → claim → kit → (optional Opus synth) → human sign → show/video. Audience: AI-friendly ops/engineers and tech-focused owners. Not a client-acquisition funnel.

First weeks: **2026-W40** smallest honest harvest; **2026-W41** which 2026 mechanisms survive Franken grading. One question per protocol (G12-C). SPEC.md Q35 “W40 A+B” is **struck**.

---

## 1. Invariants (asupersync_plan_v4 role)

1. One question per `protocol.yaml` week.
2. Hunt writes `proposers`. Harvest writes `sources`. Models do not invent byte offsets.
3. One Region / one writer per week db. Fan-out *inside* the Region. Second writer **exit 5**.
4. Cancel = request → drain → finalize. No half row, no orphan snap tmp.
5. Git = pointers + kit. Snap bytes never on git. CAS `snaps/sha256/…`.
6. Human signs. Opus writes only `synth/` and `dispatch/`.
7. Beads = build `wr`. `dispatch/ntm.json` = run a signed week.
8. `asupersync = "=0.5.0"`, `default-features = false`. No tokio-compat. No Chrome UA default.
9. Only a terminal receipt proves execution.
10. Demotion always allowed. Promotion only at a named gate.

---

## 2. Process (his repos, not the FR stamp pack)

| His artifact | Ours |
|---|---|
| `asupersync_plan_v4.md` | **this file** |
| `.beads/` + `br ready` | `.beads/issues.jsonl`; `br sync --import-only` after pull |
| `artifacts/*_v1.json` + contract test | `artifacts/robot_envelope_v1.json` |
| `UPGRADE_LOG.md` | `UPGRADE_LOG.md` |
| `AGENTS.md` RULE 0 + work-graph | `AGENTS.md` (must keep 12 forbidden patterns verbatim — still due) |
| `TESTING_FOR_AGENTS.md` | planned |
| Commit subject cites bead | `wr-doctor:` etc. on `main` |
| File reservation / Agent Mail | planned when a second agent writes `src/` |
| Status committed/active/planned | verb table §6 |

Do not run FR `init.sh` on this repo (`FRANKEN-INIT.md` copy-list only).
Do not `br agents --add --force` over `AGENTS.md`.

---

## 3. Shape and pins

- One Cargo package `wr`, bin `wr`, modules under `src/` (beads_rust). Split crate only with a bead + compile receipt.
- Pins (`PINS.md`): asupersync **0.5.0** crates.io; franken_markdown **v0.4.5**; frankenmermaid **v0.2.0**. Receipts after first install → `ops/install-receipts.md`.
- sqlite3 **file** (`schema.sql`). FrankenSQLite engine only after an Adopt packet.
- Installer: `scripts/install.sh` detect/print/install pinned tools. No rustup surprise. `--yes` / `--dry-run` / `--robot`.
- Extract: PATH worker (default Trafilatura). Missing worker FAIL. Python missing WARN unless that worker *is* Python.

`schema.sql` tables: `sources`, `proposers`, `claims`, `runs`, `grades`.

---

## 4. Lock register (every letter from the session)

### Product Q

| ID | Lock |
|---|---|
| Q4 | Local proposer + NVIDIA NIM secondary; URLs only into `proposers` |
| Q11 | Isolated proposers; Verified needs second evidence path |
| Q12 | Export kit; Opus optional; human signs |
| Q13 | Twelve verbs (install doctor init harvest pin claim check export synthesize sign show service) |
| Q15 | Jev fail-open (WARN, harvest continues) |
| Q16 | sqlite3 file; fsqlite later |
| Q18 | Typed repair budget; new row; no mutate |
| Q19 | Public repo |
| Q20 | pin class = inbox |
| Q21 | license classes open / fair-use-quote / unknown / restricted |
| Q22 | All source classes planned; X/Reddit via existing MCP/Cloudflare |
| Q23 | optional allow/deny hosts |
| Q24 | L0 PASS → frankenmermaid PNG + fmd PDF |
| Q25 | doctor FAIL: fmd + frankenmermaid; WARN: jev, focr, MCP, yt-dlp, tts, br |
| Q30 | workers are command or url |
| Q31 | bootstrap curl + uv/pipx for Python organs only |
| Q32 | robot JSON: ok verb exit week paths error counts repairs warnings kit_hash |
| Q33 / M1 | Drive folder env/toml; WARN if unset |
| Q34 / M3 | No unattended sign. Service default **off** |
| Q35 | **STRUCK** — replaced by G12-C |
| Q36 | PINS + MIT + FR copy-list |

### Harvest G

| ID | Lock |
|---|---|
| G1 | X `x-cli-infisical`; Reddit MCP `get_subreddit_posts` / `get_post_comments` |
| G2 | NIM proposer URLs only |
| G3 | Local proposer missing → WARN |
| G4 | Pointer types explicit (byte / page / youtube_t / …) |
| G5 | Jaccard ≥ 0.6 for Verified span |
| G6 | Withheld = label only |
| G7 | `searched_at` snapshot on the run |
| G8 | Host suffix match; deny wins |
| G9 | API first; 403 → one Trafilatura GET; still honor G8/G10/G1 |
| G10 | Discover robots + terms.txt; honor deny; 402=blocked; optional web-bot-auth; trigger=fetcher |
| G11 | UA `weekly_research/0.1 (+repo)`; token `weekly_research`; wr.toml override |
| G12 | One question per week. W40 desk. W41 mechanisms |

### Synth S

| ID | Lock |
|---|---|
| S1 | Opus command/url; stdin kit paths; writes only synth/ + dispatch/ |
| S2 | matrix.md synthesis.md plan.md risks.md methods.md |
| S3 | ntm.json + depends_on |
| S4 | Five check-synth predicates (paths exist, no novel URLs, matrix ids, five names only) |
| S5 | renders.json: counts.png + SIGN.pdf |
| S6 | wr check writes COUNTS + L0; human ASK + signature |
| S7 | Kit = text set + counts.png + SIGN.pdf; no snap bytes |

### Install / runtime D

| ID | Lock |
|---|---|
| D-lang | Rust + asupersync from doctor |
| D-shape | One package |
| D-beads | br if present else JSONL; doctor WARN if br missing |
| D-pin | asupersync 0.5.0 crates.io |
| D1 | Record crate names + sha256 after first install |
| D2 | No rustup in installer |
| D4 | FAIL if extract worker missing |
| D6 | Five SQL tables |
| D7 | A+: exclusive run + parallel proposers/fetch with per-host cap |

### Mailbox M

| ID | Lock |
|---|---|
| M1 | WR_DRIVE_FOLDER / wr.toml; WARN unset |
| M2 | workers.tts after sign; script.md → show/vo.wav; WARN if missing |
| M3 | `wr service install\|status\|uninstall`; launchd/systemd; harvest+export only; default off |
| M4 | Per-claim youtube_t ≤90s or 800 chars; full VTT local |
| M5 | CAS; pin signed hashes; gc unpinned after 30d + unused in last 12 signed weeks; write compact.md first |
| M6 | Local logs `~/.local/share/wr` only; opt-in counts = later bead |
| M7 | wr semver; weeks YYYY-Www; pins tagged |
| M8 | exit 0 / 1 findings / 2 usage / 4 worker / **5 lock** / 130 cancel |

---

## 5. Pipeline

```
protocol.yaml → harvest (Region) → sources+proposers
             → claim (pointers) → L0 check
             → export kit → mailbox in/
             → synthesize (Opus) → check synth
             → human sign → show (mermaid, fmd, tts)
             → dispatch ntm.json
```

Grey-lit / X / Reddit: leads, not Verified alone.
Verified: second path + Jaccard ≥ 0.6 on the cited span.

---

## 6. Verb status

| Verb | Status | First proof |
|---|---|---|
| doctor | planned | `wr doctor --robot` matches envelope; missing fmd exit 1 |
| init | planned | schema.sql applied |
| install | planned | install.sh receipts |
| harvest pin claim check | planned | after doctor committed |
| export synthesize sign show | planned | after L0 |
| service | planned | default off |

---

## 7. Still planned (not locks — numbers / files)

- `max_inflight_global` / `max_inflight_per_host` defaults
- Cron timezone
- `rust-toolchain.toml` (follow asupersync 0.5 nightly)
- CI matrix
- TESTING_FOR_AGENTS.md
- AGENTS.md 12 patterns verbatim + RULE 0
- Agent Mail reservations when two writers

These stay `Unknown` until a bead closes them. They do not block `wr-doctor`.

---

## 8. How to amend

1. Change this file with a reason.
2. Row in UPGRADE_LOG.md.
3. If a bead assumed the old lock, open a new bead; do not silently close.
