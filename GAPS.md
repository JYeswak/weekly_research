# Gaps and unknowns

Living register. Close a row with a date + pointer (SPEC, schema file, or lock ID).
Does not reopen frozen locks. It names what those locks still need.

## Blocks harvest (do before wr harvest)

| ID | Gap | Default if we must ship |
|---|---|---|
| G1 | X/Reddit MCP request/response fixture | stdin JSON `{query, since, until, limit}` → stdout `{items:[{id, permalink, created_at, text, author}]}` |
| G2 | NIM proposer fixture | `{question, max}` → `{urls:[]}` only |
| G3 | Local proposer command | `wr.toml workers.local_proposer.command`; empty = harvest URLs come only from brief + inbox |
| G4 | Pointer types per class | `html_range` `pdf_page_span` `caption_t0_t1` `git_path@sha:line` `inbox_offset` |
| G5 | Second-path agree predicate | both excerpts nonempty AND Jev Choice not Contradicted on either; else cap Inference |
| G6 | G1 Jev τ and CLI | missing jev = ungraded; if present, Withheld only on explicit `inject`/`instruction` label until τ measured |
| G7 | `until: now` | harvest writes `searched_at`; protocol `until` may be `now` and is stored as that timestamp |
| G8 | Host allow/deny matching | hostname suffix match; IP literals compared exact |
| G9 | GitHub harvest auth | public API anonymous first; 403 → `blocked` not a scrape |
| G10 | arXiv / OpenAlex politeness | 1 req / 3s arXiv; OpenAlex mailto in User-Agent from wr.toml |
| G11 | User-Agent | `weekly_research/0.0 (+https://github.com/JYeswak/weekly_research)` |
| G12 | W40 `max_sources: 12` vs A+B | split budget 5 desk + 7 mechanisms in protocol comment; raise only with a SPEC amendment |

## Blocks synthesize / dispatch / show

| ID | Gap | Default if we must ship |
|---|---|---|
| S1 | Opus worker invoke | `--worker opus` = command or url; stdin kit path list; stdout files under synth/ |
| S2 | `synth/` templates | matrix.md, synthesis.md, plan.md, risks.md empty headers in weeks/_template/synth/ |
| S3 | `ntm.json` schema | `{tasks:[{id, verb, inputs[], done_when, owner}]}` owner in {localbench, omp, focr, human} |
| S4 | `check synth` predicates | every plan line has existing path; every show beat has claim id; no new URLs in synthesis.md |
| S5 | `renders.json` | `{items:[{tool: fmd\|frankenmermaid, in, out}]}` |
| S6 | SIGN.md machine fill | wr plan/check overwrite COUNTS and L0; ASK stays human |
| S7 | Kit zip file list | brief, check.json, claims.md, packet.md, prisma-or-counts, prompts/grade.md, MANIFEST.json |

## Blocks doctor / install on the Ultra

| ID | Gap | Default if we must ship |
|---|---|---|
| D1 | cargo crate names for fmd/fm | installer tries frankenmermaid-cli then frankenmermaid; record what worked |
| D2 | rustup missing | installer does **not** install rustup; print command |
| D3 | binary sha256 receipts | after first success, append ops/install-receipts.md |
| D4 | Python version | 3.11+; doctor WARN below 3.11, FAIL below 3.10 |
| D5 | wr package layout | `src/wr/` Python package; pyproject in this repo; entry `wr` |
| D6 | sqlite schema file | `schema.sql` checked in before first harvest |
| D7 | concurrent writers | one harvest at a time week 1; sqlite default lock |

## Blocks mailbox / video / later

| ID | Gap | Default if we must ship |
|---|---|---|
| M1 | Drive folder ids | env `WR_DRIVE_FOLDER`; layout `{in,reviews,out}` |
| M2 | Voice | after first signed script.md only |
| M3 | Automations | after doctor PASS (Q34) |
| M4 | YouTube ToS / long captions | restricted; kit quote ≤ 20s equivalent text |
| M5 | Snap retention | local forever week 1; no encryption |
| M6 | Telemetry | none |
| M7 | Repo versioning | tag v0.1.0 at first wr doctor PASS |
| M8 | Error codes | 0 ok, 1 gate fail, 2 usage, 3 worker missing required |

## Closed

| ID | Closed |
|---|---|
| C-pins | PINS.md fmd v0.4.5, frankenmermaid v0.2.0 |
| C-spdx | MIT |
| C-fr-init | FRANKEN-INIT.md; no init.sh overwrite |
| C-install | scripts/install.sh inventory + install missing |
