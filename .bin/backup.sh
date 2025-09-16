#!/bin/bash

cp -rv ~/.zsh_history  backup/
cp -rv ~/.zshrc backup/

mkdir -p ~/.bin/backup/.config

cp -rv ~/.config/bspwm ~/.bin/backup/.config
cp -rv ~/.config/hypr ~/.bin/backup/.config
cp -rv ~/.config/joplin-desktop ~/.bin/backup/.config
cp -rv ~/.config/kitty ~/.bin/backup/.config
cp -rv ~/.config/nautilus ~/.bin/backup/.config
cp -rv ~/.config/picom ~/.bin/backup/.config
cp -rv ~/.config/ranger ~/.bin/backup/.config
cp -rv ~/.config/rofi ~/.bin/backup/.config
cp -rv ~/.config/swaync ~/.bin/backup/.config
cp -rv ~/.config/sxhkd ~/.bin/backup/.config
cp -rv ~/.config/tint2 ~/.bin/backup/.config
cp -rv ~/.config/wal ~/.bin/backup/.config
cp -rv ~/.config/waybar ~/.bin/backup/.config
cp -rv ~/.config/waypaper ~/.bin/backup/.config

mkdir -p ~/.bin/backup/.local/share
cp -rv ~/.local/share/applications ~/.bin/backup/.local/share
cp -rv ~/.local/share/nautilus ~/.bin/backup/.local/share