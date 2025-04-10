#!/bin/bash

# This script only copy my files to the dotfiles directory

mkdir .bin .config

cp -v ~/.bin/*.sh .bin/

cp -rv ~/.config/bspwm .config
cp -rv ~/.config/rofi .config
cp -rv ~/.config/i3 .config
cp -rv ~/.config/htop .config
cp -rv ~/.config/sway .config
cp -rv ~/.config/river .config
cp -rv ~/.config/sxhkd .config
cp -rv ~/.config/dunst .config
cp -rv ~/.config/flameshot .config
cp -rv ~/.config/nvim .config
cp -rv ~/.config/labwc .config
cp -rv ~/.config/kitty .config
cp -rv ~/.config/neofetch .config
cp -rv ~/.config/nomacs .config
cp -rv ~/.config/picom .config
cp -rv ~/.config/ranger .config
cp -rv ~/.config/redshift .config
cp -rv ~/.config/tint2 .config
cp -rv ~/.config/waybar .config
cp -rv ~/.config/xournalpp .config
cp -rv ~/.config/zathura .config
cp -rv ~/.config/hypr .config
cp -rv ~/.config/swaync .config

mkdir -p .config/joplin-desktop
cp ~/.config/joplin-desktop/*.css .config/joplin-desktop

mkdir -p .local/share/nautilus
cp -rv ~/.local/share/nautilus .local/share/nautilus

cp -v ~/.zshrc .

