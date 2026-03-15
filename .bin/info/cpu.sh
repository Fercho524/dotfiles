#!/bin/sh

get_avg_temp() {
    local total=0
    local count=0

    for zone in /sys/class/thermal/thermal_zone*/temp; do
        if [[ -f "$zone" ]]; then
            temp=$(cat "$zone")
            temp_c=$((temp / 1000))
            total=$((total + temp_c))
            count=$((count + 1))
        fi
    done

    if [[ $count -gt 0 ]]; then
        echo $((total / count))
    else
        echo 0
    fi
}

read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 0.5
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal)))
#cpu_temp=$(sensors | grep 'CPU' | awk '{print $2}')


cpu_temp=$(get_avg_temp)

echo "  $cpu%    $cpu_temp °C"
