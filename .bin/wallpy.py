import numpy as np

from icon_colors import *

from sys import argv
from typing import Dict, Tuple

def is_gray(color: Tuple[int, int, int], threshold: int = 30) -> bool:
    """
    Determina si un color es gris.
    
    :param color: Una tupla que representa el color (R, G, B).
    :param threshold: El umbral para determinar si un color es gris.
    :return: True si el color es gris, False en caso contrario.
    """
    r, g, b = color
    return abs(r - g) < threshold and abs(g - b) < threshold and abs(b - r) < threshold

def closest_color(user_color: Tuple[int, int, int], colors: Dict[str, Tuple[int, int, int]]) -> str:
    """
    Encuentra el color más cercano al color del usuario sin que sea gris, 
    a menos que el color del usuario sea gris, en cuyo caso se emparejará con el gris.

    :param user_color: Una tupla que representa el color proporcionado por el usuario (R, G, B).
    :param colors: Un diccionario de colores con nombres como claves y tuplas RGB como valores.
    :return: El nombre del color más cercano.
    """
    user_color = np.array(user_color)
    min_distance = float('inf')
    closest_color_name = None

    user_is_gray = is_gray(tuple(user_color))

    for color_name, color_value in colors.items():
        color_value = np.array(color_value)
        if user_is_gray and is_gray(tuple(color_value)):
            # Comparar solo colores grises si el color del usuario es gris
            distance = np.linalg.norm(user_color - color_value)
        elif not user_is_gray and not is_gray(tuple(color_value)):
            # Comparar solo colores no grises si el color del usuario no es gris
            distance = np.linalg.norm(user_color - color_value)
        else:
            continue
        
        if distance < min_distance:
            min_distance = distance
            closest_color_name = color_name

    return closest_color_name

def hex2tupple(hex_color):
    # Elimina el signo '#' del inicio si está presente
    hex_color = hex_color.lstrip('#')
    
    # Divide el color en sus componentes R, G, B
    r = float(int(hex_color[0:2], 16))
    g = float(int(hex_color[2:4], 16))
    b = float(int(hex_color[4:6], 16))
    
    return (r, g, b)

def hexdict2tuppledict(hexdict):
    colors_vectors = {}
    keys=list(hexdict.keys())
    
    for i in range(len(keys)):
        colors_vectors[keys[i]]=hex2tupple(hexdict[keys[i]])
        
    return colors_vectors

# Icon Variant
main_colors = tela_colors
colors = hexdict2tuppledict(main_colors)

# Main Color
color = argv[1]
user_color = hex2tupple(color)

# Colors Dict
result = closest_color(user_color, colors)
print(result,end="")
