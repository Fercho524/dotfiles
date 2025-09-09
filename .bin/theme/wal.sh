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
#wal -i /tmp/wallpaper -e -n -l
echo $INTERFACE_SCHEME

if [[ $(echo $INTERFACE_SCHEME) = "light" ]]; then
   wal -i /tmp/wallpaper -e -n -l
elif [[ $(echo $INTERFACE_SCHEME) = "dark" ]]; then
   wal -i /tmp/wallpaper -e -n
fi


# Reinicia centro de notificaciones
if [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
   killall swaync
   swaync &
fi

# Reinicia panel
~/.bin/system/pannel.sh

# Get the colors
source ~/.cache/wal/colors.sh

# Kitty Theme
cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf

# Rofi Colors
python ~/.config/rofi/walrofi.py

# Hyprland colors
python ~/.bin/theme/hyprwal.py ~/.cache/wal/colors.json ~/.config/hypr/theme/colors.conf

# Notifications
killall dunst -q
~/.bin/theme/update_notify.sh
dunst && echo "khemamadas"
notify-send "¡Hola" "Dunst está funcionando correctamente"


# Change GTK Icon Color
icon_colors=$(python ~/.bin/theme/get_icon_variant.py $color2)
variant=dark

gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-$icon_colors-$variant"
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-4.0/settings.ini