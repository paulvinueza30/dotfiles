#!/bin/bash
TARGET="$1"
STATE_FILE="/tmp/hypr-on-special"

# Read current state
CURRENT=$(cat "$STATE_FILE" 2>/dev/null)

# Check if target is a number (regular workspace)
if [[ "$TARGET" =~ ^[0-9]+$ ]]; then
    # Switching to regular workspace
    rm -f "$STATE_FILE"
    pgrep -x waybar >/dev/null || uwsm app -- waybar &
    hyprctl dispatch workspace "$TARGET"
    exit 0
fi

# Target is a special workspace
if [ -z "$CURRENT" ]; then
    # From regular to special - hide waybar
    echo "$TARGET" > "$STATE_FILE"
    pkill -x waybar 2>/dev/null
    hyprctl dispatch togglespecialworkspace "$TARGET"
elif [ "$CURRENT" != "$TARGET" ]; then
    # From special A to special B - stay hidden, just update file
    echo "$TARGET" > "$STATE_FILE"
    hyprctl dispatch togglespecialworkspace "$TARGET"
else
    # From special A to special A (toggle off) - show waybar
    rm -f "$STATE_FILE"
    pgrep -x waybar >/dev/null || uwsm app -- waybar &
    hyprctl dispatch togglespecialworkspace "$TARGET"
fi
