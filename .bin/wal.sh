#!/bin/bash

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Get the image path
if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
   image=$(cat ~/.config/nitrogen/bg-saved.cfg | head -n 2 | tail -n 1 | cut -d = -f 2)
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   image="$(cat ~/.config/waypaper/config.ini | grep "wallpaper =" | cut -d "=" -f 2)"
fi

# Generate color palette
zsh -c "wal -i $(echo $image) -e -n"

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

# Change Icon Colors Acording to Color 1
icon_colors=$(python ~/.bin/wallpy.py $color1)
variant=dark

gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-$icon_colors-$variant"
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-4.0/settings.ini
