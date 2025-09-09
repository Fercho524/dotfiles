#!/bin/bash

distro="arch"
source ~/.bin/env.sh

if [[ $distro = "fedora" ]]; then
    if [[ $1 = "up" ]]; then
        amixer  sset Master 5%+
        elif [[ $1 = "down" ]]; then
        amixer  sset Master 5%-
        elif [[ $1 = "mute" ]]; then
        amixer  sset Master toggle
        elif [[ $1 = "mic" ]]; then
        amixer  sset Capture toggle
    fi
elif [[ $distro = "arch" ]]; then
    if [[ $1 = "up" ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        elif [[ $1 = "down" ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        elif [[ $1 = "mute" ]]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        elif [[ $1 = "mic" ]]; then
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
    fi
fi


