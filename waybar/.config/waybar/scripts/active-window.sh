#!/bin/bash

CLASS=$(hyprctl activewindow -j | jq -r '.class')

case "$CLASS" in
  "com.mitchellh.ghostty")
    NAME="ghostty"
    ;;
  "zen")
    NAME="zen"
    ;;
  "spotify")
    NAME="spotify"
    ;;
  "vesktop"|"discord"*)
    NAME="discord"
    ;;
  "Slack")
    NAME="slack"
    ;;
  "obsidian")
    NAME="obsidian"
    ;;
  "Claude")
    NAME="claude"
    ;;
  "chrome-app.hey.com__calendar_weeks_-Default")
    NAME="HEY Calendar"
    ;;
  "chrome-"*)
    NAME=$(echo "${CLASS#chrome-}" | sed 's/-Default$//' | sed 's/_/ /g')
    ;;
  *)
    NAME="$CLASS"
    ;;
esac

echo "${NAME}"
