#!/bin/bash

if pgrep -x "wlsunset" > /dev/null; then
    echo "wlsunset ya está corriendo. Deteniendo..."
    pkill -x "wlsunset"
else
    echo "Iniciando wlsunset..."
    wlsunset -T 4500 -t 1000 -g 0.9 &
fi