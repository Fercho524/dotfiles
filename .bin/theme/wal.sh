#!/bin/bash

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
source /home/fercho/.bin/env.sh

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
if [[ $(echo $INTERFACE_SCHEME) = "light" ]]; then
   wal -i /tmp/wallpaper -e -n -l
elif [[ $(echo $INTERFACE_SCHEME) = "dark" ]]; then
   wal -i /tmp/wallpaper -e -n
fi

# Reinicia panel
~/.bin/system/pannel.sh

# Get the colors
source ~/.cache/wal/colors.sh

# Kitty Theme
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf

# Rofi Colors
python ~/.config/rofi/walrofi.py

# Wlcolors
cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout

# Hyprland colors
python ~/.bin/theme/hyprwal.py ~/.cache/wal/colors.json ~/.config/hypr/theme/colors.conf

# Dunst config rebuild
killall dunst -q
~/.bin/theme/update_notify.sh
dunst && echo "khemamadas"
notify-send "Scheme update succesfully" "Se ha cambiado correctamente la configuración del tema acorde al fondo de pantalla"

# Change GTK Icon Color
icon_colors=$(python ~/.bin/theme/get_icon_variant.py $color2)
variant=dark

# RGB
color="${color1#\#}"
openrgb -c $color -sp

# Apply GTK Theme
gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-$icon_colors-$variant"
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-4.0/settings.ini
