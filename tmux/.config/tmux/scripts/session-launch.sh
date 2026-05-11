#!/usr/bin/env bash

set -euo pipefail

hide_status=0

if [ "${1:-}" = "--hide-status" ]; then
  hide_status=1
  shift
fi

session_name="${1:-}"
shift || true

if [ -z "$session_name" ] || [ "$#" -eq 0 ]; then
  printf 'usage: %s SESSION [COMMAND ...]\n' "${0##*/}" >&2
  exit 1
fi

current_session=$(tmux display-message -p '#{session_name}')
client_tty=$(tmux display-message -p '#{client_tty}')

if [ "$current_session" = "$session_name" ]; then
  tmux switch-client -c "$client_tty" -l
  exit 0
fi

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" "$@"
fi

if [ "$hide_status" -eq 1 ]; then
  tmux set -t "$session_name" status off
fi

tmux switch-client -c "$client_tty" -t "$session_name"
