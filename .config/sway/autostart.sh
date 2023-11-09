#!/bin/bash

/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

if [ `pgrep waybar`]; then
	killall -q waybar
else
	waybar
fi;
