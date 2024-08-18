#!/bin/bash 
# Only works with my setup
 
resx1=1366
resy1=768
resx2=1366
resy2=768

if [[ $1 = "on" ]]; then
	xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x1080 --output DP-2 --mode 1024x768 --pos 0x0 
elif [[ $1 = "off" ]]; then 
	xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x1080 --output DP-2 --off
fi
