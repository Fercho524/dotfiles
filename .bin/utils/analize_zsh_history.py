import os
import re
import json
import shlex
import string

from collections import OrderedDict


def extraer_comandos(ruta_archivo:str)->list[str]:
    comandos = []

    # Intentar abrir con UTF-8, si falla, usar latin-1
    try:
        with open(ruta_archivo, "r", encoding="utf-8") as f:
            contenido = f.read()
    except UnicodeDecodeError:
        with open(ruta_archivo, "r", encoding="latin-1") as f:
            contenido = f.read()

    # Eliminar caracteres no imprimibles
    printable = set(string.printable)
    contenido = ''.join(c for c in contenido if c in printable)

    # Procesar línea por línea
    for linea in contenido.splitlines():
        linea = linea.strip()
        if ";" in linea:
            _, cmd = linea.split(";", 1)
            if cmd:
                comandos.append(cmd.strip())
        elif linea:
            # Si no hay ';', incluir la línea completa
            comandos.append(linea)
    
    return comandos


def extraer_repos_git(comandos:list[str]) -> list[str]: 
    repos = []
    # Regex: busca 'git clone ' seguido de algo que parezca URL o ruta
    patron = re.compile(r'git\s+clone\s+([^\s]+)', re.IGNORECASE)

    for cmd in comandos:
        match = patron.search(cmd)
        if match:
            repos.append(match.group(1))  # Captura la URL
    return list(set(repos))


def extraer_archivos_editados(comandos):
    """
    Dada una lista de comandos, encuentra archivos editados con nano, nvim o code.
    Devuelve un diccionario {ruta_absoluta: contenido}.
    """
    editores = ("nano", "nvim", "code")
    archivos = set()

    for cmd in comandos:
        partes = cmd.strip().split()
        if not partes:
            continue
        if partes[0] in editores and len(partes) > 1:
            # Tomar el último argumento como archivo/ruta
            ruta = partes[-1]
            ruta = os.path.expanduser(ruta)   # expandir ~
            ruta = os.path.abspath(ruta)      # convertir a absoluta
            archivos.add(ruta)

    resultado = {}
    for ruta in archivos:
        if os.path.isfile(ruta):  # asegurarnos de que es archivo
            try:
                with open(ruta, "r", encoding="utf-8", errors="ignore") as f:
                    contenido = f.read()
                resultado[ruta] = contenido
            except Exception as e:
                print(f"⚠️ No se pudo leer {ruta}: {e}")
    return resultado


def extraer_servicios_systemctl(comandos):
    """
    Dada una lista de comandos, extrae servicios habilitados o reiniciados manualmente
    mediante systemctl enable o systemctl restart, incluyendo aquellos con 'sudo'.

    Parámetros:
        comandos (list[str]): Lista de comandos de terminal

    Retorna:
        list[str]: Lista de servicios únicos
    """
    servicios = set()
    # Regex: opcional 'sudo', seguido de 'systemctl enable|restart' y nombre del servicio
    patron = re.compile(r'^(sudo\s+)?systemctl\s+(enable|restart)\s+([^\s]+)', re.IGNORECASE)

    for cmd in comandos:
        match = patron.search(cmd)
        if match:
            servicios.add(match.group(3))  # nombre del servicio

    return list(servicios)


def extraer_paquetes_instalados(comandos):
    """
    Extrae paquetes instalados desde una lista de comandos.
    Detecta comandos de: yay, pacman, dnf (con o sin 'sudo').

    Retorna:
        dict con dos claves:
          - "details": {'yay': [ {command, packages, options}, ... ], 'pacman': [...], 'dnf': [...]}
          - "unique": {'yay': [pkg1, pkg2, ...], 'pacman': [...], 'dnf': [...]}
    """
    resultados = {'yay': [], 'pacman': [], 'dnf': []}

    # regex para detectar la invocación (con o sin sudo)
    re_mgr = re.compile(r'^(?:sudo\s+)?(yay|pacman|dnf)\b(.*)$', re.IGNORECASE)

    for raw in comandos:
        linea = raw.strip()
        m = re_mgr.match(linea)
        if not m:
            continue
        mgr = m.group(1).lower()
        resto = m.group(2).strip()

        # Tokenizar respetando comillas
        try:
            tokens = shlex.split(resto)
        except ValueError:
            # fallback simple si shlex falla
            tokens = resto.split()

        # Opciones (tokens que comienzan con '-')
        opciones = [t for t in tokens if t.startswith('-')]

        paquetes = []
        if mgr == 'dnf':
            # buscamos el subcomando 'install'
            try:
                idx_install = next(i for i,t in enumerate(tokens) if t.lower() == 'install')
            except StopIteration:
                idx_install = None

            if idx_install is not None:
                for t in tokens[idx_install+1:]:
                    if t.startswith('-'):
                        if t not in opciones:
                            opciones.append(t)
                    else:
                        paquetes.append(t)
            else:
                # heurística: si no hay 'install', tomar como paquetes los tokens que no son opciones
                paquetes = [t for t in tokens if not t.startswith('-') and t.lower() not in ('install','remove','upgrade')]
        else:
            # pacman o yay -> normalmente usan -S / -Syu / --sync para instalar
            # Buscamos el primer token que NO sea opción (no empieza con '-') y no sea algo como 'install'
            first_pkg_idx = next((i for i,t in enumerate(tokens) if not t.startswith('-') and t.lower() != 'install'), None)
            if first_pkg_idx is not None:
                paquetes = [t for t in tokens[first_pkg_idx:] if not t.startswith('-')]
            else:
                paquetes = []  # no se detectaron paquetes explícitos

        # Normalizar: quitar tokens vacíos y duplicados (preservando orden)
        seen = OrderedDict()
        for p in paquetes:
            if p and p not in seen:
                seen[p] = None
        paquetes_unicos = list(seen.keys())

        # Normalizar opciones (únicas, en orden)
        opciones = list(OrderedDict.fromkeys(opciones))

        if paquetes_unicos:
            resultados[mgr].append({
                'command': linea,
                'packages': paquetes_unicos,
                'options': opciones
            })

    # Construir lista única de paquetes por gestor
    unique = {}
    for mgr, lista in resultados.items():
        seen = OrderedDict()
        for entry in lista:
            for p in entry['packages']:
                if p not in seen:
                    seen[p] = None
        unique[mgr] = list(seen.keys())

    return {'details': resultados, 'unique': unique}


def guardar_json(data, nombre_archivo):
    """
    Guarda data en un archivo JSON con indentación.
    """
    with open(nombre_archivo, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

if __name__ == "__main__":
    # Ruta del historial
    ruta = os.path.expanduser("~/.zsh_history")
    
    # Extraer todos los comandos
    comandos = extraer_comandos(ruta)

    # 1️⃣ Repositorios Git clonados
    git_repos = extraer_repos_git(comandos)
    guardar_json(git_repos, "git_repos.json")

    # 2️⃣ Archivos editados
    files = extraer_archivos_editados(comandos)
    guardar_json(files, "archivos_editados.json")

    # 3️⃣ Servicios habilitados / reiniciados con systemctl
    services = extraer_servicios_systemctl(comandos)
    guardar_json(services, "services_systemctl.json")

    # 4️⃣ Paquetes instalados con yay / pacman / dnf
    paquetes = extraer_paquetes_instalados(comandos)

    # Guardar por gestor
    for gestor, lista_paquetes in paquetes["unique"].items():
        nombre_archivo = f"paquetes_{gestor}.json"
        guardar_json(lista_paquetes, nombre_archivo)

    print("✅ Archivos JSON generados:")
    print("- git_repos.json")
    print("- archivos_editados.json")
    print("- services_systemctl.json")
    for gestor in paquetes["unique"]:
        print(f"- paquetes_{gestor}.json")