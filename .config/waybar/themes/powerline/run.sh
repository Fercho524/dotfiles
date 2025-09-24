#!/bin/bash

# Executables
MODULE_LINKER=~/.config/waybar/build/generate_include.py
LAYOUT_GENERATOR=~/.config/waybar/build/generate_layout.py

# Config
MODULES_FOLDER=~/.config/waybar/modules/powerline
MODULES_FILE=~/.config/waybar/include/include.jsonc
LAYOUT_FILE=~/.config/waybar/layouts/tonal/config.jsonc
LAYOUT_STYLE=~/.config/waybar/styles/powerline/style.css

# Linking Modules
python $MODULE_LINKER --dirs $MODULES_FOLDER                                      

# Layouts
python $LAYOUT_GENERATOR \
--input $LAYOUT_FILE \
--modules-file $MODULES_FILE \
--output $LAYOUT_FILE \
--left custom/launcher custom/right_divB disk custom/right_divC pulseaudio custom/right_divD custom/network custom/right_divE \
--center hyprland/workspaces \
--right custom/left_divA  custom/cpu custom/left_divB memory custom/left_divC battery custom/left_divD tray custom/left_divE clock \
--position top \
--margin "0 0 0 0" \
--height 32


# Exec waybar
waybar -c $LAYOUT_FILE -s $LAYOUT_STYLE