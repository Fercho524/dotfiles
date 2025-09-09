#!/bin/bash

mkdir -p $(xdg-user-dir VIDEOS)/Recordings 

if [[ $(echo $XDG_SESSION_TYPE) = "x11" ]]; then
    if [[ $1 = "full" ]]; then
        echo "Hola buenas"
    elif [[ $1 = "area" ]]; then
        echo "Hola buenas"
    elif [[ $1 = "end" ]]; then
        echo "Hola buenas"
    fi
elif [[ $(echo $XDG_SESSION_TYPE) = "wayland" ]]; then
    if [[ $1 = "full" ]]; then
        wf-recorder -a -f $(xdg-user-dir VIDEOS)/Recordings/$(date +'%Y%m%d%H%M%S%s.mp4')
    elif [[ $1 = "area" ]]; then
        wf-recorder -a -f $(xdg-user-dir VIDEOS)/Recordings/$(date +'%Y%m%d%H%M%S%s.mp4') -g "$(slurp)"
    elif [[ $1 = "stop" ]]; then
        killall wf-recorder
    fi
fi

# obs --startrecording