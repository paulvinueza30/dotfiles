#!/bin/bash

sleep 3

webapp="omarchy-launch-or-focus-webapp --profile-directory=Default"

hyprctl dispatch exec "[workspace special:Messaging silent; group invade] $webapp https://discord.com/channels/@me"
sleep 2

hyprctl dispatch exec "[workspace special:AI silent; group invade] $webapp https://gemini.google.com/app"
sleep 2

hyprctl dispatch exec "[workspace special:X silent] $webapp https://x.com/"
sleep 1.5

hyprctl dispatch exec "[workspace special:LinkedIn silent] $webapp https://www.linkedin.com/feed/"
sleep 1.5

hyprctl dispatch exec "[workspace special:GitHub silent] $webapp https://github.com/"
sleep 1.5

hyprctl dispatch exec "[workspace special:Todoist silent] $webapp https://todoist.com/"
sleep 1.5

hyprctl dispatch exec "[workspace special:Instagram silent] $webapp https://www.instagram.com/"
sleep 1.5

hyprctl dispatch exec "[workspace special:Calendar silent] $webapp https://app.hey.com/calendar/weeks/"
