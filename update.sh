#!/bin/bash

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
cp -rv /home/fercho/.config/dunst  .config/
cp -rv /home/fercho/.config/hypr  .config/
cp -rv /home/fercho/.config/kitty  .config/
cp -rv /home/fercho/.config/mako  .config/
cp -rv /home/fercho/.config/picom  .config/
cp -rv /home/fercho/.config/rofi  .config/
cp -rv /home/fercho/.config/swaync  .config/
cp -rv /home/fercho/.config/sxhkd  .config/
cp -rv /home/fercho/.config/tint2  .config/
cp -rv /home/fercho/.config/waybar  .config/

# Nautilus scripts
mkdir -p .local/nautilus/scripts
cp -rv ~/.local/share/nautilus/scripts .local/nautilus/scripts