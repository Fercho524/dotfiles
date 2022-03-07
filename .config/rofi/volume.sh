#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

rofi_command="rofi -theme ~/.config/rofi/applets/volume.rasi"

## Get Volume
#VOLUME=$(amixer get Master | tail -n 1 | awk -F ' ' '{print $5}' | tr -d '[]%')
MUTE=$(amixer get Master | tail -n 1 | awk -F ' ' '{print $6}' | tr -d '[]%')

active=""
urgent=""

if [[ $MUTE == *"off"* ]]; then
    active="-a 1"
else
    urgent="-u 1"
fi

if [[ $MUTE == *"off"* ]]; then
    active="-a 1"
else
    urgent="-u 1"
fi

if [[ $MUTE == *"on"* ]]; then
    VOLUME="$(amixer get Master | tail -n 1 | awk -F ' ' '{print $5}' | tr -d '[]%')%"
else
    VOLUME="Mu..."
fi

## Icons
ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$VOLUME" -dmenu $active $urgent -selected-row 0)"
case $chosen in
$ICON_UP)
    pactl set-sink-volume @DEFAULT_SINK@ +10% "Volume Up $ICON_UP"
    ;;
$ICON_DOWN)
    pactl set-sink-volume @DEFAULT_SINK@ -10% "Volume Down $ICON_DOWN"
    ;;
$ICON_MUTED)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac
