
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.interface icon-theme "$GTK_ICON_THEME"
gsettings set org.gnome.desktop.interface cursor-theme "$GTK_CURSOR_THEME"
gsettings set org.gnome.desktop.interface font-name "$GTK_FONT"

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
	# Tiempo de protector de pantallla, usar "xset s noblank" o "xset s 6000"
	xset dpms s off off
	xset s noblank

	# Configura el bloqueador automático de pantalla
	# xss-lock -- i3lock-fancy &

	# Wallpaper
	nitrogen --restore

	# Transparencies
	picom --config ~/.config/picom/picom.conf &

	# Pannel
	pgrep tint2 || killall -q tint2
	bash ~/.config/tint2/tint2.sh horizontal &

	# Battery Icon
	pgrep $batticon || $batticon &

	# Volume Icon
	pgrep volumeicon || volumeicon &