# Install pins

Pin tags/crates.io versions, not `main`.

| Tool | Pin | Notes |
|---|---|
| **asupersync** | **=0.5.0** crates.io | exact; `default-features = false` |
| franken_markdown | v0.4.5 | `fmd` |
| frankenmermaid | v0.2.0 | `frankenmermaid` / `fm-cli` |
| this repo | tag at v0.1.0 | until then record the commit |

```toml
asupersync = { version = "=0.5.0", default-features = false }
```

Bump only with UPGRADE_LOG + cancel-test receipt on the new version.
Optional PATH: jev, focr, yt-dlp, localbench, X/Reddit MCP, web-bot-auth, frankentts.
