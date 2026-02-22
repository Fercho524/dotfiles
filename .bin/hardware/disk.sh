#!/bin/bash

STATE_FILE="$HOME/.cache/waybar-disk-toggle"
ICON="󰋊"

# Particiones
ROOT_MOUNT="/"
HOME_MOUNT="/home"

human() {
    awk '
    function human(x) {
        s="BKMGTPEZY";
        while (x>=1024 && length(s)>1) {
            x/=1024;
            s=substr(s,2)
        }
        return int(x+0.5) substr(s,1,1)
    }
    { print human($1) }
    '
}

get_disk() {
    local mount="$1"

    df -B1 "$mount" | awk 'NR==2 {
        used=$3;
        total=$2;
        percent=int((used/total)*100);
        printf "%s %s %d", used, total, percent
    }'
}

STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "0")

if [[ "$STATE" == "1" ]]; then
    mount="$HOME_MOUNT"
    label="HOME"
else
    mount="$ROOT_MOUNT"
    label="ROOT"
fi

read used total percent < <(get_disk "$mount")

used_h=$(echo "$used" | human)
total_h=$(echo "$total" | human)

# Clases por uso
if (( percent < 60 )); then
    class="good"
elif (( percent < 85 )); then
    class="warn"
else
    class="crit"
fi

tooltip="$label\nUsado: $used_h / $total_h\nOcupación: $percent%"

echo "{\"text\":\"$ICON $used_h / $total_h used\",\"tooltip\":\"$tooltip\",\"class\":\"$class\"}"
