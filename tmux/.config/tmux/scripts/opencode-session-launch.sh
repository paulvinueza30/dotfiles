#!/usr/bin/env bash

set -euo pipefail

session_name="opencode"
current_session=$(tmux display-message -p '#{session_name}')
client_tty=$(tmux display-message -p '#{client_tty}')
current_path=$(tmux display-message -p '#{pane_current_path}')

if [ "$current_session" = "$session_name" ]; then
  tmux switch-client -c "$client_tty" -l
  exit 0
fi

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -c "$current_path" opencode .
fi

tmux set -t "$session_name" status off
tmux switch-client -c "$client_tty" -t "$session_name"
