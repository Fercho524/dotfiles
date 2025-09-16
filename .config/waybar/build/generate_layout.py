#!/usr/bin/env python3
"""
create_layout.py

Ejemplo:
  ./create_layout.py \
    --input ~/.config/waybar/layouts/main.jsonc \
    --modules-file ~/.config/waybar/include.jsonc \
    --output ~/.config/waybar/layouts/main.jsonc \
    --left custom/launcher hyprland/workspaces disk custom/network \
    --center wlr/taskbar \
    --right custom/cpu custom/memory clock \
    --position top \
    --margin "8 8 8 8" \
    --height 44
"""
from __future__ import annotations
import os
import json
import argparse
import re
from typing import Dict, Any, List


DEFAULT_CONFIG: Dict[str, Any] = {
    "layer": "bottom",
    "position": "bottom",
    "height": 44,
    "spacing": 0,
    "margin-top": 0,
    "margin-bottom": 8,
    "margin-right": 8,
    "margin-left": 8,
    "include": [
        "~/.config/waybar/include.jsonc"
    ],
    "modules-left": [
        "custom/launcher",
        "hyprland/workspaces",
        "disk",
        "custom/network"
    ],
    "modules-center": [
        "wlr/taskbar"
    ],
    "modules-right": [
        "custom/cpu",
        "custom/memory",
        "battery",
        "tray",
        "clock"
    ]
}


def read_jsonc(path: str) -> Dict[str, Any]:
    """
    Lee JSONC (elimina comentarios // y /* */) y retorna dict.
    Si no existe devuelve {}.
    """
    p = os.path.expanduser(path)
    if not os.path.isfile(p):
        return {}
    text = open(p, "r", encoding="utf-8").read()
    # quitar comentarios estilo /* ... */
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    # quitar comentarios de línea //
    text = re.sub(r"//.*?$", "", text, flags=re.MULTILINE)
    # trim
    text = text.strip()
    if not text:
        return {}
    try:
        return json.loads(text)
    except json.JSONDecodeError as e:
        raise RuntimeError(f"Error parseando JSON en {p}: {e}")


def write_jsonc(data: Dict[str, Any], path: str) -> None:
    """
    Escribe JSON bonito en path (crea directorios si hace falta).
    No se añaden comentarios.
    """
    p = os.path.expanduser(path)
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
        f.write("\n")


def merge_defaults(cfg: Dict[str, Any], defaults: Dict[str, Any]) -> Dict[str, Any]:
    """
    Añade keys faltantes de defaults a cfg, sin sobrescribir keys existentes.
    Works recursively sólo para el primer nivel (suficiente para tu caso).
    """
    out = dict(cfg)  # copy
    for k, v in defaults.items():
        if k not in out:
            out[k] = v
    return out


def to_tilde(path: str) -> str:
    """
    Contracción con ~ si la ruta está bajo $HOME.
    Si ya comienza con ~ la deja igual.
    """
    if path.startswith("~"):
        return path
    p = os.path.expanduser(path)
    home = os.path.expanduser("~")
    if p.startswith(home + os.sep):
        return "~" + p[len(home):]
    return path


def parse_module_list(lst: List[str]) -> List[str]:
    """
    Convierte lista de argumentos en lista real de módulos.
    Acepta entradas como: ['a,b,c'] o ['a', 'b','c'].
    """
    out: List[str] = []
    for item in lst or []:
        # separar por comas si las hay
        if "," in item:
            parts = [p.strip() for p in item.split(",") if p.strip()]
            out.extend(parts)
        else:
            out.append(item)
    return out


def parse_margin_arg(val: str):
    """
    Recibe un string. Puede ser:
      - "8" -> todos los márgenes = 8
      - "R L T B" -> cuatro enteros en ese orden (right left top bottom)
    Retorna tuple (margin-right, margin-left, margin-top, margin-bottom) como ints.
    Lanza ValueError si formato inválido.
    """
    parts = val.split()
    if len(parts) == 1:
        v = int(parts[0])
        return v, v, v, v
    if len(parts) == 4:
        r, l, t, b = map(int, parts)
        return r, l, t, b
    raise ValueError("Formato inválido para --margin. Debe ser un entero o cuatro enteros: 'right left top bottom'")


def main():
    parser = argparse.ArgumentParser(description="Crear/editar layout de Waybar según argumentos.")
    parser.add_argument("--input", help="Archivo de entrada (config existente).", default=None)
    parser.add_argument("--modules-file", help="Ruta del archivo de módulos a incluir (se añadirá a include).", default=None)
    parser.add_argument("--output", help="Archivo de salida. Si no se especifica será igual a --input (si existe).", default=None)
    parser.add_argument("--left", nargs="+", help="Módulos para modules-left (uno o varios).", default=None)
    parser.add_argument("--center", nargs="+", help="Módulos para modules-center (uno o varios).", default=None)
    parser.add_argument("--right", nargs="+", help="Módulos para modules-right (uno o varios).", default=None)
    parser.add_argument("--position", help="position de la barra (ej. top o bottom).", default=None)
    parser.add_argument("--margin", help="márgenes: 'right left top bottom' o un entero (aplica a las 4).", default=None)
    parser.add_argument("--height", type=int, help="height de la barra.", default=None)

    args = parser.parse_args()

    input_path = args.input
    output_path = args.output

    # Regla: si no se puso --output y sí --input -> output = input
    if not output_path and input_path:
        output_path = input_path

    # Si no hay --input y tampoco --output -> error
    if not input_path and not output_path:
        parser.error("Debe especificar --input o --output. (--output sin --input usará la configuración por defecto).")

    # Cargar configuración inicial
    config: Dict[str, Any] = {}
    if input_path:
        try:
            config = read_jsonc(input_path)
        except RuntimeError as e:
            print("Aviso: error leyendo input. Se usará {} como base y luego se aplicarán cambios.".format(input_path), flush=True)
            config = {}
    else:
        # no hay input: usar config por defecto (luego se aplican cambios)
        config = {}

    # Añadir keys faltantes sin sobrescribir existentes
    config = merge_defaults(config, DEFAULT_CONFIG)

    # Ahora aplicar modificaciones según args (si se pasan)
    # --modules-file : asegurarse que esté en include (como ruta con ~)
    if args.modules_file:
        modp = to_tilde(args.modules_file)
        include_list = list(config.get("include") or [])
        if modp not in include_list:
            include_list.append(modp)
        config["include"] = include_list

    # --left --center --right : si se pasan, **sobrescriben** esa sección
    if args.left is not None:
        config["modules-left"] = parse_module_list(args.left)
    if args.center is not None:
        config["modules-center"] = parse_module_list(args.center)
    if args.right is not None:
        config["modules-right"] = parse_module_list(args.right)

    # --position
    if args.position is not None:
        config["position"] = args.position

    # --margin: formato "right left top bottom" OR single integer
    if args.margin is not None:
        try:
            r, l, t, b = parse_margin_arg(args.margin)
            config["margin-right"] = r
            config["margin-left"] = l
            config["margin-top"] = t
            config["margin-bottom"] = b
        except ValueError as e:
            parser.error(str(e))

    # --height
    if args.height is not None:
        config["height"] = args.height

    # Asegurarnos de que output_path esté definido (si no lo fue antes, y si input estaba definido lo habíamos asignado)
    if not output_path:
        parser.error("No se pudo determinar ruta de salida (--output).")

    # Crear folders y escribir
    try:
        write_jsonc(config, output_path)
        print(f"✔ Archivo escrito en: {os.path.expanduser(output_path)}")
    except Exception as e:
        raise SystemExit(f"Error escribiendo {output_path}: {e}")

if __name__ == "__main__":
    main()
