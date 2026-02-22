#!/bin/bash

BAT0="/sys/class/power_supply/BAT0"
BAT1="/sys/class/power_supply/BAT1"
STATE_FILE="$HOME/.cache/waybar-battery-toggle"

# =========================
# ICONOS (Nerd Fonts)
# =========================
icon_for_percent() {
    local p="$1"
    local charging="$2"

    if (( charging )); then
        if (( p >= 90 )); then echo "󰂅"
        elif (( p >= 60 )); then echo "󰂋"
        elif (( p >= 30 )); then echo "󰂉"
        elif (( p >= 10 )); then echo "󰂆"
        else echo "󰢜"
        fi
    else
        if (( p >= 90 )); then echo "󰁹"
        elif (( p >= 60 )); then echo "󰂀"
        elif (( p >= 30 )); then echo "󰁿"
        elif (( p >= 10 )); then echo "󰁼"
        else echo "󰁺"
        fi
    fi
}

class_for_percent() {
    local p="$1"
    if (( p >= 60 )); then echo "good"
    elif (( p >= 30 )); then echo "warn"
    else echo "crit"
    fi
}

read_bat() {
    local bat="$1"

    [[ -d "$bat" ]] || echo "0 0 0 Unknown 0"

    local now=$(<"$bat/energy_now")
    local full=$(<"$bat/energy_full")
    local power=$(<"$bat/power_now")
    local status=$(<"$bat/status")
    local cycles=$(cat "$bat/cycle_count" 2>/dev/null || echo "N/A")

    echo "$now $full $power $status $cycles"
}

calc_percent() {
    awk "BEGIN { printf \"%d\", ($1/$2)*100 }"
}

calc_time() {
    local now="$1"
    local full="$2"
    local power="$3"
    local status="$4"

    (( power <= 0 )) && echo "N/A" && return

    if [[ "$status" == "Discharging" ]]; then
        awk "BEGIN {
            t=$now/$power;
            printf \"%dh %02dm\", int(t), int((t-int(t))*60)
        }"
    elif [[ "$status" == "Charging" ]]; then
        awk "BEGIN {
            t=($full-$now)/$power;
            printf \"%dh %02dm\", int(t), int((t-int(t))*60)
        }"
    else
        echo "N/A"
    fi
}

STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "0")

# =========================
# MODO TOTAL
# =========================
if [[ "$STATE" == "1" ]]; then
    read n0 f0 p0 s0 c0 < <(read_bat "$BAT0")
    read n1 f1 p1 s1 c1 < <(read_bat "$BAT1")

    total_now=$((n0 + n1))
    total_full=$((f0 + f1))
    total_power=$((p0 + p1))

    percent=$(calc_percent "$total_now" "$total_full")
    charging=$([[ "$s0" == "Charging" || "$s1" == "Charging" ]] && echo 1 || echo 0)

    icon=$(icon_for_percent "$percent" "$charging")
    class=$(class_for_percent "$percent")
    time=$(calc_time "$total_now" "$total_full" "$total_power" "$s0")

    tooltip="TOTAL\nCarga: $percent%\nTiempo: $time"

    echo "{\"text\":\"$icon $percent%\",\"tooltip\":\"$tooltip\",\"class\":\"$class\"}"
    exit 0
fi

# =========================
# MODO INDIVIDUAL
# =========================
read n0 f0 p0 s0 c0 < <(read_bat "$BAT0")
read n1 f1 p1 s1 c1 < <(read_bat "$BAT1")

p0p=$(calc_percent "$n0" "$f0")
p1p=$(calc_percent "$n1" "$f1")

i0=$(icon_for_percent "$p0p" $([[ "$s0" == "Charging" ]] && echo 1 || echo 0))
i1=$(icon_for_percent "$p1p" $([[ "$s1" == "Charging" ]] && echo 1 || echo 0))

class=$(class_for_percent "$(( (p0p + p1p) / 2 ))")

t0=$(calc_time "$n0" "$f0" "$p0" "$s0")
t1=$(calc_time "$n1" "$f1" "$p1" "$s1")

tooltip="BAT0: $p0p% ($s0)\nTiempo: $t0\nCiclos: $c0\n\nBAT1: $p1p% ($s1)\nTiempo: $t1\nCiclos: $c1"

echo "{\"text\":\"$i0 $p0p% $i1 $p1p%\",\"tooltip\":\"$tooltip\",\"class\":\"$class\"}"
