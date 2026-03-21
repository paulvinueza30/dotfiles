#!/bin/bash

notify() {
    notify-send -a Hyprland "Workspace Grouping" "$1"
}

wait_for_windows() {
    local ws_name="$1"
    local min_count="$2"
    local max_wait=90

    for ((i=0; i<max_wait; i++)); do
        local count=$(hyprctl clients -j | jq "[.[] | select(.workspace.name == \"special:$ws_name\")] | length")
        if [ "$count" -ge "$min_count" ]; then
            return 0
        fi
        sleep 1
    done
    notify "Timed out waiting for $min_count windows in $ws_name"
    return 1
}

group_workspace() {
    local ws_name="$1"
    local min_windows="${2:-2}"

    if ! wait_for_windows "$ws_name" "$min_windows"; then
        return
    fi

    mapfile -t windows < <(hyprctl clients -j | jq -r ".[] | select(.workspace.name == \"special:$ws_name\") | .address")

    local count=${#windows[@]}
    if [ "$count" -lt 2 ]; then
        notify "$ws_name: only $count window(s), need $min_windows"
        return
    fi

    # Open the workspace and wait for it to be visible
    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 1.5

    # Focus first window and create group
    hyprctl dispatch focuswindow "address:${windows[0]}"
    sleep 0.8
    hyprctl dispatch togglegroup
    sleep 0.8

    # Add remaining windows to group (try both directions)
    for ((i=1; i<count; i++)); do
        hyprctl dispatch focuswindow "address:${windows[$i]}"
        sleep 0.8
        hyprctl dispatch moveintogroup l
        sleep 0.8
        # If that didn't work, try r
        local grouped=$(hyprctl activewindow -j | jq -r '.grouped')
        if [ "$grouped" = "0" ] || [ -z "$grouped" ]; then
            hyprctl dispatch focuswindow "address:${windows[$i]}"
            sleep 0.8
            hyprctl dispatch moveintogroup r
            sleep 0.8
        fi
    done

    # Lock the group so windows stay together
    hyprctl dispatch lockactivegroup lock
    sleep 0.5

    # Close the workspace (windows stay grouped in background)
    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 0.5

    notify "$ws_name: grouped $count windows"
}

# Group AI first, then Messaging (Messaging apps are slower Electron apps)
group_workspace "AI" 2
sleep 2
group_workspace "Messaging" 2
