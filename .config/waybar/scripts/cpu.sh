#!/bin/sh

read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 0.5
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))
cpu_temp=$(sensors | grep 'temp1:' | awk '{print $2}')

echo "  $cpu%    $cpu_temp "