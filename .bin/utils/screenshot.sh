#!/bin/bash

mode=$1
SCREENSHOTS_DIR=$(xdg-user-dir PICTURES)/Screenshots/
timestamp=$(date +'%Y-%m-%d-%H-%M-%S')

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
    # Flameshot para X11
    case $mode in
        full-copy | area-copy)
            flameshot gui ;;
        full-save)
            flameshot full --path "$SCREENSHOTS_DIR" ;;
        area-save)
            flameshot gui --path "$SCREENSHOTS_DIR" ;;
        *)
            echo "Modo no válido para X11: $mode" ;;
    esac
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
    # Grim y slurp para Wayland
    case $mode in
        full-copy)
            grim - | wl-copy ;;
        full-save)
            grim "$SCREENSHOTS_DIR/$timestamp.png" && wl-copy < "$SCREENSHOTS_DIR/$timestamp.png" ;;
        area-copy)
            grim -g "$(slurp)" - | wl-copy ;;
        area-save)
            grim -g "$(slurp)" "$SCREENSHOTS_DIR/$timestamp.png" && wl-copy < "$SCREENSHOTS_DIR/$timestamp.png" ;;
        *)
            echo "Modo no válido para Wayland: $mode" ;;
    esac

else
    echo "Sesión desconocida: $XDG_SESSION_TYPE"
fi
