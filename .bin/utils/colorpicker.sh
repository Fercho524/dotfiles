#!/bin/bash

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
	color=$(xcolor --format hex --preview-size 255 --scale 10)
	image=/tmp/${color}.png

	if [[ "$color" ]]; then
		# copy color code to clipboard
		echo $color | tr -d "\n" | xclip -selection clipboard
		# generate preview
		convert -size 48x48 xc:"$color" ${image}
		# notify about it
		dunstify -u low -h string:x-dunst-stack-tag:obcolorpicker -i ${image} "$color, copied to clipboard."
	fi

elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
	# Este comando largísimo funciona en wayland
	#color=$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | grep -Eo '#[0-9A-Fa-f]{6}')
	hyprpicker -q
fi
