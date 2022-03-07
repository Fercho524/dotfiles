#!/bin/bash

if [[ $(echo $DESKTOP_SESSION) = "i3" || $(echo $DESKTOP_SESSION) = "bspwm" || $(echo $DESKTOP_SESSION) = "bspwm" ]]; then
	# Cosas que no conozco
	#dex -a -s /etc/xdg/autostart/:~/.config/autostart/
	#clipmenud &
	#xsetroot -cursor_name left_ptr &
	#xset r rate 230 30
	batticon=cbatticon
	polkit_manager=/lib/polkit-gnome/polkit-gnome-authentication-agent-1 
	#polkit_manager=lxpolkit
	veikk_driver=/lib/vktablet/vktablet

	setxkbmap latam
	nitrogen --restore

	# Time on screen
	xset s off &# don't activate screensaver
	xset -dpms &# disable DPMS (Energy Star) features.
	xset s noblank &# don't blank the video device

	# Screenlock
	xss-lock -- i3lock-fancy &

	# For java aplications
	wmname LG3D

	if [[ $(pgrep picom) ]]; then
		echo
	else
		picom --experimental-backends --blur-size 10 &
	fi

	if [[ $(pgrep nm-applet) ]]; then
		echo
	else
		nm-applet &
	fi

	if [[ $(pgrep udiskie) ]]; then
		echo
	else
		udiskie -t &
	fi

	# In fedora cbatticon is not full compatible, in that case you have to use battray
	if [[ $(pgrep $batticon) ]]; then
		echo
	else
		$batticon &
	fi

	# Dont forget the polkit if you want to use pamac, etcher or the graphical snap store, much people forget use that.
	if [[ $(pgrep $polkit_manager) ]]; then
		echo
	else
		$polkit_manager &
	fi

	if [[ `pgrep volumeicon` ]]; then
		killall volumeicon 
		volumeicon &
	else
		volumeicon &
	fi

	# You can change by polybar or lemonbar
	if [ $($(pgrep tint2)) ]; then
		killall -q tint2
	else
		bash ~/.config/tint2/tint2.sh vertical &
	fi

	# Loading the VEIKK S640 Driver
	if [ `pgrep vktablet` ]; then
		killall -q vktablet 
		$veikk_driver &
	else 
		$veikk_driver &
		echo "hello"
	fi

elif [[ $(echo $DESKTOP_SESSION) = "sway" ]]; then

	if [[ $(pgrep udiskie) ]]; then
		echo
	else
		udiskie -t &
	fi

	if [[ $(pgrep lxpolkit) ]]; then
		echo
	else
		$polkit_manager &
	fi
	
	if [ `pgrep vktablet` ]; then		
		killall -q vktablet 
		$veikk_driver &
	else 
		$veikk_driver &
		echo "hello"
	fi

	killall waybar 
	waybar &

	gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-Polar-v40'
	gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black'
	gsettings set org.gnome.desktop.interface cursor-theme 'Breeze'
	gsettings set org.gnome.desktop.interface font-name "Cantarell Regular 10"
fi

