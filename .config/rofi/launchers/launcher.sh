#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
# Avaiable Types
## type 1   

## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10
## style-11    style-12    style-13    style-14    style-15

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-6'
applet=$1

apps=("vktablet" "gimp" "krita" "kdenlive")

choice=$(printf "%s\n" "${apps[@]}" | rofi -show $applet -theme ${dir}/${theme}.rasi )
echo $choice

[[ -n "$choice" ]] && ~/.local/bin/launch_with_xcb.sh "$choice" &
