#!/bin/bash
# Toggle workspace - returns to previous workspace if on target, otherwise goes to target
# Usage: toggle-workspace.sh <workspace-name>

AEROSPACE="/usr/local/bin/aerospace"
WORKSPACE="$1"
STATE_FILE="/tmp/aerospace-workspace-toggle-state"

if [ -z "$WORKSPACE" ]; then
    echo "Usage: toggle-workspace.sh <workspace-name>"
    exit 1
fi

CURRENT=$($AEROSPACE list-workspaces --focused 2>/dev/null)
PREV=$(cat "$STATE_FILE" 2>/dev/null)

if [ "$CURRENT" = "$WORKSPACE" ]; then
    if [ -n "$PREV" ]; then
        $AEROSPACE workspace "$PREV"
    fi
else
    echo "$CURRENT" > "$STATE_FILE"
    $AEROSPACE workspace "$WORKSPACE"
fi

case "$WORKSPACE" in
    P)
        WINDOW_COUNT=$($AEROSPACE list-windows --workspace P 2>/dev/null | wc -l | tr -d ' ')
        if [ "$WINDOW_COUNT" -eq 0 ] 2>/dev/null; then
            open -a "Activity Monitor"
        fi
        ;;
    X)
        WINDOW_COUNT=$($AEROSPACE list-windows --workspace X 2>/dev/null | wc -l | tr -d ' ')
        if [ "$WINDOW_COUNT" -eq 0 ] 2>/dev/null; then
            open -a "Google Chrome" --args --app=https://x.com
        fi
        ;;
esac
