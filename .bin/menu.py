# -*- coding: utf-8 -*-

import os
import curses

def get_themes():
    home_dir = os.path.expanduser("~")
    themes_dir = os.path.join(home_dir, ".themes")
    themes = os.listdir(themes_dir) + os.listdir("/usr/share/themes")

    themes_escaped = []
    for theme in themes:
        theme_escaped = theme.replace(" ", "\ ")
        themes_escaped.append(theme_escaped)

    return themes_escaped

def show_options(stdscr, options, selected, offset):
    stdscr.clear()
    rows, cols = stdscr.getmaxyx()

    visible_options = options[offset:offset+rows-1]

    for i, opcion in enumerate(visible_options):
        if i == selected:
            stdscr.addstr(i, 0, opcion, curses.A_REVERSE)
        else:
            stdscr.addstr(i, 0, opcion)

    stdscr.refresh()

def main(stdscr):
    themes = get_themes()
    seleccion = 0
    offset = 0    

    # Configurar el entorno curses
    curses.curs_set(1)  # Ocultar el cursor
    stdscr.keypad(1)  # Habilitar el uso de teclas especiales

    # Inicializar la pantalla
    stdscr.clear()
    stdscr.refresh()

    while True:
        show_options(stdscr, themes, seleccion, offset)

        # Leer la entrada del usuario
        key = stdscr.getch()

        if key == curses.KEY_UP:
            seleccion = max(0, seleccion - 1)
            if seleccion < offset:
                offset = seleccion
        elif key == curses.KEY_DOWN:
            seleccion = min(len(themes) - 1, seleccion + 1)
            rows, cols = stdscr.getmaxyx()
            if seleccion >= offset + rows - 1:
                offset = min(seleccion - rows + 2, len(themes) - rows)
        elif key == ord('\n'):  # Tecla Enter
            opcion_seleccionada = themes[seleccion]
            stdscr.clear()
            stdscr.addstr(0, 0, f"Seleccionaste: {opcion_seleccionada.encode('utf-8')}")
            stdscr.refresh()
            stdscr.getch()  # Esperar a que el usuario presione una tecla para continuar
            break

if __name__ == "__main__":
    curses.wrapper(main)
