#!/bin/bash

# Archivos a monitorear
nitrogen_config="$HOME/.config/nitrogen/bg-saved.cfg"

inotifywait -m -e modify "$nitrogen_config" |
while read path action file; do
    ~/.bin/wal.sh
done