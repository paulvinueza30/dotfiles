#!/bin/bash

set -euo pipefail

GHOSTTY_BIN="/Applications/Ghostty.app/Contents/MacOS/ghostty"

if [ ! -x "$GHOSTTY_BIN" ]; then
  echo "Ghostty binary not found at $GHOSTTY_BIN" >&2
  exit 1
fi

exec "$GHOSTTY_BIN" -e zsh -lic 'printf "\033]0;VPS Forge\007"; ocs'
