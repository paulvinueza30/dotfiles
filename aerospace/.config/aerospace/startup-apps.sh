#!/bin/bash

INITIAL_DELAY=5
APP_DELAY=2

apps=(Spotify Discord Slack "Zen Browser" OpenWhispr)

sleep "$INITIAL_DELAY"
for i in "${!apps[@]}"; do
  open -a "${apps[$i]}"
  (( i < ${#apps[@]} - 1 )) && sleep "$APP_DELAY"
done
