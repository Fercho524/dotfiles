#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null; then
    echo "wlsunset ya está corriendo. Deteniendo..."
    killall hyprsunset
else
    echo "Iniciando wlsunset..."
    hyprsunset  -t 4000 -g 80 &
fi