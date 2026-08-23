#!/bin/bash
TARGET="$1"

if [[ "$TARGET" =~ ^[0-9]+$ ]]; then
  hyprctl dispatch "hl.dsp.focus({ workspace = \"$TARGET\" })"
  exit 0
fi

declare -A cmds=(
  [X]="uwsm-app -- /usr/bin/chromium --app=https://x.com/ --profile-directory=Clean"
  [LinkedIn]="uwsm-app -- /usr/bin/chromium --app=https://www.linkedin.com/feed/ --profile-directory=Clean"
  [GitHub]="uwsm-app -- /usr/bin/chromium --app=https://github.com/ --profile-directory=Clean"
  [Todoist]="uwsm-app -- /usr/bin/chromium --app=https://app.todoist.com/app/today --profile-directory=Clean"
  [Instagram]="uwsm-app -- /usr/bin/chromium --app=https://www.instagram.com/ --profile-directory=Clean"
  [Calendar]="uwsm-app -- /usr/bin/chromium --app=https://app.hey.com/calendar/weeks/ --profile-directory=Clean"
  [Reddit]="uwsm-app -- /usr/bin/chromium --app=https://reddit.com/ --profile-directory=Clean"
  [Twitch]="uwsm-app -- /usr/bin/chromium --app=https://twitch.tv/ --profile-directory=Clean"
  [NeetCode]="uwsm-app -- /usr/bin/chromium --app=https://neetcode.io/ --profile-directory=Clean"
  [N8N]="uwsm-app -- /usr/bin/chromium --app=https://n8n.paulvinueza.dev --profile-directory=Clean"
  [YouTube]="uwsm-app -- /usr/bin/chromium --app=https://youtube.com/ --profile-directory=Clean"
  [Gmail]="uwsm-app -- /usr/bin/chromium --app=https://mail.google.com/ --profile-directory=Clean"
  [ProxMox]="uwsm-app -- /usr/bin/chromium --app=https://proxmox.local/ --profile-directory=Clean"
  [Obsidian]="uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"
)

if [[ -n ${cmds[$TARGET]} ]] && ! hyprctl clients -j | jq -e --arg ws "special:$TARGET" \
    '.[] | select(.workspace.name == $ws)' >/dev/null 2>&1; then
  setsid ${cmds[$TARGET]} >/dev/null 2>&1 &
fi

hyprctl dispatch "hl.dsp.workspace.toggle_special(\"$TARGET\")"
