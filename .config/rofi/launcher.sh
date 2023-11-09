#!/bin/bash

# STYLES
# window  how (windows 10, 11, elementary)
# appdrawer how (macos, android, gnome, deepin)

theme="~/.config/rofi/launchers/window.rasi"
#theme="~/.config/rofi/launchers/appdrawer.rasi"

rofi -show drun -theme $theme
