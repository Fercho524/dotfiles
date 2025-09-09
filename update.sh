#!/bin/bash

# This script only copy my files to the dotfiles directory

cp -rv ~/.bin .

cp -v ~/.zshrc .
cp -v ~/.nanorc .

mkdir .cache
cp -rv ~/.cache/wal .cache/

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