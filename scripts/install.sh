#!/usr/bin/env bash
# Pin tags live in PINS.md. Do not install floating main in CI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "weekly_research installer"
echo "repo: $ROOT"
echo "pins: see PINS.md"
echo
echo "Required (doctor FAIL if missing):"
echo "  fmd              franken_markdown v0.4.5"
echo "  frankenmermaid   v0.2.0  (fm-cli alias ok)"
echo "  python extras    httpx trafilatura"
echo
echo "Suggested commands (run yourself; this script does not curl unpinned URLs):"
echo "  cargo install --git https://github.com/Dicklesworthstone/franken_markdown --tag v0.4.5 franken_markdown"
echo "  FM_INSTALL_GIT_TAG=v0.2.0 bash  # only after you have verified their install.sh hash"
echo
echo "Then: copy wr.toml.example -> wr.toml"
echo "      point agents at skills/weekly-research/SKILL.md"
echo "When wr is packaged: uv tool install / pipx install from a tagged commit, then wr doctor"
