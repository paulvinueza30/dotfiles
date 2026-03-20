#!/bin/bash
setsid -f ghostty -e bash -c 'SESSION=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf); tmux attach -t "$SESSION" 2>/dev/null || tmux new-session -A -s main'
