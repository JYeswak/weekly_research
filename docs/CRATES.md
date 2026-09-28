# Crate graph

Skill SOURCE-MAP last reconciled 2026-08-21 and still talks 0.4.9.
Live check 2026-09-28:

| Boundary | What we actually saw |
|---|---|
| crates.io | `asupersync` **0.5.0** (2026-09-12) |
| GitHub Releases “Latest” | **v0.5.0** |
| `main` Cargo.toml | `version = "0.6.0"` |
| Skill cancel contract | written for **v0.4.4–v0.4.9** |

No **0.10** on crates.io or the public release list from this session. If your local checkout is 0.10, pin **that git SHA** in PINS.md and treat the zipped skill as stale. Live `Cargo.toml` + tag outrank the skill.

Nine published workspace crates at 0.5.0 (release notes): `asupersync`, `asupersync-macros`, `asupersync-conformance`, `asupersync-browser-core`, `asupersync-tokio-compat`, `franken-kernel`, `franken-evidence`, `franken-decision`, `frankenlab`.

`main` members also list `drop_unwrap_finder`. Exclude wasm/fuzz.

## What wr is allowed to depend on

| Crate | Role for wr |
|---|---|
| `asupersync` | runtime, `Cx`, `Scope`, cancel protocol, time, process wait |
| `asupersync-macros` | `#[asupersync::main]`, `#[lab_test]` |
| native `sqlite` feature on asupersync | optional; else rusqlite behind a tiny adapter |
| `frankenlab` / Lab on asupersync | cancel tests |
| `asupersync-tokio-compat` | **forbidden in core** |
| `asupersync-browser-core` | **not used** |
| `franken-kernel` / evidence / decision | only if a packet says Adopt |

httpx/trafilatura stay **out of process** until a Rust fetch crate is pinned. Week-1 fetch: asupersync HTTP client **or** a child process. Prefer asupersync HTTP for public GET so cancel drains; keep Trafilatura as `PATH` extract after bytes land.

## wr workspace (this repo)

```
weekly_research/
  Cargo.toml          workspace
  crates/
    wr/               bin: clap verbs, #[asupersync::main]
    wr-core/          protocol, robot JSON, schema types (no IO)
    wr-ledger/        sqlite reserve/commit, snaps rename
    wr-harvest/       Region per run; fetch + subprocess organs
    wr-check/         L0 + check synth (sync is fine)
    wr-export/        kit + renders.json (spawns fmd/fm)
  skills/weekly-research/
  weeks/
```

Edges:

```
wr (bin)
  → wr-harvest → wr-ledger → wr-core
  → wr-check   → wr-ledger → wr-core
  → wr-export  → wr-core
wr-harvest uses asupersync Cx/Scope
wr-ledger uses two-phase file+sql only
wr-core has zero asupersync so tests stay dumb
```

Subprocess organs (not crates): `fmd`, `frankenmermaid`, `jev`, `focr`, `yt-dlp`, `x-cli-infisical`, reddit MCP, optional `web-bot-auth`.

## Formal start (KERNEL + this file)

1. Pin asupersync **tag or SHA** after `git ls-remote --tags` on the Ultra.
2. Seed beads (D-beads still open).
3. `crates/wr` doctor only.
4. Lab + native cancel test on a fake harvest region before real HTTP.
