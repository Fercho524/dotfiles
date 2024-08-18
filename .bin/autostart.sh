#!/bin/bash

source ~/.bin/env.sh

#################################################################
# 			TEMAS GTK Y QT
#################################################################

gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.interface icon-theme "$GTK_ICON_THEME"
gsettings set org.gnome.desktop.interface cursor-theme "$GTK_CURSOR_THEME"
gsettings set org.gnome.desktop.interface font-name "$GTK_FONT"

#################################################################
# 			DRIVERS AND DAEMONS
#################################################################

# Aplicaciones de Java
export _JAVA_AWT_WM_NONREPARENTING=1
wmname LG3D

# Graphic Tablet Driver
pgrep vktablet || $veikk_driver &

# Auth Dialog Daemon
pgrep $polkit_manager || $polkit_manager &

#################################################################
# 			SYSTRAY AND PANNEL
#################################################################

# Devices Manager
killall udiskie
udiskie -t -A -N &

# Bluetooth
pgrep blueman-applet || blueman-applet &

# Network Information Applet
pgrep nm-applet || nm-applet &

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then

	#################################################################
	# 			XORG CONFIG
	#################################################################

	# Tiempo de inactividad : tiempo para apagar la pantalla (s) y tiempo para suspender.
	#xset dpms 300 600
	xset dpms s off off

	# Tiempo de protector de pantallla, usar "xset s off" para desactivar el salvapantallas
	#xset s on
	#xset s 6000
	#xset s noblank
	xset s off

	# Velocidad del teclado, 250 caracteres/segundo, con 30 ms de retardo
	#xset r rate 230 30

	# Configura el bloqueador automático de pantalla
	# xss-lock -- i3lock-fancy &

	# Historial de portapapeles
	clipmenud &

	#################################################################
	# 			CONFIGURACIONES COSMÉTICAS
	#################################################################

	# Wallpaper
	nitrogen --restore

	# Transparencies
	picom --config ~/.config/picom/picom.conf &

	# Pywal Daemon (Only for xorg)
	~/.bin/walxdaemon.sh &

	#################################################################
	# 			SYSTRAY AND PANNEL
	#################################################################

	# Pannel
	pgrep tint2 || killall -q tint2
	bash ~/.config/tint2/tint2.sh horizontal &

	# Battery Icon
	pgrep $batticon || $batticon &

	# Volume Icon
	pgrep volumeicon || volumeicon &

elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
	#################################################################
	# 			SYSTRAY AND PANNEL
	#################################################################

	swaync &

	waypaper --restore

	# Sway ejecuta automáticamente waybar
	if [[ $(echo $DESKTOP_SESSION) != "sway" ]]; then
		killall waybar
		waybar &
	else
		export WAYLAND_DEBUG=1
		export MOZ_ENABLE_WAYLAND=1
		export XDG_CURRENT_DESKTOP=sway

		# File choosef fix
		/usr/libexec/xdg-desktop-portal-gtk &
	fi
fi
