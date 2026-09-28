#!/usr/bin/env bash
# Inventory pinned tools, print a table, install only what is missing.
# Tags: PINS.md. Never installs floating main.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
YES=0
DRY=0
OPTIONAL=0

FMD_TAG="v0.4.5"
FM_TAG="v0.2.0"
FMD_GIT="https://github.com/Dicklesworthstone/franken_markdown"
FM_GIT="https://github.com/Dicklesworthstone/frankenmermaid"

usage() {
  cat <<EOF
Usage: scripts/install.sh [--dry-run] [--yes] [--optional]
  --dry-run   show table only
  --yes       install missing required tools without prompt (agents)
  --optional  also try jev / focr / yt-dlp if missing (best-effort)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY=1 ;;
    --yes|-y) YES=1 ;;
    --optional) OPTIONAL=1 ;;
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
  local name="$1"
  if have "$name"; then return 0; fi
  return 1
}

# frankenmermaid ships as frankenmermaid or fm-cli
fm_ok() { have frankenmermaid || have fm-cli; }

status_of() {
  if "$1"; then echo OK; else echo MISSING; fi
}

echo "weekly_research installer"
echo "repo  $ROOT"
echo "pins  fmd $FMD_TAG  frankenmermaid $FM_TAG"
echo

FMD_S=$(status_of "bin_ok fmd")
FM_S=$(status_of fm_ok)
if have python3 || have python; then PY_S=OK; else PY_S=MISSING; fi
HTTPX_S=MISSING; TRAF_S=MISSING
if [[ "$PY_S" == OK ]]; then
  py_mod httpx && HTTPX_S=OK || true
  py_mod trafilatura && TRAF_S=OK || true
fi
CARGO_S=$(status_of "bin_ok cargo")
UV_S=$(status_of "bin_ok uv")
PIP_S=MISSING
py -m pip --version >/dev/null 2>&1 && PIP_S=OK || true

JEV_S=$(status_of "bin_ok jev")
FOCR_S=$(status_of "bin_ok focr")
YT_S=$(status_of "bin_ok yt-dlp")
LB_S=$(status_of "bin_ok localbench")

printf '%-18s %-10s %s
' "TOOL" "STATUS" "PIN / NOTE"
printf '%-18s %-10s %s
' "----" "------" "---------"
printf '%-18s %-10s %s
' "python" "$PY_S" "3.11+ recommended"
printf '%-18s %-10s %s
' "httpx" "$HTTPX_S" "pip/uv"
printf '%-18s %-10s %s
' "trafilatura" "$TRAF_S" "pip/uv"
printf '%-18s %-10s %s
' "fmd" "$FMD_S" "franken_markdown $FMD_TAG"
printf '%-18s %-10s %s
' "frankenmermaid" "$FM_S" "$FM_TAG (fm-cli ok)"
printf '%-18s %-10s %s
' "cargo" "$CARGO_S" "needed to install fmd/fm"
printf '%-18s %-10s %s
' "jev" "$JEV_S" "optional WARN"
printf '%-18s %-10s %s
' "focr" "$FOCR_S" "optional WARN"
printf '%-18s %-10s %s
' "yt-dlp" "$YT_S" "optional WARN"
printf '%-18s %-10s %s
' "localbench" "$LB_S" "optional WARN"
echo

MISSING_REQ=0
[[ "$PY_S" == MISSING ]] && MISSING_REQ=1
[[ "$HTTPX_S" == MISSING ]] && MISSING_REQ=1
[[ "$TRAF_S" == MISSING ]] && MISSING_REQ=1
[[ "$FMD_S" == MISSING ]] && MISSING_REQ=1
[[ "$FM_S" == MISSING ]] && MISSING_REQ=1

if [[ "$DRY" == 1 ]]; then
  echo "dry-run: no installs"
  exit "$MISSING_REQ"
fi

if [[ "$MISSING_REQ" == 0 && "$OPTIONAL" == 0 ]]; then
  echo "required tools present"
  if [[ ! -f "$ROOT/wr.toml" && -f "$ROOT/wr.toml.example" ]]; then
    echo "note: copy wr.toml.example -> wr.toml and fill workers"
  fi
  exit 0
fi

install_py() {
  if have uv; then
    uv pip install --python "$(command -v python3 || command -v python)" httpx trafilatura
  elif [[ "$PIP_S" == OK ]]; then
    py -m pip install --user httpx trafilatura
  else
    echo "cannot install python extras: need uv or pip" >&2
    return 1
  fi
}

install_fmd() {
  if [[ "$CARGO_S" != OK ]]; then
    echo "cargo missing; install rustup first" >&2
    return 1
  fi
  cargo install --git "$FMD_GIT" --tag "$FMD_TAG" --locked franken_markdown
}

install_fm() {
  if [[ "$CARGO_S" != OK ]]; then
    echo "cargo missing; install rustup first" >&2
    return 1
  fi
  # crate name may be frankenmermaid-cli; fall back to locked git install of workspace binary
  if ! cargo install --git "$FM_GIT" --tag "$FM_TAG" --locked frankenmermaid-cli 2>/dev/null; then
    cargo install --git "$FM_GIT" --tag "$FM_TAG" --locked frankenmermaid
  fi
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

[[ "$HTTPX_S" == MISSING || "$TRAF_S" == MISSING ]] && do_install "install httpx + trafilatura?" install_py
[[ "$FMD_S" == MISSING ]] && do_install "install fmd $FMD_TAG via cargo?" install_fmd
[[ "$FM_S" == MISSING ]] && do_install "install frankenmermaid $FM_TAG via cargo?" install_fm

if [[ "$OPTIONAL" == 1 ]]; then
  if [[ "$YT_S" == MISSING ]]; then
    do_install "install yt-dlp (pip)?" bash -c 'py -m pip install --user yt-dlp || uv pip install yt-dlp'
  fi
  if [[ "$JEV_S" == MISSING ]]; then
    echo "jev: no public installer pin yet — leave WARN"
  fi
  if [[ "$FOCR_S" == MISSING ]]; then
    echo "focr: install franken_ocr separately — leave WARN"
  fi
fi

if [[ ! -f "$ROOT/wr.toml" && -f "$ROOT/wr.toml.example" ]]; then
  if [[ "$YES" == 1 ]]; then
    cp "$ROOT/wr.toml.example" "$ROOT/wr.toml"
    echo "wrote wr.toml from example (fill secrets locally)"
  else
    echo "copy wr.toml.example -> wr.toml when ready"
  fi
fi

echo
echo "re-run: scripts/install.sh --dry-run"
echo "agents: scripts/install.sh --yes"
