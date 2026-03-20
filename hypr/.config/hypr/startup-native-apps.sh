#!/bin/bash

# Important apps first (needed for grouping by 15s)

uwsm app -- slack &
sleep 1.5

claude &
sleep 1.5

uwsm app -- obsidian -disable-gpu --enable-wayland-ime --hidden &
sleep 1.5

spotify &
sleep 1.5

deskthing &
