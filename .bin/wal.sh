#!/bin/bash

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Get the image path
if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
   file_path=$(cat ~/.config/nitrogen/bg-saved.cfg | head -n 2 | tail -n 1 | cut -d = -f 2)
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   file_path="$(cat ~/.config/waypaper/config.ini | grep "wallpaper =" | cut -d "=" -f 2)"
fi

expanded_path=$(eval echo "$file_path")
image=$(echo "$expanded_path" | sed 's/\~/$HOME/g')

# Copy image to temp files with a program friendly name
cp "$image" /tmp/wallpaper
rm -rfv ~/.cache/wal

# Apply wallpaper and color palette
wal -i /tmp/wallpaper -e -n

# Reinicia sólo lo necesario, no todo el entorno
if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
   # Tint 2
   killall tint2
   ~/.config/tint2/tint2.sh
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   # Waybar
   killall waybar
   waybar &

   # Notification Pannel
   killall swaync
   swaync &
fi

# Get the colors
source ~/.cache/wal/colors.sh

# Kitty Theme
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf

# Rofi Colors
python ~/.config/rofi/walrofi.py
