#!/bin/zsh

source ~/.bin/env.sh
type="laptop"

if [[ $1 = "up" ]]; then
        brightnessctl set +5%
    elif [[ $1 = "down" ]]; then
        brightnessctl set 5%-
fi