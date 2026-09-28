# Crate graph

## Pin

asupersync **0.5.0** crates.io, `default-features = false`, exact `=0.5.0` when we write Cargo.toml (beads_rust style).

## Day-one shape (D-shape A)

One package, one bin — not a five-crate workspace.

```
weekly_research/
  Cargo.toml          [package] name = "wr"
  src/main.rs         clap + #[asupersync::main]
  src/doctor.rs
  src/harvest.rs      Region / Scope
  src/ledger.rs       reserve/commit sqlite file
  src/check.rs
  src/export.rs
  weeks/  skills/  docs/
```

Split a crate only with a bead + compile-time receipt.

Forbidden in core: tokio-compat, browser-core.
Q16: `.sqlite3` file; fsqlite only after Adopt packet.
Organs stay PATH.

## Asupersync upstream (do not copy their workspace)

asupersync itself is a platform workspace. wr is a CLI like `br`.
