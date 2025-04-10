#!/bin/zsh

source ~/.bin/env.sh
type="laptop"

if [[ $type = "monitor" ]]; then
    if [[ $1 = "up" ]]; then
        xrandr --output HDMI-0 --gamma $(xrandr --verbose | grep -m 1 "Gamma" | awk '{print $2}' | grep -v '^$') --brightness $(echo "$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ') + 0.1" | bc)
        elif [[ $1 = "down" ]]; then
        xrandr --output HDMI-0 --gamma $(xrandr --verbose | grep -m 1 "Gamma" | awk '{print $2}' | grep -v '^$') --brightness $(echo "$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ') - 0.1" | bc)
        elif [[ $1 = "night-on" ]]; then
        xrandr --output HDMI-0 --gamma 1.0:0.8:0.7 --brightness "$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')"
        elif [[ $1 = "night-off" ]]; then
        xrandr --output HDMI-0 --gamma 1.0:1.0:1.0 --brightness "$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')"
    fi
elif [[ $type = "laptop" ]]; then
    if [[ $1 = "up" ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    elif [[ $1 = "down" ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    elif [[ $1 = "night-on" ]]; then
        redshift -O 4500
    elif [[ $1 = "night-off" ]]; then
        redshift -x
    fi
fi
