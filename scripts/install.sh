#!/usr/bin/env bash
# Week-1 installer contract. wr package is not on PyPI yet.
set -euo pipefail
echo "weekly_research installer"
echo "1. Clone https://github.com/JYeswak/weekly_research"
echo "2. Copy wr.toml.example to wr.toml and fill workers"
echo "3. Install extras: pip install 'httpx' 'trafilatura'"
echo "4. Put fmd and a mermaid renderer on PATH (doctor FAIL if missing)"
echo "5. Optional PATH: jev focr yt-dlp localbench"
echo "6. Point the agent at skills/weekly-research/SKILL.md"
echo "When wr exists: this script will pipx/uv-install the CLI and run wr doctor."
