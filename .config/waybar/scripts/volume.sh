#!/bin/sh

pamixer --get-volume-human | awk '{printf "󰕿 %s\n",$1 }'
#awk -F"[][]" '/%/ { print $2 }' <(amixer sget Master) | tail -n 1