#!/bin/bash

mode=$1
SCREENSHOTS_DIR=$(xdg-user-dir PICTURES)/Screenshots/


if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
    # Flameshot Docs : https://github.com/flameshot-org/flameshot
    if [[ $mode = "full-copy" ]]; then
        flameshot gui
    elif [[ $mode = "full-save" ]]; then
        flameshot full
    elif [[ $mode = "area-copy" ]]; then
        flameshot gui
    elif [[ $mode = "area-save" ]]; then
        flameshot gui
    fi
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
    # Grim Docs : https://sr.ht/~emersion/grim/
    if [[ $mode = "full-copy" ]]; then
        grim - | wl-copy
    elif [[ $mode = "full-save" ]]; then
        grim $SCREENSHOTS_DIR$(date +'%Y%m%d%H%M%S%s.png')
    elif [[ $mode = "area-copy" ]]; then
        grim -g "$(slurp)" - | wl-copy
    elif [[ $mode = "area-save" ]]; then
        grim -g "$(slurp)" $SCREENSHOTS_DIR$(date +'%Y%m%d%H%M%S%s.png')
    fi
fi
