#!/bin/bash

if [[ `pgrep lxpolkit` ]]; then
	echo;
else
	lxpolkit &
fi

if [ `pgrep waybar`]; then
	killall -q waybar
else
	waybar
fi;
