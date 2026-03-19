#!/bin/bash

webapp="omarchy-launch-or-focus-webapp --profile-directory=Default"

urls=(
  "https://discord.com/channels/@me"
  "https://x.com/"
  "https://www.linkedin.com/feed/"
  "https://github.com/"
  "https://todoist.com/"
  "http://10.0.0.72:8006/#v1:0:=node%2Fpve:4:5::::::"
  "https://www.instagram.com/"
  "https://app.hey.com/calendar/weeks/"
  "https://gemini.google.com/app"
)

for url in "${urls[@]}"; do
  $webapp "$url" >/dev/null 2>&1 &
  sleep 2
done
