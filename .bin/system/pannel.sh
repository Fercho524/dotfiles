#!/bin/bash

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
   killall tint2
   ~/.config/tint2/tint2.sh
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   if lspci | grep -i nvidia > /dev/null; then
      echo "Panel configurado para pc con nvidia"
      python ~/.bin/theme/create-waybar.py \
      --left "custom/launcher" "wlr/taskbar" \
      --center "hyprland/workspaces" \
      --right "custom/network" "pulseaudio" "custom/cpu" "temperature" "custom/memory" "custom/cuda" "custom/vram" "disk" "tray" "clock" \
      --position bottom \
      --margin 8
   else
      echo "Panel configurado para laptop"
      python ~/.bin/theme/create-waybar.py \
      --left "custom/launcher" "wlr/taskbar" \
      --center "hyprland/workspaces" \
      --right "custom/network" "pulseaudio" "custom/cpu" "temperature" "custom/memory" "disk" "tray" "clock" \
      --position bottom \
      --margin 8
   fi

   killall waybar
   waybar &
fi