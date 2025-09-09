#!/bin/bash

if pgrep -x "wlsunset" > /dev/null; then
    echo "wlsunset ya está corriendo. Deteniendo..."
    pkill -x "hyprsunset"
else
    echo "Iniciando wlsunset..."
    hyprsunset  -t 4000 -g 80 &
fi