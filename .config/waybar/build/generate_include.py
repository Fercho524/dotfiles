#!/usr/bin/env python3
import os
import sys
import json
import argparse

def find_jsonc_in_dirs(dirs):
    """
    Recorre recursivamente cada directorio en dirs,
    retorna lista de rutas absolutas de archivos .jsonc.
    """
    found = []
    for d in dirs:
        d_expanded = os.path.expanduser(d)
        if not os.path.isdir(d_expanded):
            print(f"Advertencia: {d_expanded} no es un directorio válido, se omitirá.", file=sys.stderr)
            continue
        for root, _, files in os.walk(d_expanded):
            for fn in files:
                if fn.endswith(".jsonc"):
                    full = os.path.join(root, fn)
                    found.append(full)
    return sorted(set(found))  # eliminar duplicados y ordenar

def to_tilde_path(path):
    """
    Si la ruta absoluta comienza con el home, la convierte a ~/
    """
    home = os.path.expanduser("~")
    if path.startswith(home + os.sep):
        return "~" + path[len(home):]
    elif path == home:
        return "~"
    else:
        return path

def generate_include_jsonc(modules_paths, include_file_path):
    """
    Genera el archivo include.jsonc con estructura:
    {
        "include": [ rutas... ]
    }
    """
    tilde_paths = [to_tilde_path(p) for p in modules_paths]
    data = {"include": tilde_paths}

    dir_out = os.path.dirname(os.path.expanduser(include_file_path))
    os.makedirs(dir_out, exist_ok=True)

    with open(os.path.expanduser(include_file_path), "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)
        f.write("\n")

    print(f"✅ Se escribió {include_file_path} con {len(tilde_paths)} rutas.")

def main():
    parser = argparse.ArgumentParser(
        description="Genera un include.jsonc para Waybar con módulos encontrados en directorios."
    )
    parser.add_argument(
        "--dirs",
        nargs="+",
        required=True,
        help="Uno o varios directorios donde buscar módulos .jsonc (recursivo)."
    )
    parser.add_argument(
        "--output",
        default="~/.config/waybar/include/include.jsonc",
        help="Ruta de salida para el include.jsonc (default: ~/.config/waybar/include.jsonc)"
    )

    args = parser.parse_args()

    modules = find_jsonc_in_dirs(args.dirs)
    if not modules:
        print("❌ No se encontró ningún archivo .jsonc en las rutas indicadas.", file=sys.stderr)
        sys.exit(1)

    generate_include_jsonc(modules, args.output)

if __name__ == "__main__":
    main()
