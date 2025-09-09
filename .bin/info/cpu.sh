#!/bin/sh

read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 0.5
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))
#cpu_temp=$(sensors | grep 'CPU' | awk '{print $2}')
temp=$(cat /sys/class/thermal/thermal_zone1/temp)
cpu_temp=$((temp / 1000))

echo "  $cpu%    $cpu_temp °C"
