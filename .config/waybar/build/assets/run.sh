#!/bin/bash

# Executables
MODULE_LINKER=~/.config/waybar/build/generate_include.py
LAYOUT_GENERATOR=~/.config/waybar/build/generate_layout.py

# Config
MODULES_FOLDER=~/.config/waybar/modules
MODULES_FILE=~/.config/waybar/include/include.jsonc
LAYOUT_FILE=~/.config/waybar/layouts/tonal/config.jsonc
LAYOUT_STYLE=~/.config/waybar/styles/tonal/main.css

# Linking Modules
python $MODULE_LINKER --dirs $MODULES_FOLDER                                      

# Layouts
python $LAYOUT_GENERATOR \
--input $LAYOUT_FILE \
--modules-file $MODULES_FILE \
--output $LAYOUT_FILE \
--left custom/launcher hyprland/workspaces disk custom/network \
--center wlr/taskbar \
--right pulseaudio custom/cpu memory tray clock \
--position bottom \
--margin "8 8 0 8" \
--height 44

# Exec waybar
waybar -c $LAYOUT_FILE -s $LAYOUT_STYLE