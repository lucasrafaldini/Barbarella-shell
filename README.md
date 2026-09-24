<p align="center">
  <img src="https://img.shields.io/badge/shell-zsh%20%2B%20bash-ff69b4" alt="Shell">
  <img src="https://img.shields.io/badge/themes-7-blueviolet" alt="Themes">
  <img src="https://img.shields.io/badge/borders-98-hotpink" alt="Borders">
  <a href="https://hacktoberfest.com/"><img src="https://img.shields.io/badge/Hacktoberfest-2026-blueviolet?logo=hacktoberfest" alt="Hacktoberfest"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-green" alt="License"></a>
</p>

<h1 align="center">Barbarella</h1>
<p align="center"><b>A feminine terminal framework for Zsh and Bash</b></p>
<p align="center">
  <a href="#installation">Installation</a> &bull;
  <a href="#themes">Themes</a> &bull;
  <a href="#borders">Borders</a> &bull;
  <a href="#commands">Commands</a> &bull;
  <a href="#keyboard-shortcuts">Shortcuts</a>
</p>
<p align="center">
  <b>English</b> &bull;
  <a href="README.pt-BR.md">Portugues (BR)</a> &bull;
  <a href="README.es.md">Espanol</a>
</p>

---

Barbarella turns your terminal into something beautiful. Inspired by Oh My Zsh and iTerm, it brings feminine color themes, decorative prompt borders, alias management, keyboard shortcuts, and a built-in manual — all in one framework that works on both Zsh and Bash.

## Features

- **7 color themes** — Hello Kitty, Barbie, Neon, Vaporwave, Frutiger Aero, Bratz, Ciano
- **98 decorative borders** — MSN-era text art + Unicode/emoji styles
- **Mix and match** — any theme works with any border, switch at runtime
- **Alias manager** — add, list, edit, and remove aliases with `bbl alias`
- **Keyboard shortcuts** — cycle themes, borders, and more with Ctrl+X combos
- **Built-in manual** — `bbl help` with detailed sections for every feature
- **Works on macOS and Linux** — Zsh and Bash, auto-detects your OS

## Installation

```bash
git clone https://github.com/lucasrafaldini/Barbarella-shell.git
cd Barbarella-shell
bash install.sh
```

The interactive installer will guide you through:

1. **Shell selection** — Zsh, Bash, or both
2. **Theme** — pick your favorite color palette
3. **Border** — choose a decorative prompt style
4. **Patching** — automatically adds `source` to your `.zshrc` / `.bashrc`

After installation, restart your terminal or run:

```bash
source ~/.barbarella/barbarella.zsh   # Zsh
source ~/.barbarella/barbarella.bash  # Bash
```

## Themes

Seven color palettes, switchable at any time:

| Theme | Icon | Vibe |
|-------|------|------|
| `hello-kitty` | `..` | Soft pink, white, rose |
| `barbie` | `..` | Hot pink, magenta, gold |
| `neon` | `..` | Electric blue, green, purple |
| `vaporwave` | `..` | Pastel purple, pink, cyan |
| `frutiger-aero` | `..` | Nature green, sky blue, fresh |
| `bratz` | `..` | Bold magenta, bronze, glam |
| `ciano` | `..` | Cyan, teal, aqua |

```bash
bbl theme vaporwave       # switch theme
bbl theme list            # list all themes
bbl theme preview         # visual preview
```

## Borders

98 decorative prompt borders in 3 collections, independent from color themes:

**MSN / Text Art (35)** — 90s Messenger-style text decorations:

```
©º°¨¨°º© user@host · ~/path · 10:42 ©º°¨¨°º©        (waves)
»»-(¯·.·´¯)-> user@host · ~/path <-(¯·.·´¯)-««      (elegant)
,.-~*´¨¯¨·~-.¸-( user@host · ~/path )-,.-~*´¨¯¨·~-  (dream)
```

**Unicode / Emoji (39)** — modern decorative symbols:

```
꧁༺ user@host · ~/path · 10:42 ༻꧂                   (gothic)
(◍•ᴗ•◍) ミ💖 user@host · ~/path 💖彡                 (boop)
🍰 ⋆ 🍭 🎀 user@host · ~/path 🎀 🍭 ⋆ 🍰           (candy)
```

**MSN / Text Art II (24)** — more classic text art:

```
▁ ▂ ▄ ▅ ▆ ▇ █ user@host · ~/path █ ▇ ▆ ▅ ▄ ▂ ▁    (gradient)
▌│█║▌║▌║ user@host · ~/path ║▌║▌║█│▌                 (barcode)
-漫~*'¨¯¨'*·舞~ user@host · ~/path ~舞*'¨¯¨'*·~漫-  (sakura)
```

```bash
bbl border gothic         # apply a border
bbl border list           # list all 98 borders
bbl border preview        # visual preview of all
bbl border none           # back to classic bracket mode
bbl border next           # cycle to next border
```

### Prompt modes

- **Classic** (no border): `┌─[icon]─[user@host]─[~/path]─[git:(branch)]─[OS IP]─[HH:MM]` + `└─❯`
- **Decorated** (any border active): `DECO_LEFT user@host · ~/path · git · OS IP · HH:MM DECO_RIGHT` + `❯`

## Commands

| Command | Description |
|---------|-------------|
| `bbl theme <name>` | Switch color theme |
| `bbl theme list` | List available themes |
| `bbl theme preview` | Visual preview of all themes |
| `bbl border <name>` | Apply a decorative border |
| `bbl border list` | List all 98 borders |
| `bbl border preview` | Visual preview of all borders |
| `bbl border none` | Classic bracket-style prompt |
| `bbl border next` | Cycle to next border |
| `bbl alias list` | Show all aliases |
| `bbl alias add <name> <cmd>` | Create a quick alias |
| `bbl alias remove <name>` | Remove an alias |
| `bbl alias edit` | Open alias file in editor |
| `bbl help [topic]` | Built-in manual |
| `bbl shortcuts` | Show keyboard shortcuts |
| `bbl ip` | Refresh IP in prompt |
| `bbl version` | Show version info |

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+X t` | Next theme |
| `Ctrl+X b` | Next border |
| `Ctrl+X a` | List aliases |
| `Ctrl+X h` | Show shortcuts |
| `Ctrl+X i` | Refresh IP |

## Project Structure

```
~/.barbarella/
├── barbarella.zsh          # Zsh entry point
├── barbarella.bash         # Bash entry point
├── install.sh              # Interactive installer
├── core/
│   ├── detect.sh           # OS/shell detection
│   ├── colors.sh           # Color utility functions
│   ├── themes.sh           # Theme loader
│   ├── borders.sh          # 98 border definitions
│   ├── aliases.sh          # Alias management
│   ├── help.sh             # Built-in manual
│   ├── prompt.zsh          # Zsh prompt builder
│   ├── prompt.bash         # Bash prompt builder
│   ├── shortcuts.zsh       # Zsh ZLE widgets
│   └── shortcuts.bash      # Bash readline bindings
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

## Uninstall

```bash
rm -rf ~/.barbarella ~/.config/barbarella
```

Then remove the `source ~/.barbarella/barbarella.*` line from your `.zshrc` / `.bashrc`.

## Contributing 🎃

Barbarella participates in **[Hacktoberfest](https://hacktoberfest.com/)** and welcomes contributions of all kinds!
- Have an idea for a cute retro theme or MSN border?
- Want to optimize Zsh/Bash performance or add new shortcuts?

Read our **[Contributing Guidelines (CONTRIBUTING.md)](./CONTRIBUTING.md)** and **[Code of Conduct](./CODE_OF_CONDUCT.md)** to get started!

## Contributors 💖

Meet the people behind **Barbarella**:

| Avatar | Name | Role |
| :---: | :---: | :---: |
| <img src="https://github.com/lucasrafaldini.png" width="60px" style="border-radius:50%"/> | **[Lucas Rafaldini](https://github.com/lucasrafaldini)** | Creator & Core Maintainer |
| <img src="https://github.com/BarbaraRossi.png" width="60px" style="border-radius:50%"/> | **[Barbara Rossi](https://github.com/BarbaraRossi)** | Core Contributor & Muse |

See the full list of contributors in [CONTRIBUTORS.md](./CONTRIBUTORS.md).

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
