import json
import os

def hex_to_rgba(hex_color, alpha_percent):
    hex_color = hex_color.lstrip('#')
    r, g, b = hex_color[:2], hex_color[2:4], hex_color[4:6]
    # Convert alpha percent (0-100) to 0-255 range, then to 2-digit hex
    alpha_int = int(round((int(alpha_percent) / 100) * 255))
    a = f"{alpha_int:02x}"
    return f"rgba({r}{g}{b}{a})"

def convert_colors(json_path, output_path):
    # Leer archivo JSON
    with open(json_path, 'r') as f:
        data = json.load(f)

    alpha = data.get('alpha', '100')  # valor por defecto: 100

    conf_lines = []

    # Procesar "special"
    if 'special' in data:
        for name, hex_color in data['special'].items():
            rgba = hex_to_rgba(hex_color, alpha)
            conf_lines.append(f"${name} = {rgba}")

    # Procesar "colors"
    if 'colors' in data:
        for name, hex_color in data['colors'].items():
            rgba = hex_to_rgba(hex_color, alpha)
            conf_lines.append(f"${name} = {rgba}")

    # Guardar como .conf
    with open(output_path, 'w') as f:
        f.write('\n'.join(conf_lines))

    print(f"Archivo .conf generado en: {output_path}")

# ========== USO ==========
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Convierte colores hex a rgba desde un archivo JSON y los guarda en un archivo .conf.")
    parser.add_argument("json_path", help="Ruta del archivo .json original")
    parser.add_argument("output_path", help="Ruta donde guardar el archivo .conf resultante")

    args = parser.parse_args()
    convert_colors(args.json_path, args.output_path)
