#!/bin/bash

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
   killall tint2
   ~/.config/tint2/tint2.sh
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   killall waybar
   waybar &
fi