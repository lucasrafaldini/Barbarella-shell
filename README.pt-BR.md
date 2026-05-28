<p align="center">
  <img src="https://img.shields.io/badge/shell-zsh%20%2B%20bash-ff69b4" alt="Shell">
  <img src="https://img.shields.io/badge/temas-7-blueviolet" alt="Temas">
  <img src="https://img.shields.io/badge/bordas-98-hotpink" alt="Bordas">
  <img src="https://img.shields.io/badge/licença-MIT-green" alt="Licença">
</p>

<h1 align="center">Barbarella</h1>
<p align="center"><b>Um framework de terminal feminino para Zsh e Bash</b></p>
<p align="center">
  <a href="#instalação">Instalação</a> &bull;
  <a href="#temas">Temas</a> &bull;
  <a href="#bordas">Bordas</a> &bull;
  <a href="#comandos">Comandos</a> &bull;
  <a href="#atalhos-de-teclado">Atalhos</a>
</p>
<p align="center">
  <a href="README.md">English</a> &bull;
  <b>Portugues (BR)</b> &bull;
  <a href="README.es.md">Espanol</a>
</p>

---

Barbarella transforma seu terminal em algo lindo. Inspirado no Oh My Zsh e iTerm, traz temas de cores femininos, bordas decorativas no prompt, gerenciamento de aliases, atalhos de teclado e um manual embutido — tudo em um framework que funciona tanto no Zsh quanto no Bash.

## Funcionalidades

- **7 temas de cores** — Hello Kitty, Barbie, Neon, Vaporwave, Frutiger Aero, Bratz, Ciano
- **98 bordas decorativas** — text art estilo MSN + estilos Unicode/emoji
- **Combine livremente** — qualquer tema funciona com qualquer borda, troque em tempo real
- **Gerenciador de aliases** — adicione, liste, edite e remova aliases com `bbl alias`
- **Atalhos de teclado** — cicle entre temas, bordas e mais com combos Ctrl+X
- **Manual embutido** — `bbl help` com seções detalhadas para cada funcionalidade
- **Funciona no macOS e Linux** — Zsh e Bash, detecta seu OS automaticamente

## Instalação

```bash
git clone https://github.com/seuusuario/barbarella.git
cd barbarella
bash install.sh
```

O instalador interativo vai guiar você por:

1. **Escolha do shell** — Zsh, Bash, ou ambos
2. **Tema** — escolha sua paleta de cores favorita
3. **Borda** — escolha um estilo decorativo para o prompt
4. **Configuração** — adiciona automaticamente o `source` no seu `.zshrc` / `.bashrc`

Após a instalação, reinicie o terminal ou execute:

```bash
source ~/.barbarella/barbarella.zsh   # Zsh
source ~/.barbarella/barbarella.bash  # Bash
```

## Temas

Sete paletas de cores, trocáveis a qualquer momento:

| Tema | Vibe |
|------|------|
| `hello-kitty` | Rosa suave, branco, rosé |
| `barbie` | Pink vibrante, magenta, dourado |
| `neon` | Azul elétrico, verde, roxo |
| `vaporwave` | Roxo pastel, rosa, ciano |
| `frutiger-aero` | Verde natureza, azul céu, fresco |
| `bratz` | Magenta bold, bronze, glam |
| `ciano` | Ciano, teal, aqua |

```bash
bbl theme vaporwave       # trocar tema
bbl theme list            # listar todos os temas
bbl theme preview         # pré-visualizar
```

## Bordas

98 bordas decorativas em 3 coleções, independentes dos temas de cores:

**MSN / Text Art (35)** — decorações de texto estilo MSN Messenger dos anos 90:

```
©º°¨¨°º© user@host · ~/path · 10:42 ©º°¨¨°º©        (waves)
»»-(¯·.·´¯)-> user@host · ~/path <-(¯·.·´¯)-««      (elegant)
,.-~*´¨¯¨·~-.¸-( user@host · ~/path )-,.-~*´¨¯¨·~-  (dream)
```

**Unicode / Emoji (39)** — símbolos decorativos modernos:

```
꧁༺ user@host · ~/path · 10:42 ༻꧂                   (gothic)
(◍•ᴗ•◍) ミ💖 user@host · ~/path 💖彡                 (boop)
🍰 ⋆ 🍭 🎀 user@host · ~/path 🎀 🍭 ⋆ 🍰           (candy)
```

**MSN / Text Art II (24)** — mais text art clássica:

```
▁ ▂ ▄ ▅ ▆ ▇ █ user@host · ~/path █ ▇ ▆ ▅ ▄ ▂ ▁    (gradient)
▌│█║▌║▌║ user@host · ~/path ║▌║▌║█│▌                 (barcode)
-漫~*'¨¯¨'*·舞~ user@host · ~/path ~舞*'¨¯¨'*·~漫-  (sakura)
```

```bash
bbl border gothic         # aplicar uma borda
bbl border list           # listar todas as 98 bordas
bbl border preview        # pré-visualizar todas
bbl border none           # voltar ao modo clássico (colchetes)
bbl border next           # próxima borda
```

### Modos do prompt

- **Clássico** (sem borda): `┌─[icon]─[user@host]─[~/path]─[git:(branch)]─[OS IP]─[HH:MM]` + `└─❯`
- **Decorado** (qualquer borda ativa): `DECO_LEFT user@host · ~/path · git · OS IP · HH:MM DECO_RIGHT` + `❯`

## Comandos

| Comando | Descrição |
|---------|-----------|
| `bbl theme <nome>` | Trocar tema de cores |
| `bbl theme list` | Listar temas disponíveis |
| `bbl theme preview` | Pré-visualizar todos os temas |
| `bbl border <nome>` | Aplicar uma borda decorativa |
| `bbl border list` | Listar todas as 98 bordas |
| `bbl border preview` | Pré-visualizar todas as bordas |
| `bbl border none` | Prompt clássico com colchetes |
| `bbl border next` | Próxima borda |
| `bbl alias list` | Mostrar todos os aliases |
| `bbl alias add <nome> <cmd>` | Criar um alias rápido |
| `bbl alias remove <nome>` | Remover um alias |
| `bbl alias edit` | Abrir arquivo de aliases no editor |
| `bbl help [tópico]` | Manual embutido |
| `bbl shortcuts` | Mostrar atalhos de teclado |
| `bbl ip` | Atualizar IP no prompt |
| `bbl version` | Mostrar versão |

## Atalhos de Teclado

| Atalho | Ação |
|--------|------|
| `Ctrl+X t` | Próximo tema |
| `Ctrl+X b` | Próxima borda |
| `Ctrl+X a` | Listar aliases |
| `Ctrl+X h` | Mostrar atalhos |
| `Ctrl+X i` | Atualizar IP |

## Estrutura do Projeto

```
~/.barbarella/
├── barbarella.zsh          # Entry point do Zsh
├── barbarella.bash         # Entry point do Bash
├── install.sh              # Instalador interativo
├── core/
│   ├── detect.sh           # Detecção de OS/shell
│   ├── colors.sh           # Funções de cor
│   ├── themes.sh           # Carregador de temas
│   ├── borders.sh          # 98 definições de bordas
│   ├── aliases.sh          # Gerenciamento de aliases
│   ├── help.sh             # Manual embutido
│   ├── prompt.zsh          # Construtor de prompt (Zsh)
│   ├── prompt.bash         # Construtor de prompt (Bash)
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

As configurações do usuário ficam em `~/.config/barbarella/config.sh`.

## Desinstalar

```bash
rm -rf ~/.barbarella ~/.config/barbarella
```

Depois remova a linha `source ~/.barbarella/barbarella.*` do seu `.zshrc` / `.bashrc`.

## Licença

MIT
