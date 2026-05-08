#!/usr/bin/env bash

set -euo pipefail

export PATH="$HOME/.local/bin:$HOME/.local/opt/go/bin:$HOME/go/bin:/opt/homebrew/bin:/usr/local/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

die() {
  printf '%s\n' "$1" >&2
  printf '\nPress Enter to close...'
  read -r _
  exit 1
}

pause() {
  printf '\nPress Enter to close...'
  read -r _
}

need() {
  command -v "$1" >/dev/null 2>&1 || die "Missing required command: $1"
}

resolve_go() {
  local candidate

  if candidate=$(command -v go 2>/dev/null); then
    printf '%s\n' "$candidate"
    return 0
  fi

  if command -v zsh >/dev/null 2>&1; then
    candidate=$(zsh -lic 'command -v go' 2>/dev/null || true)
    if [ -n "$candidate" ] && [ -x "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  fi

  for candidate in \
    "$HOME/.local/opt/go/bin/go" \
    "$HOME/go/bin/go" \
    "/opt/homebrew/bin/go" \
    "/usr/local/bin/go"; do
    if [ -x "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  return 1
}

find_go_mod_root() {
  local dir="$1"

  while [ "$dir" != "/" ]; do
    if [ -f "$dir/go.mod" ]; then
      printf '%s\n' "$dir"
      return 0
    fi
    dir=$(dirname "$dir")
  done

  return 1
}

need fzf

GO_BIN=$(resolve_go) || die "Missing required command: go"
export GO_BIN

start_path="${1:-$PWD}"
if [ -f "$start_path" ]; then
  start_dir=$(dirname "$start_path")
else
  start_dir="$start_path"
fi

module_root=$(find_go_mod_root "$start_dir") || die "No go.mod found above: $start_dir"
cd "$module_root"

current_pkg=$(cd "$start_dir" && "$GO_BIN" list . 2>/dev/null || true)

pkg=$(
  "$GO_BIN" list ./... | fzf \
    --height=100% \
    --layout=reverse \
    --border \
    --prompt='Go package > ' \
    --header='Select a package to inspect its tests' \
    --query="$current_pkg" \
    --preview='"$GO_BIN" test -list . {} 2>/dev/null | grep -E "^(Test|Example)" || true' \
    --preview-window='right:60%:wrap'
) || exit 0

tests=$("$GO_BIN" test -list . "$pkg" 2>/dev/null | grep -E '^(Test|Example)' || true)
[ -n "$tests" ] || die "No tests found in package: $pkg"

selected=$(
  printf '%s\n' "$tests" | fzf -m \
    --height=100% \
    --layout=reverse \
    --border \
    --prompt='Go test > ' \
    --header="$pkg" \
    --preview='printf "%s\n" {}'
) || exit 0

pattern=$(printf '%s\n' "$selected" | paste -sd'|' -)

printf 'Module: %s\nPackage: %s\nTests: %s\n\n' "$module_root" "$pkg" "$pattern"

status=0
if command -v gotestsum >/dev/null 2>&1; then
  gotestsum -- -v -count=1 -run "^(${pattern})$" "$pkg" || status=$?
else
  "$GO_BIN" test -v -count=1 -run "^(${pattern})$" "$pkg" || status=$?
fi

printf '\nExit status: %s\n' "$status"
pause
exit "$status"
