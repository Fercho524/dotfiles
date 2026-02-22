#!/bin/bash

STATE_FILE="$HOME/.cache/waybar-disk-toggle"

current=$(cat "$STATE_FILE" 2>/dev/null || echo "0")

if [[ "$current" == "0" ]]; then
    echo "1" > "$STATE_FILE"
else
    echo "0" > "$STATE_FILE"
fi

pkill -RTMIN+11 waybar
