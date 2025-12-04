#!/bin/bash

# Check for active recording process
# Priority: wf-recorder (actual recording tool) > rec.*hyprflow pattern
# Exclude shell commands and scripts that might match the pattern

# First, check for wf-recorder which is the actual recording process
if pgrep -x "wf-recorder" >/dev/null; then
  echo '{"text": "󱑽 Hyprflow REC", "class": "active"}'
  exit 0
fi

# If wf-recorder not found, check for rec.*hyprflow pattern
# But filter out shell commands and our own script
pids=$(pgrep -f "rec.*hyprflow" 2>/dev/null)
if [ -n "$pids" ]; then
  for pid in $pids; do
    # Get the full command line
    cmdline=$(ps -p "$pid" -o args= 2>/dev/null)
    if [ -n "$cmdline" ]; then
      # Exclude shell commands, pgrep, and our script
      if [[ ! "$cmdline" =~ (zsh|bash|sh|pgrep|hyprflow-indicator\.sh) ]]; then
        echo '{"text": "󱑽 Hyprflow REC", "class": "active"}'
        exit 0
      fi
    fi
  done
fi

# No active recording found
echo '{"text": ""}'
