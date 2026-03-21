#!/bin/bash
TARGET="$1"
STATE_FILE="/tmp/hypr-on-special"

CURRENT=$(cat "$STATE_FILE" 2>/dev/null)

webapp_launcher="omarchy-launch-or-focus-webapp --profile-directory=Default"
keep_open="special:Messaging special:AI special:Spotify special:DeskThing special:forge"

declare -A webapps
webapps["special:X"]="https://x.com/"
webapps["special:LinkedIn"]="https://www.linkedin.com/feed/"
webapps["special:GitHub"]="https://github.com/"
webapps["special:Todoist"]="https://todoist.com/"
webapps["special:Instagram"]="https://www.instagram.com/"
webapps["special:Calendar"]="https://app.hey.com/calendar/weeks/"
webapps["special:Reddit"]="https://reddit.com/"
webapps["special:Twitch"]="https://twitch.tv/"
webapps["special:NeetCode"]="https://neetcode.com/"
webapps["special:N8N"]="https://n8n.internal/"
webapps["special:YouTube"]="https://youtube.com/"
webapps["special:Gmail"]="https://mail.google.com/"
webapps["special:ProxMox"]="https://proxmox.local/"

declare -A native_apps
native_apps["special:Obsidian"]="obsidian 'uwsm app -- obsidian -disable-gpu --enable-wayland-ime'"

declare -A patterns
patterns["special:X"]="x.com"
patterns["special:LinkedIn"]="linkedin.com"
patterns["special:GitHub"]="github.com"
patterns["special:Todoist"]="todoist.com"
patterns["special:Instagram"]="instagram.com"
patterns["special:Calendar"]="hey.com"
patterns["special:Reddit"]="reddit.com"
patterns["special:Twitch"]="twitch.tv"
patterns["special:NeetCode"]="neetcode.com"
patterns["special:N8N"]="n8n"
patterns["special:YouTube"]="youtube.com"
patterns["special:Gmail"]="mail.google.com"
patterns["special:ProxMox"]="proxmox"
patterns["special:Obsidian"]="obsidian"

handle_workspace_lifecycle() {
    local new_ws="$1"
    local prev_ws="$2"
    
    local prev_with_prefix="$prev_ws"
    [[ $prev_ws != special:* ]] && prev_with_prefix="special:$prev_ws"
    
    if [[ -n $prev_ws ]] && [[ " $keep_open " != *" $prev_with_prefix "* ]]; then
        local pattern="${patterns[$prev_with_prefix]}"
        if [[ -n $pattern ]]; then
            for addr in $(hyprctl clients -j | jq -r --arg p "$pattern" '.[] | select(.class | contains($p)) | .address' 2>/dev/null); do
                hyprctl dispatch killwindow "address:$addr" 2>/dev/null
            done
        fi
    fi
    
    local new_with_prefix="$new_ws"
    [[ $new_ws != special:* ]] && new_with_prefix="special:$new_ws"
    
    if [[ -n ${webapps[$new_with_prefix]} ]]; then
        local pattern="${patterns[$new_with_prefix]}"
        if ! hyprctl clients -j | jq -e --arg p "$pattern" '.[] | select(.class | contains($p))' > /dev/null 2>/dev/null; then
            hyprctl dispatch exec "[workspace $new_with_prefix silent] $webapp_launcher ${webapps[$new_with_prefix]}" 2>/dev/null &
        fi
    elif [[ -n ${native_apps[$new_with_prefix]} ]]; then
        local pattern="${patterns[$new_with_prefix]}"
        if ! hyprctl clients -j | jq -e --arg p "$pattern" '.[] | select(.class | contains($p))' > /dev/null 2>/dev/null; then
            read -r window_pattern launch_cmd <<< "${native_apps[$new_with_prefix]}"
            hyprctl dispatch exec "[workspace $new_with_prefix silent] omarchy-launch-or-focus $window_pattern \"$launch_cmd\"" 2>/dev/null &
        fi
    fi
}

if [[ "$TARGET" =~ ^[0-9]+$ ]]; then
    if [[ -n $CURRENT ]] && [[ "$CURRENT" != "$TARGET" ]]; then
        handle_workspace_lifecycle "$TARGET" "$CURRENT"
    fi
    rm -f "$STATE_FILE"
    pgrep -x waybar >/dev/null || uwsm app -- waybar &
    hyprctl dispatch workspace "$TARGET"
    exit 0
fi

if [ -z "$CURRENT" ]; then
    handle_workspace_lifecycle "special:$TARGET" "$CURRENT"
    echo "$TARGET" > "$STATE_FILE"
    pkill -x waybar 2>/dev/null
    hyprctl dispatch togglespecialworkspace "$TARGET"
elif [ "$CURRENT" != "$TARGET" ]; then
    handle_workspace_lifecycle "special:$TARGET" "special:$CURRENT"
    echo "$TARGET" > "$STATE_FILE"
    hyprctl dispatch togglespecialworkspace "$TARGET"
else
    rm -f "$STATE_FILE"
    pgrep -x waybar >/dev/null || uwsm app -- waybar &
    hyprctl dispatch togglespecialworkspace "$TARGET"
fi
