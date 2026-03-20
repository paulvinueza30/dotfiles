#!/bin/bash

sleep 12

group_by_workspace() {
    local ws_name="$1"
    local first_class="$2"
    
    local first_win=$(hyprctl clients -j | jq -r ".[] | select(.workspace.name == \"special:$ws_name\" and (.class | test(\"$first_class\"))) | .address" | head -1)
    local second_win=$(hyprctl clients -j | jq -r ".[] | select(.workspace.name == \"special:$ws_name\" and (.class | test(\"$first_class\") | not)) | .address" | head -1)
    
    if [ -z "$first_win" ] || [ -z "$second_win" ]; then
        return
    fi
    
    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 0.5
    
    hyprctl dispatch focuswindow "address:$first_win"
    sleep 0.3
    hyprctl dispatch togglegroup
    sleep 0.3
    
    hyprctl dispatch focuswindow "address:$second_win"
    sleep 0.3
    hyprctl dispatch moveintogroup l
    sleep 0.3
    
    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 0.3
}

group_by_workspace "Messaging" "Slack"
group_by_workspace "AI" "Claude"
