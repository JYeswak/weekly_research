# Install pins

`doctor` FAIL unless these binaries exist. Pin tags, not `main`.
Checksums: record `sha256` of the installed binary on the Ultra after first install; do not curl unpinned installers in CI.

| Tool | Pin | Binary names | Install |
|---|---|---|---|
| franken_markdown | **v0.4.5** (2026-09-15) | `fmd` | `cargo install --git https://github.com/Dicklesworthstone/franken_markdown --tag v0.4.5 franken_markdown` or their release archive + sidecar `.sha256` |
| frankenmermaid | **v0.2.0** | `frankenmermaid` / `fm-cli` | `FM_INSTALL_GIT_TAG=v0.2.0` on their install.sh, or `cargo install --locked` at that tag |
| this repo | tag when `v0.1.0` exists | `wr` | until then: clone a recorded commit; `scripts/install.sh` must not follow floating `main` in CI |
| Python extras | pin in pyproject when wr exists | — | `httpx`, `trafilatura` |

Do not use mermaid-js `mmdc` as the required renderer. Q24/Q25 require frankenmermaid so output can be deterministic.

Optional (WARN if missing): `jev`, `focr`, `yt-dlp`, `localbench`, X/Reddit MCP.

After install on the Ultra, append a row:

```
date  host  tool  version  binary_sha256
```

to `ops/install-receipts.md` (local or this file once you have hashes).
