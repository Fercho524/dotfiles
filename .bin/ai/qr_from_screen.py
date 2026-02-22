import sys
import subprocess
import cv2
import numpy as np

# Leer imagen desde STDIN
image_bytes = sys.stdin.buffer.read()

if not image_bytes:
    subprocess.run(["notify-send", "QR Reader", "No se recibió imagen"])
    sys.exit(1)

# Decodificar imagen
image_array = np.frombuffer(image_bytes, dtype=np.uint8)
img = cv2.imdecode(image_array, cv2.IMREAD_COLOR)

if img is None:
    subprocess.run(["notify-send", "QR Reader", "Error decodificando la imagen"])
    sys.exit(1)

# Detectar QR
qr = cv2.QRCodeDetector()
data, points, _ = qr.detectAndDecode(img)

if not data:
    subprocess.run(["notify-send", "QR Reader", "No se detectó ningún QR"])
    print("No se detectó ningún QR.")
    sys.exit(1)

print(data)

# Copiar texto al portapapeles
try:
    proc = subprocess.Popen(["wl-copy"], stdin=subprocess.PIPE)
    proc.communicate(input=data.encode("utf-8"))
except Exception as e:
    msg = f"Error copiando al portapapeles: {e}"
    subprocess.run(["notify-send", "QR Reader", msg])
    print(msg)
    sys.exit(1)

# Notificación final
subprocess.run([
    "notify-send",
    "QR detectado",
    f"Contenido copiado al portapapeles:\n{data}"
])
