#!/bin/bash

# Check for active recording process
# Use the same detection logic as the hyprflow script

# Get the recordings directory (same logic as hyprflow script)
# Use XDG Base Directory specification
HYPRFLOW_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/hyprflow"
RECORDING_DIR="${HYPRFLOW_DATA_DIR}/recordings"

# Find pw-record process writing to our recordings directory
# This matches the find_recording_process() function in hyprflow
if ps aux | grep -E "[p]w-record.*${RECORDING_DIR}" | awk '{print $2}' | head -1 | grep -q .; then
  echo '{"text": "󱑽 Hyprflow REC", "class": "active"}'
  exit 0
fi

# No active recording found
echo '{"text": ""}'
