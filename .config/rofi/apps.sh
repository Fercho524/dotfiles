rofi_command="rofi -theme ~/.config/rofi/applets/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
music=""
settings=""

# Error msg
msg() {
	rofi -theme "~/.config/rofi/applets/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
$terminal)
	if [[ -f /usr/bin/alacritty ]]; then
		alacritty &
	elif [[ -f /usr/bin/tilix ]]; then
		tilix &
	elif [[ -f /usr/bin/kitty ]]; then
		kitty &
	elif [[ -f /usr/bin/termite ]]; then
		termite &
	elif [[ -f /usr/bin/xfce4-terminal ]]; then
		xfce4-terminal &
	elif [[ -f /usr/bin/gnome-terminal ]]; then
		gnome-terminal &
	else
		msg "No suitable terminal found!"
	fi
	;;
$files)
	if [[ -f /usr/bin/nemo ]]; then
		nemo &
	elif [[ -f /usr/bin/nautilus ]]; then
		nautilus &
	else
		msg "No suitable file manager found!"
	fi
	;;
$editor)
	if [[ -f /usr/bin/gedit ]]; then
		gedit &
	elif [[ -f /usr/bin/code ]]; then
		code &
	else
		msg "No suitable text editor found!"
	fi
	;;
$browser)
	if [[ -f /usr/bin/firefox ]]; then
		firefox &
	elif [[ -f /usr/bin/chromium ]]; then
		chromium &
	elif [[ -f /usr/bin/midori ]]; then
		midori &
	else
		msg "No suitable web browser found!"
	fi
	;;
$music)
	if [[ -f /usr/bin/lxmusic ]]; then
		lxmusic &
	else
		msg "No suitable music player found!"
	fi
	;;
$settings)
	if [[ -f /usr/bin/xfce4-settings-manager ]]; then
		xfce4-settings-manager &
	else
		msg "No suitable settings manager found!"
	fi
	;;
esac
