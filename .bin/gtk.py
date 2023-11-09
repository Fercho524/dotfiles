import os
import curses


max_options = 5


def get_themes():
    home_dir = os.path.expanduser("~")
    themes_dir = os.path.join(home_dir, ".themes")
    themes = os.listdir(themes_dir) + os.listdir("/usr/share/themes")

    return themes

def show_options(stdscr, opciones, opcion_seleccionada):
    stdscr.clear()
    for i, opcion in enumerate(opciones):
        if i == opcion_seleccionada:
            stdscr.addstr(i, 0, opcion, curses.A_REVERSE)
        else:
            stdscr.addstr(i, 0, opcion)
    stdscr.refresh()


def main(stdscr):
    themes = get_themes()
    seleccion = 0

    # Configurar el entorno curses
    curses.curs_set(0)  # Ocultar el cursor
    stdscr.nodelay(1)  # Hacer que getch() sea no bloqueante
    stdscr.keypad(1)  # Habilitar el uso de teclas especiales

    # Inicializar la pantalla
    stdscr.clear()
    stdscr.refresh()

    while True:
        show_options(stdscr, themes, seleccion)

        # Leer la entrada del usuario
        key = stdscr.getch()

        if key == curses.KEY_UP:
            seleccion = max(0, seleccion - 1)
        elif key == curses.KEY_DOWN:
            seleccion = min(len(themes) - 1, seleccion + 1)
        elif key == ord('\n'):  # Tecla Enter
            opcion_seleccionada = themes[seleccion]
            stdscr.addstr(len(themes) + 1, 0, f"Seleccionaste: {opcion_seleccionada}")
            stdscr.refresh()
            stdscr.getch()  # Esperar a que el usuario presione una tecla para continuar
            break

if __name__ == "__main__":
    curses.wrapper(main)
