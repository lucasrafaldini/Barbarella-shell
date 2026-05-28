<p align="center">
  <img src="https://img.shields.io/badge/shell-zsh%20%2B%20bash-ff69b4" alt="Shell">
  <img src="https://img.shields.io/badge/temas-7-blueviolet" alt="Temas">
  <img src="https://img.shields.io/badge/bordes-98-hotpink" alt="Bordes">
  <img src="https://img.shields.io/badge/licencia-MIT-green" alt="Licencia">
</p>

<h1 align="center">Barbarella</h1>
<p align="center"><b>Un framework de terminal femenino para Zsh y Bash</b></p>
<p align="center">
  <a href="#instalación">Instalación</a> &bull;
  <a href="#temas">Temas</a> &bull;
  <a href="#bordes">Bordes</a> &bull;
  <a href="#comandos">Comandos</a> &bull;
  <a href="#atajos-de-teclado">Atajos</a>
</p>
<p align="center">
  <a href="README.md">English</a> &bull;
  <a href="README.pt-BR.md">Portugues (BR)</a> &bull;
  <b>Espanol</b>
</p>

---

Barbarella transforma tu terminal en algo hermoso. Inspirado en Oh My Zsh e iTerm, trae temas de colores femeninos, bordes decorativos en el prompt, gestion de alias, atajos de teclado y un manual integrado — todo en un framework que funciona tanto en Zsh como en Bash.

## Funcionalidades

- **7 temas de colores** — Hello Kitty, Barbie, Neon, Vaporwave, Frutiger Aero, Bratz, Ciano
- **98 bordes decorativos** — text art estilo MSN + estilos Unicode/emoji
- **Combina libremente** — cualquier tema funciona con cualquier borde, cambia en tiempo real
- **Gestor de alias** — agrega, lista, edita y elimina alias con `bbl alias`
- **Atajos de teclado** — cicla entre temas, bordes y mas con combinaciones Ctrl+X
- **Manual integrado** — `bbl help` con secciones detalladas para cada funcionalidad
- **Funciona en macOS y Linux** — Zsh y Bash, detecta tu SO automaticamente

## Instalación

```bash
git clone https://github.com/tuusuario/barbarella.git
cd barbarella
bash install.sh
```

El instalador interactivo te guiara por:

1. **Selección de shell** — Zsh, Bash, o ambos
2. **Tema** — elige tu paleta de colores favorita
3. **Borde** — elige un estilo decorativo para el prompt
4. **Configuración** — agrega automaticamente el `source` en tu `.zshrc` / `.bashrc`

Despues de la instalación, reinicia tu terminal o ejecuta:

```bash
source ~/.barbarella/barbarella.zsh   # Zsh
source ~/.barbarella/barbarella.bash  # Bash
```

## Temas

Siete paletas de colores, intercambiables en cualquier momento:

| Tema | Vibra |
|------|-------|
| `hello-kitty` | Rosa suave, blanco, rosado |
| `barbie` | Pink vibrante, magenta, dorado |
| `neon` | Azul electrico, verde, morado |
| `vaporwave` | Morado pastel, rosa, cian |
| `frutiger-aero` | Verde naturaleza, azul cielo, fresco |
| `bratz` | Magenta bold, bronce, glam |
| `ciano` | Cian, teal, aqua |

```bash
bbl theme vaporwave       # cambiar tema
bbl theme list            # listar todos los temas
bbl theme preview         # vista previa
```

## Bordes

98 bordes decorativos en 3 colecciones, independientes de los temas de colores:

**MSN / Text Art (35)** — decoraciones de texto estilo MSN Messenger de los 90:

```
©º°¨¨°º© user@host · ~/path · 10:42 ©º°¨¨°º©        (waves)
»»-(¯·.·´¯)-> user@host · ~/path <-(¯·.·´¯)-««      (elegant)
,.-~*´¨¯¨·~-.¸-( user@host · ~/path )-,.-~*´¨¯¨·~-  (dream)
```

**Unicode / Emoji (39)** — simbolos decorativos modernos:

```
꧁༺ user@host · ~/path · 10:42 ༻꧂                   (gothic)
(◍•ᴗ•◍) ミ💖 user@host · ~/path 💖彡                 (boop)
🍰 ⋆ 🍭 🎀 user@host · ~/path 🎀 🍭 ⋆ 🍰           (candy)
```

**MSN / Text Art II (24)** — mas text art clasico:

```
▁ ▂ ▄ ▅ ▆ ▇ █ user@host · ~/path █ ▇ ▆ ▅ ▄ ▂ ▁    (gradient)
▌│█║▌║▌║ user@host · ~/path ║▌║▌║█│▌                 (barcode)
-漫~*'¨¯¨'*·舞~ user@host · ~/path ~舞*'¨¯¨'*·~漫-  (sakura)
```

```bash
bbl border gothic         # aplicar un borde
bbl border list           # listar los 98 bordes
bbl border preview        # vista previa de todos
bbl border none           # volver al modo clasico (corchetes)
bbl border next           # siguiente borde
```

### Modos del prompt

- **Clasico** (sin borde): `┌─[icon]─[user@host]─[~/path]─[git:(branch)]─[OS IP]─[HH:MM]` + `└─❯`
- **Decorado** (cualquier borde activo): `DECO_LEFT user@host · ~/path · git · OS IP · HH:MM DECO_RIGHT` + `❯`

## Comandos

| Comando | Descripción |
|---------|-------------|
| `bbl theme <nombre>` | Cambiar tema de colores |
| `bbl theme list` | Listar temas disponibles |
| `bbl theme preview` | Vista previa de todos los temas |
| `bbl border <nombre>` | Aplicar un borde decorativo |
| `bbl border list` | Listar los 98 bordes |
| `bbl border preview` | Vista previa de todos los bordes |
| `bbl border none` | Prompt clasico con corchetes |
| `bbl border next` | Siguiente borde |
| `bbl alias list` | Mostrar todos los alias |
| `bbl alias add <nombre> <cmd>` | Crear un alias rapido |
| `bbl alias remove <nombre>` | Eliminar un alias |
| `bbl alias edit` | Abrir archivo de alias en el editor |
| `bbl help [tema]` | Manual integrado |
| `bbl shortcuts` | Mostrar atajos de teclado |
| `bbl ip` | Actualizar IP en el prompt |
| `bbl version` | Mostrar version |

## Atajos de Teclado

| Atajo | Acción |
|-------|--------|
| `Ctrl+X t` | Siguiente tema |
| `Ctrl+X b` | Siguiente borde |
| `Ctrl+X a` | Listar alias |
| `Ctrl+X h` | Mostrar atajos |
| `Ctrl+X i` | Actualizar IP |

## Estructura del Proyecto

```
~/.barbarella/
├── barbarella.zsh          # Entry point de Zsh
├── barbarella.bash         # Entry point de Bash
├── install.sh              # Instalador interactivo
├── core/
│   ├── detect.sh           # Detección de SO/shell
│   ├── colors.sh           # Funciones de color
│   ├── themes.sh           # Cargador de temas
│   ├── borders.sh          # 98 definiciones de bordes
│   ├── aliases.sh          # Gestión de alias
│   ├── help.sh             # Manual integrado
│   ├── prompt.zsh          # Constructor de prompt (Zsh)
│   ├── prompt.bash         # Constructor de prompt (Bash)
│   ├── shortcuts.zsh       # Widgets ZLE (Zsh)
│   └── shortcuts.bash      # Bindings readline (Bash)
├── themes/
│   ├── hello-kitty.sh
│   ├── barbie.sh
│   ├── neon.sh
│   ├── vaporwave.sh
│   ├── frutiger-aero.sh
│   ├── bratz.sh
│   └── ciano.sh
└── user/
    └── aliases.sh.template
```

La configuración del usuario se guarda en `~/.config/barbarella/config.sh`.

## Desinstalar

```bash
rm -rf ~/.barbarella ~/.config/barbarella
```

Luego elimina la linea `source ~/.barbarella/barbarella.*` de tu `.zshrc` / `.bashrc`.

## Licencia

MIT
