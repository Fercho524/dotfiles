#!/usr/bin/env bash
#
# bat_ponderada.sh — porcentaje de batería ponderado según capacidad de diseño

# Base de sysfs
PS_DIR="/sys/class/power_supply"

# Baterías a consultar
BATS=(BAT0 BAT1)

# Arrays asociativos para diseño, porcentaje y energía actual
declare -A design pct current

for BAT in "${BATS[@]}"; do
  DIR="$PS_DIR/$BAT"

  # Leer capacidad de diseño (µWh) o fallback a charge_full_design
  if [[ -r "$DIR/energy_full_design" ]]; then
    design[$BAT]=$(<"$DIR/energy_full_design")
  else
    design[$BAT]=$(<"$DIR/charge_full_design")
  fi

  # Leer porcentaje actual
  pct[$BAT]=$(<"$DIR/capacity")

  # Calcular energía actual (µWh) a partir de diseño × % / 100
  current[$BAT]=$(( design[$BAT] * pct[$BAT] / 100 ))
done

# Totales
total_design=$(( design[BAT0] + design[BAT1] ))
total_current=$(( current[BAT0] + current[BAT1] ))

# Porcentaje global (entero)
global_pct=$(( total_current * 100 / total_design ))

# Determinar letra según umbrales
if   (( global_pct >= 80 )); then letter="󰁹"
elif (( global_pct >= 60 )); then letter="󰂁"
elif (( global_pct >= 40 )); then letter="󰁿"
elif (( global_pct >= 20 )); then letter="󰁼"
else                               letter="󰁺"
fi

# Mostrar resultados
# for BAT in "${BATS[@]}"; do
#   echo "$BAT: ${pct[$BAT]}%  (diseño ${design[$BAT]} µWh)"
# done
# echo "--------------------------------"
echo "${letter} ${global_pct}%"