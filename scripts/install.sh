#!/usr/bin/env bash
# Inventory pinned tools. Tags: PINS.md. Never installs floating main.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
YES=0
DRY=0
OPTIONAL=0
ROBOT=0

FMD_TAG="v0.4.5"
FM_TAG="v0.2.0"
FMD_GIT="https://github.com/Dicklesworthstone/franken_markdown"
FM_GIT="https://github.com/Dicklesworthstone/frankenmermaid"

usage() {
  cat <<EOF
Usage: scripts/install.sh [--dry-run] [--yes] [--optional] [--robot]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY=1 ;;
    --yes|-y) YES=1 ;;
    --optional) OPTIONAL=1 ;;
    --robot) ROBOT=1 ;;
    -h|--help) usage; exit 0 ;;
    *) usage; exit 2 ;;
  esac
  shift
done

have() { command -v "$1" >/dev/null 2>&1; }

py() {
  if have python3; then python3 "$@"; else python "$@"; fi
}

py_mod() {
  py -c "import $1" >/dev/null 2>&1
}

bin_ok() {
  have "$1"
}

fm_ok() { have frankenmermaid || have fm-cli; }

status_of() {
  if "$@"; then echo OK; else echo MISSING; fi
}

FMD_S=$(status_of bin_ok fmd)
FM_S=$(status_of fm_ok)
if have python3 || have python; then PY_S=OK; else PY_S=MISSING; fi
HTTPX_S=MISSING; TRAF_S=MISSING
if [[ "$PY_S" == OK ]]; then
  py_mod httpx && HTTPX_S=OK || true
  py_mod trafilatura && TRAF_S=OK || true
fi
CARGO_S=$(status_of bin_ok cargo)
JEV_S=$(status_of bin_ok jev)
FOCR_S=$(status_of bin_ok focr)
YT_S=$(status_of bin_ok yt-dlp)
LB_S=$(status_of bin_ok localbench)
BR_S=$(status_of bin_ok br)

# Required for *this installer*'s default extract path: fmd + fm.
# Python/trafilatura are default extract organs, not the kernel (D4).
MISSING_REQ=0
[[ "$FMD_S" == MISSING ]] && MISSING_REQ=1
[[ "$FM_S" == MISSING ]] && MISSING_REQ=1

WARNINGS=()
[[ "$PY_S" == MISSING ]] && WARNINGS+=("python missing; default extract worker needs it")
[[ "$TRAF_S" == MISSING ]] && WARNINGS+=("trafilatura missing")
[[ "$BR_S" == MISSING ]] && WARNINGS+=("br missing")

if [[ "$ROBOT" == 1 ]]; then
  if [[ "$MISSING_REQ" == 0 ]]; then OK=true; EXIT=0; else OK=false; EXIT=1; fi
  python3 - <<PY || true
import json,os
print(json.dumps({
  "ok": $OK,
  "verb": "install",
  "exit": $EXIT,
  "week": None,
  "paths": [],
  "error": None if $OK else "missing required renderer",
  "counts": {"fmd": "$FMD_S", "frankenmermaid": "$FM_S"},
  "repairs": [],
  "warnings": $(printf '%s\n' "${WARNINGS[@]}" | python3 -c 'import json,sys; print(json.dumps([l.strip() for l in sys.stdin if l.strip()]))'),
  "kit_hash": None
}))
PY
  exit "$EXIT"
fi

echo "weekly_research installer"
echo "repo  $ROOT"
echo "pins  fmd $FMD_TAG  frankenmermaid $FM_TAG"
echo
printf '%-18s %-10s %s\n' "TOOL" "STATUS" "PIN / NOTE"
printf '%-18s %-10s %s\n' "fmd" "$FMD_S" "$FMD_TAG required"
printf '%-18s %-10s %s\n' "frankenmermaid" "$FM_S" "$FM_TAG required"
printf '%-18s %-10s %s\n' "python" "$PY_S" "WARN unless extract is python"
printf '%-18s %-10s %s\n' "trafilatura" "$TRAF_S" "default extract"
printf '%-18s %-10s %s\n' "cargo" "$CARGO_S" "needed to cargo-install pins"
printf '%-18s %-10s %s\n' "br" "$BR_S" "optional"
printf '%-18s %-10s %s\n' "jev" "$JEV_S" "optional"
echo

if [[ "$DRY" == 1 ]]; then
  echo "dry-run: no installs"
  exit "$MISSING_REQ"
fi

if [[ "$MISSING_REQ" == 0 && "$OPTIONAL" == 0 ]]; then
  echo "required renderers present"
  exit 0
fi

install_py() {
  if have uv; then
    uv pip install --python "$(command -v python3 || command -v python)" httpx trafilatura
  else
    py -m pip install --user httpx trafilatura
  fi
}

install_fmd() {
  [[ "$CARGO_S" == OK ]] || { echo "cargo missing" >&2; return 1; }
  cargo install --git "$FMD_GIT" --tag "$FMD_TAG" --locked franken_markdown
}

install_fm() {
  [[ "$CARGO_S" == OK ]] || { echo "cargo missing" >&2; return 1; }
  cargo install --git "$FM_GIT" --tag "$FM_TAG" --locked frankenmermaid-cli 2>/dev/null || \
    cargo install --git "$FM_GIT" --tag "$FM_TAG" --locked frankenmermaid
}

do_install() {
  local msg="$1"
  if [[ "$YES" != 1 ]]; then
    printf '%s [y/N] ' "$msg"
    read -r ans
    [[ "$ans" == y || "$ans" == Y ]] || return 0
  else
    echo "$msg (yes)"
  fi
  shift
  "$@"
}

[[ "$TRAF_S" == MISSING || "$HTTPX_S" == MISSING ]] && do_install "install httpx+trafilatura?" install_py
[[ "$FMD_S" == MISSING ]] && do_install "install fmd $FMD_TAG?" install_fmd
[[ "$FM_S" == MISSING ]] && do_install "install frankenmermaid $FM_TAG?" install_fm

echo "re-run: scripts/install.sh --dry-run"
