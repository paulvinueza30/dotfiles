#!/bin/bash

webapp="omarchy-launch-or-focus-webapp --profile-directory=Default"

urls=(
  "https://x.com/"
  "https://www.linkedin.com/feed/"
  "https://github.com/"
  "https://gemini.google.com/app"
  "http://10.0.0.72:8006/#v1:0:=node%2Fpve:4:5::::::"
)

for url in "${urls[@]}"; do
  $webapp "$url" >/dev/null 2>&1 &
  sleep 2
done
