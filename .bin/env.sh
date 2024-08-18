#!/bin/bash

distro="arch"

# GTK THEMING
export GTK_THEME='WhiteSur-Dark-grey'
export GTK_ICON_THEME='Tela-circle-purple-dark'
export GTK_CURSOR_THEME='Sweet-cursors'
export GTK_FONT='Sans 10'

# Comando para el ícono de la batería, cambiar por "battray" si "cbatticon" no está disponible
batticon=batttray

# Driver de la tableta gráfica
veikk_driver=/lib/vktablet/vktablet

# Autenticación gráfica, usar "lxpolkit" si gnome-polkit no está disponible
# polkit_manager=/lib/polkit-gnome/polkit-gnome-authentication-agent-1 
polkit_manager=lxpolkit

# Orientación del panel, sea tint2 o waybar
pannel_layoyt="horizontal"