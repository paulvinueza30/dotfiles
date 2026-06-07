#!/bin/bash

# everytime swap to workspace save current workspace
# only store two workspaces at a time LIFO
# Need some kind of daemon to poll status
STATE_FILE="$XDG_RUNTIME_DIR/window.txt"
