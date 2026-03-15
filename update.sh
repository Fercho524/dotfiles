#!/bin/bash

# Update
rm -rfv .bin
rm -rfv .cache
rm -rfv .config
rm -rfv .local

# Scripts
cp -rv ~/.bin .

# Base files
cp -v ~/.zshrc .
cp -v ~/.nanorc .

# Wal default
mkdir .cache
cp -rv ~/.cache/wal .cache/

# Config
cp -rv /home/fercho/.config/bspwm  .config/
cp -rv /home/fercho/.config/eww  .config/
cp -rv /home/fercho/.config/dunst  .config/
cp -rv /home/fercho/.config/hypr  .config/
cp -rv /home/fercho/.config/hyprwave  .config/
cp -rv /home/fercho/.config/kitty  .config/
cp -rv /home/fercho/.config/mako  .config/
cp -rv /home/fercho/.config/picom  .config/
cp -rv /home/fercho/.config/mpv .config
cp -rv /home/fercho/.config/rofi  .config/
cp -rv /home/fercho/.config/swaync  .config/
cp -rv /home/fercho/.config/sxhkd  .config/
cp -rv /home/fercho/.config/tint2  .config/
cp -rv /home/fercho/.config/waybar  .config/
cp -rv /home/fercho/.config/swayosd  .config/
cp -rv /home/fercho/.config/wlogout  .config/

# Nautilus scripts
mkdir -p .local/nautilus/scripts
cp -rv ~/.local/share/nautilus/scripts .local/nautilus/scripts