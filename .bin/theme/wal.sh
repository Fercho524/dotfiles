#!/bin/bash

# ==============================
# Variables globales y entorno
# ==============================
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
source /home/fercho/.bin/env.sh


# ==============================
# Funciones
# ==============================

get_wallpaper_path() {
  if [[ "$XDG_SESSION_TYPE" = "x11" ]]; then
    file_path=$(awk -F= 'NR==2 {print $2}' ~/.config/nitrogen/bg-saved.cfg)
  elif [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
    file_path=$(grep "wallpaper =" ~/.config/waypaper/config.ini | cut -d "=" -f 2-)
  fi

  expanded_path=$(eval echo "$file_path")
  echo "$expanded_path" | sed 's/\~/$HOME/g'
}

prepare_wallpaper() {
  local image="$1"
  cp "$image" /tmp/wallpaper
  rm -rfv ~/.cache/wal
}

apply_colorscheme() {
  if [[ "$INTERFACE_SCHEME" = "light" ]]; then
    wal -i /tmp/wallpaper -e -n -l
  elif [[ "$INTERFACE_SCHEME" = "dark" ]]; then
    wal -i /tmp/wallpaper -e -n
  fi
}

restart_panel() {
  ~/.bin/system/pannel.sh
}

apply_kitty_theme() {
  cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors.conf
}

apply_rofi_theme() {
  python ~/.config/rofi/walrofi.py
}

apply_wlcolors() {
  cp ~/.cache/wal/colors-waybar.css ~/.config/wlogout
}

apply_hyprland_theme() {
  python ~/.bin/theme/hyprwal.py ~/.cache/wal/colors.json ~/.config/hypr/theme/colors.conf
}

restart_dunst() {
  killall dunst -q
  ~/.bin/theme/update_notify.sh
  dunst
  notify-send "Scheme update succesfully" "Se ha cambiado correctamente la configuración del tema acorde al fondo de pantalla"
}

apply_gtk_theme() {
  source ~/.cache/wal/colors.sh
  icon_colors=$(python ~/.bin/theme/get_icon_variant.py "$color2")
  local variant="dark"

  gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-$icon_colors-$variant"
  sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-3.0/settings.ini
  sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Tela-circle-$icon_colors-$variant/" ~/.config/gtk-4.0/settings.ini
}

restart_swayosd() {
  cp ~/.cache/wal/colors.css ~/.config/swayosd
  killall swayosd-server
  swayosd-server &
}

# ==============================
# MAIN
# ==============================
main() {
  local image
  image=$(get_wallpaper_path)

  prepare_wallpaper "$image"
  apply_colorscheme
  restart_panel
  apply_kitty_theme
  apply_rofi_theme
  apply_wlcolors
  apply_hyprland_theme
  restart_dunst
  apply_gtk_theme
  restart_swayosd

  echo "✅ Configuración aplicada correctamente."
}

main "$@"
