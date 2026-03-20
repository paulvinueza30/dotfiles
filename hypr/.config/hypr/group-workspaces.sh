#!/bin/bash

wait_for_windows() {
    local ws_name="$1"
    local min_count="$2"
    local max_wait=30

    for ((i=0; i<max_wait; i++)); do
        local count=$(hyprctl clients -j | jq "[.[] | select(.workspace.name == \"special:$ws_name\")] | length")
        if [ "$count" -ge "$min_count" ]; then
            return 0
        fi
        sleep 1
    done
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
        return
    fi

    # Must open workspace — group commands only work on visible windows
    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 0.8

    hyprctl dispatch focuswindow "address:${windows[0]}"
    sleep 0.5
    hyprctl dispatch togglegroup
    sleep 0.5

    for ((i=1; i<count; i++)); do
        hyprctl dispatch focuswindow "address:${windows[$i]}"
        sleep 0.5
        hyprctl dispatch moveintogroup l
        sleep 0.5
    done

    # Must lock before closing — lockactivegroup needs focus inside the group
    hyprctl dispatch lockactivegroup lock
    sleep 0.3

    hyprctl dispatch togglespecialworkspace "$ws_name"
    sleep 0.3
}

group_workspace "Messaging" 2
group_workspace "AI" 2
