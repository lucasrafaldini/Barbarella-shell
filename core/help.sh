#!/usr/bin/env sh
# Help and manual system

_bbl_cmd_help() {
  case "${1:-overview}" in
    aliases|alias)    _bbl_help_aliases ;;
    themes|theme)     _bbl_help_themes ;;
    borders|border)   _bbl_help_borders ;;
    shortcuts|keys)   _bbl_help_shortcuts ;;
    prompt)           _bbl_help_prompt ;;
    overview|"")      _bbl_help_overview ;;
    *)
      printf 'Tópicos disponíveis: overview, aliases, themes, borders, shortcuts, prompt\n'
      ;;
  esac
}

_bbl_cmd_shortcuts() {
  _bbl_shortcuts_print
}

_bbl_shortcuts_print() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  ╭──────────────────────────────────────────╮"
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  │        Atalhos do Barbarella  "
  bbl_paint "${BBL_C_PROMPT_ICON:-${BBL_C_SECONDARY}}" "${BBL_PROMPT_ICON:-✨}   "
  bbl_paint_bold "${BBL_C_PRIMARY}" "         │"
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  ╰──────────────────────────────────────────╯"
  printf '\n\n'

  local shortcuts
  if [ "$BBL_SHELL" = "zsh" ]; then
    shortcuts="${BBL_SHORTCUTS_ZSH:-}"
  else
    shortcuts="${BBL_SHORTCUTS_BASH:-}"
  fi

  printf '%s\n' "$shortcuts" | while IFS= read -r line; do
    [ -z "$line" ] && continue
    key="$(echo "$line" | awk '{print $1, $2, $3}')"
    desc="$(echo "$line" | cut -d' ' -f4-)"
    printf '  %s   %s\n' \
      "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$key")" \
      "$(bbl_paint "${BBL_C_MUTED}" "$desc")"
  done

  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Comandos bbl:"
  printf '\n\n'
  printf '  %s   %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl theme <nome>")"   "$(bbl_paint "${BBL_C_MUTED}" "Trocar tema de cores")"
  printf '  %s        %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl theme list")"       "$(bbl_paint "${BBL_C_MUTED}" "Listar temas disponíveis")"
  printf '  %s      %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl theme preview")"    "$(bbl_paint "${BBL_C_MUTED}" "Pré-visualizar todos os temas")"
  printf '  %s  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border <nome>")"  "$(bbl_paint "${BBL_C_MUTED}" "Trocar borda decorativa")"
  printf '  %s       %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border list")"       "$(bbl_paint "${BBL_C_MUTED}" "Listar bordas disponíveis")"
  printf '  %s    %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border preview")"    "$(bbl_paint "${BBL_C_MUTED}" "Pré-visualizar todas as bordas")"
  printf '  %s       %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl alias list")"       "$(bbl_paint "${BBL_C_MUTED}" "Listar seus aliases")"
  printf '  %s  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl alias add <n> <cmd>")" "$(bbl_paint "${BBL_C_MUTED}" "Criar alias rápido")"
  printf '  %s      %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl alias edit")"       "$(bbl_paint "${BBL_C_MUTED}" "Editar arquivo de aliases")"
  printf '  %s    %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl help <tópico>")"     "$(bbl_paint "${BBL_C_MUTED}" "Manual completo")"
  printf '  %s            %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl ip")"                "$(bbl_paint "${BBL_C_MUTED}" "Atualizar IP no prompt")"
  printf '\n'
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help (overview)
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_overview() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Barbarella ${BBL_PROMPT_ICON}  —  Manual Rápido"
  printf '\n\n'

  cat <<'HELP'
  Barbarella é um framework de terminal feminino para Zsh e Bash.
  Ele personaliza seu prompt com cores, ícones, bordas e atalhos.

  Conceitos principais:
    - Temas:  definem as CORES do prompt (7 temas disponíveis)
    - Bordas: definem os GRAFISMOS ao redor do prompt (98 bordas)
    - Aliases: atalhos de texto para comandos longos
    - Atalhos: teclas de atalho (Ctrl+X t/b/a/h/i)

  Temas e bordas são independentes — você pode combinar qualquer
  tema com qualquer borda! Exemplo:
    bbl theme vaporwave    (cores roxo + rosa + ciano)
    bbl border gothic      (grafismo ꧁༺ ... ༻꧂)

HELP
  bbl_paint "${BBL_C_ACCENT}" "  Use \`bbl help <tópico>\` para ler mais:"
  printf '\n\n'
  printf '  %s   %s\n' "$(bbl_paint_bold "${BBL_C_ACCENT}" "themes")"    "$(bbl_paint "${BBL_C_MUTED}" "7 temas de cores e como trocar")"
  printf '  %s  %s\n' "$(bbl_paint_bold "${BBL_C_ACCENT}" "borders")"  "$(bbl_paint "${BBL_C_MUTED}" "98 bordas decorativas (MSN + Unicode)")"
  printf '  %s  %s\n' "$(bbl_paint_bold "${BBL_C_ACCENT}" "aliases")"   "$(bbl_paint "${BBL_C_MUTED}" "O que são aliases e como gerenciá-los")"
  printf '  %s   %s\n' "$(bbl_paint_bold "${BBL_C_ACCENT}" "prompt")"    "$(bbl_paint "${BBL_C_MUTED}" "O que cada parte do prompt significa")"
  printf '  %s  %s\n' "$(bbl_paint_bold "${BBL_C_ACCENT}" "shortcuts")" "$(bbl_paint "${BBL_C_MUTED}" "Todos os atalhos de teclado e comandos")"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Estado atual:"
  printf '\n'
  printf '    Tema:  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "${BBL_THEME_LABEL:-?}")"
  printf '    Borda: %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "${BBL_BORDER_LABEL:-Sem borda}")"
  printf '\n'
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help aliases
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_aliases() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Manual: Aliases"
  printf '\n\n'
  bbl_paint "${BBL_C_ACCENT}" "  O que é um alias?"
  printf '\n'
  cat <<'HELP'

  Um alias é um atalho de texto para um comando mais longo.
  Em vez de digitar "git status" toda hora, você pode criar:

    alias gs='git status'

  E então usar apenas "gs".

HELP
  bbl_paint "${BBL_C_ACCENT}" "  Gerenciando aliases com Barbarella:"
  printf '\n\n'
  printf '  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Criar um alias:")"
  printf '    bbl alias add gs "git status"\n'
  printf '    bbl alias add deploy "ssh meuservidor ./deploy.sh"\n'
  printf '\n'
  printf '  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Listar todos os aliases:")"
  printf '    bbl alias list\n'
  printf '\n'
  printf '  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Remover um alias:")"
  printf '    bbl alias remove gs\n'
  printf '\n'
  printf '  %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Editar o arquivo de aliases diretamente:")"
  printf '    bbl alias edit\n'
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Aliases ficam em: ~/.config/barbarella/aliases.sh"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Eles são carregados automaticamente a cada novo terminal."
  printf '\n\n'
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help themes
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_themes() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Manual: Temas de Cores"
  printf '\n\n'
  cat <<'HELP'
  Temas definem as CORES do seu prompt — primária, secundária,
  de destaque, do git, dos ícones, etc. São 7 temas femininos:

    hello-kitty  Barbie  Neon  Vaporwave
    Frutiger Aero  Bratz  Ciano

  Temas e bordas são independentes: qualquer tema funciona com
  qualquer borda! Para grafismos decorativos, veja: bbl help borders

HELP
  bbl_paint "${BBL_C_ACCENT}" "  Trocar de tema:"
  printf '\n\n'
  printf '    bbl theme barbie\n'
  printf '    bbl theme vaporwave\n'
  printf '    bbl theme hello-kitty\n'
  printf '\n'
  bbl_paint "${BBL_C_ACCENT}" "  Ver todos os temas:"
  printf '\n\n'
  printf '    bbl theme list       (lista nomes e comandos)\n'
  printf '    bbl theme preview    (mostra preview colorido de cada tema)\n'
  printf '\n'
  bbl_paint "${BBL_C_ACCENT}" "  Atalho de teclado:"
  printf '\n\n'
  printf '    Ctrl+X  t    (cicla pelo próximo tema automaticamente)\n'
  printf '\n'
  bbl_paint "${BBL_C_ACCENT}" "  Tema atual:"
  printf '\n\n'
  printf '    %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "${BBL_THEME_LABEL:-?}")"
  printf '\n'
  _bbl_theme_list
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help borders
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_borders() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Manual: Bordas Decorativas"
  printf '\n\n'

  cat <<'HELP'
  Bordas são grafismos decorativos que envolvem a linha do prompt.
  Elas são INDEPENDENTES do tema de cores — qualquer borda funciona
  com qualquer tema! Total: 98 bordas em 3 coleções.

HELP

  # ── Explicação dos dois modos ──────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Modos do prompt:"
  printf '\n\n'
  printf '  %s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Clássico")" \
    "$(bbl_paint "${BBL_C_MUTED}" "(bbl border none)")"
  printf '    Usa colchetes ao redor de cada segmento:\n'
  printf '    %s\n' "$(bbl_paint "${BBL_C_PRIMARY}" "┌─[🎀 Barbarella]─[user@host]─[~/path]─[10:42]")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_PRIMARY}" "└─❯")"
  printf '\n'
  printf '  %s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "Decorado")" \
    "$(bbl_paint "${BBL_C_MUTED}" "(qualquer borda ativa)")"
  printf '    Grafismo à esquerda e direita, segmentos separados por · :\n'
  printf '    %s\n' "$(bbl_paint "${BBL_C_PRIMARY}" "꧁༺ user@host · ~/path · 🍎 192.168.0.1 · 10:42 ༻꧂")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_PRIMARY}" "❯")"
  printf '\n'

  # ── Coleção 1: MSN Text Art ────────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Coleção 1 — MSN / Text Art (35 bordas)"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Grafismos de texto estilo anos 90 / MSN Messenger."
  printf '\n\n'

  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "waves")" \
    "$(bbl_paint "${BBL_C_MUTED}" "©º°¨¨°º© info ©º°¨¨°º©")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "elegant")" \
    "$(bbl_paint "${BBL_C_MUTED}" "»»-(¯·.·´¯)-> info <-(¯·.·´¯)-««")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "dream")" \
    "$(bbl_paint "${BBL_C_MUTED}" ",.-~*´¨¯¨·~-.¸-( info )-,.-~*´¨¯¨·~-.¸")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "kawaii")" \
    "$(bbl_paint "${BBL_C_MUTED}" "(^^(-_-)^^) info (^^(-_-)^^)")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "petals")" \
    "$(bbl_paint "${BBL_C_MUTED}" "(¯·.(¯·.(¯·. info .·´¯).·´¯).·´¯)")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "moonlight")" \
    "$(bbl_paint "${BBL_C_MUTED}" ".°.. °.. °.. info ..° ..° ..°.")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "circles")" \
    "$(bbl_paint "${BBL_C_MUTED}" ".o0×X×0o. info .o0×X×0o.")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "comet")" \
    "$(bbl_paint "${BBL_C_MUTED}" ",._.,-*^~*-,._.,-~> info <~-,._.,-*~^~*-,._.,")"

  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "    + cascade, starlight, flow, mystery, tech, royal, blossom,"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "      glitter, aurora, ribbon, lace, cupid, rose, moonbeam,"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "      frame, chain, crystal, flirty, ornate, sweet, classic,"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "      matrix, gamer, cyber, sleepy, retro, whisper"
  printf '\n\n'

  # ── Coleção 2: Unicode/Emoji ───────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Coleção 2 — Unicode / Emoji (39 bordas)"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Grafismos com emojis, kaomojis e símbolos Unicode."
  printf '\n\n'

  bbl_paint "${BBL_C_MUTED}" "    Estrelas & Brilho:"
  printf '\n'
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "shimmer")" "$(bbl_paint "${BBL_C_MUTED}" "ミ★ info ★彡")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "snowflake")" "$(bbl_paint "${BBL_C_MUTED}" "*ੈ✩‧₊˚ info ˚₊‧✩*ੈ")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "sparkly")" "$(bbl_paint "${BBL_C_MUTED}" "｡+ﾟ☆ﾟ+｡★｡+ﾟ info ☆ﾟ+｡★｡+ﾟ☆ﾟ+")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_MUTED}" "+ nova, temple, equalizer, celestial, stardust, starwave, starjewel, starornate")"
  printf '\n'

  bbl_paint "${BBL_C_MUTED}" "    Cute & Kawaii:"
  printf '\n'
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "boop")" "$(bbl_paint "${BBL_C_MUTED}" "(◍•ᴗ•◍) ミ💖 info 💖彡")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "huggy")" "$(bbl_paint "${BBL_C_MUTED}" "(づ｡◕‿‿◕｡)づ info ٩(˘◡˘)۶")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "kittycat")" "$(bbl_paint "${BBL_C_MUTED}" "≽^•⩊•^≼ info ◝(ᵔᵕᵔ)◜")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_MUTED}" "+ smiley, softy, happyface, wink")"
  printf '\n'

  bbl_paint "${BBL_C_MUTED}" "    Amor & Fofo:"
  printf '\n'
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bow")" "$(bbl_paint "${BBL_C_MUTED}" "•´¯·. 🎀 info 🎀 .·¯´•")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "candy")" "$(bbl_paint "${BBL_C_MUTED}" "🍰 ⋆ 🍭 🎀 info 🎀 🍭 ⋆ 🍰")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "hearts")" "$(bbl_paint "${BBL_C_MUTED}" "◦•●❤♡ info ♡❤●•◦")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_MUTED}" "+ valentine, loveletter, heartbow, heartthrob, heartwave, lovesong, gem, cherry")"
  printf '\n'

  bbl_paint "${BBL_C_MUTED}" "    Gótico & Místico:"
  printf '\n'
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "gothic")" "$(bbl_paint "${BBL_C_MUTED}" "꧁༺ info ༻꧂")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "crown")" "$(bbl_paint "${BBL_C_MUTED}" "°•꧁,👑_ info _👑꧂•°")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_MUTED}" "+ mystic, darkrose")"
  printf '\n'

  bbl_paint "${BBL_C_MUTED}" "    Party & Mais:"
  printf '\n'
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "party")" "$(bbl_paint "${BBL_C_MUTED}" "ﾟ･:,｡★＼(^-^)♪ info ♪(^-^)/★,｡･:ﾟ")"
  printf '    %-14s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "robot")" "$(bbl_paint "${BBL_C_MUTED}" "♥╣[-_-]╠♥ info ♥╣[-_-]╠♥")"
  printf '    %s\n' "$(bbl_paint "${BBL_C_MUTED}" "+ formal, vintage, floral, equalizer")"
  printf '\n'

  # ── Coleção 3: MSN Text Art II ─────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Coleção 3 — MSN / Text Art II (24 bordas)"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Mais grafismos de texto estilo anos 90 / MSN Messenger."
  printf '\n\n'

  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "golden")" \
    "$(bbl_paint "${BBL_C_MUTED}" "¸,ø¤º°°º¤ø,¸¸,ø¤º° info °º¤ø,¸¸,ø¤º°°º¤ø,¸")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "blade")" \
    "$(bbl_paint "${BBL_C_MUTED}" "]|I{•------» info «------•}I|[")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "gradient")" \
    "$(bbl_paint "${BBL_C_MUTED}" "▁ ▂ ▄ ▅ ▆ ▇ █ info █ ▇ ▆ ▅ ▄ ▂ ▁")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "sakura")" \
    "$(bbl_paint "${BBL_C_MUTED}" "-漫~*¨¯¨*·舞~ info ~舞*¨¯¨*·~漫-")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "barcode")" \
    "$(bbl_paint "${BBL_C_MUTED}" "▌│█║▌║▌║ info ║▌║▌║█│▌")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "goldstar")" \
    "$(bbl_paint "${BBL_C_MUTED}" ".•°¤*(¯★´¯)*¤° info °¤*(¯´★¯)*¤°•.")"
  printf '    %-14s %s\n' \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "dizzy")" \
    "$(bbl_paint "${BBL_C_MUTED}" "._|.<(+_+)>.|_. info ._|.<(+_+)>.|_.")"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "    + question, pulse, mist, simple, mirror, arrow, dot, leaf,"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "      bracket, chevron, breeze, bronze, scroll, dots, sultan,"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "      checker, zen"
  printf '\n\n'

  # ── Comandos ───────────────────────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Comandos:"
  printf '\n\n'
  printf '    %s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border <nome>")"   "$(bbl_paint "${BBL_C_MUTED}" "Aplicar uma borda")"
  printf '    %s   %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border list")"      "$(bbl_paint "${BBL_C_MUTED}" "Lista completa das 98 bordas")"
  printf '    %s %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border preview")"  "$(bbl_paint "${BBL_C_MUTED}" "Preview visual de todas as bordas")"
  printf '    %s   %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border none")"      "$(bbl_paint "${BBL_C_MUTED}" "Voltar ao modo clássico (colchetes)")"
  printf '    %s   %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "bbl border next")"      "$(bbl_paint "${BBL_C_MUTED}" "Próxima borda (ou Ctrl+X b)")"
  printf '\n'

  bbl_paint "${BBL_C_ACCENT}" "  Atalho de teclado:"
  printf '\n\n'
  printf '    Ctrl+X  b    cicla pela próxima borda automaticamente\n'
  printf '\n'

  bbl_paint "${BBL_C_ACCENT}" "  Combinar tema + borda:"
  printf '\n\n'
  printf '    bbl theme vaporwave    (muda as cores para roxo/rosa/ciano)\n'
  printf '    bbl border gothic      (muda o grafismo para ꧁༺ ... ༻꧂)\n'
  printf '    bbl border candy       (muda o grafismo para 🍰 ⋆ 🍭 ...)\n'
  printf '\n'

  bbl_paint "${BBL_C_ACCENT}" "  Borda atual:"
  printf '\n\n'
  printf '    %s\n' "$(bbl_paint_bold "${BBL_C_SECONDARY}" "${BBL_BORDER_LABEL:-Sem borda}")"
  printf '\n'
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help prompt
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_prompt() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Manual: Prompt"
  printf '\n\n'
  bbl_paint "${BBL_C_MUTED}" "  O prompt do Barbarella tem duas linhas e dois modos:"
  printf '\n\n'

  # ── Modo clássico ──────────────────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Modo Clássico (bbl border none)"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Usa colchetes ao redor de cada segmento de informação."
  printf '\n\n'

  printf '  %s\n' "$(bbl_paint "${BBL_C_MUTED}" "Linha 1:")"
  printf '    %s  %s\n' \
    "$(bbl_paint "${BBL_C_PRIMARY}" "${BBL_CORNER_TL:-┌}${BBL_SEP:-─}[${BBL_PROMPT_ICON:-🎀} Barbarella]")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ nome do app e tema atual")"
  printf '    %s     %s\n' \
    "$(bbl_paint "${BBL_C_SECONDARY}" "user@host")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ seu login e nome do computador")"
  printf '    %s      %s\n' \
    "$(bbl_paint "${BBL_C_ACCENT}" "~/caminho")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ pasta atual (~ = sua home)")"
  printf '    %s  %s\n' \
    "$(bbl_paint "${BBL_C_GIT:-${BBL_C_SECONDARY}}" "git:(branch✎)")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ branch git (✎ = mudanças não salvas)")"
  printf '    %s %s       %s\n' \
    "$(bbl_paint "${BBL_C_PRIMARY}" "${BBL_OS_ICON:-🍎}")" \
    "$(bbl_paint "${BBL_C_MUTED}" "IP")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ sistema operacional e IP local")"
  printf '    %s          %s\n' \
    "$(bbl_paint "${BBL_C_MUTED}" "HH:MM")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ horário atual")"
  printf '\n'
  printf '  %s\n' "$(bbl_paint "${BBL_C_MUTED}" "Linha 2:")"
  printf '    %s  %s\n' \
    "$(bbl_paint_bold "${BBL_C_PRIMARY}" "${BBL_PROMPT_CHAR:-❯}")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ aqui você digita seus comandos")"
  printf '\n'

  # ── Modo decorado ──────────────────────────────────────────────────────
  bbl_paint "${BBL_C_ACCENT}" "  Modo Decorado (qualquer borda ativa)"
  printf '\n'
  bbl_paint "${BBL_C_MUTED}" "  Grafismo à esquerda e direita, segmentos separados por · "
  printf '\n\n'

  printf '  %s\n' "$(bbl_paint "${BBL_C_MUTED}" "Linha 1:")"
  printf '    %s   %s\n' \
    "$(bbl_paint "${BBL_C_PRIMARY}" "BORDA_ESQ")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ grafismo decorativo da borda")"
  printf '    %s     %s\n' \
    "$(bbl_paint "${BBL_C_SECONDARY}" "user@host")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ seu login e nome do computador")"
  printf '    %s          %s\n' \
    "$(bbl_paint "${BBL_C_MUTED}" "·")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ separador entre segmentos")"
  printf '    %s      %s\n' \
    "$(bbl_paint "${BBL_C_ACCENT}" "~/caminho")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ pasta atual")"
  printf '    %s  %s\n' \
    "$(bbl_paint "${BBL_C_GIT:-${BBL_C_SECONDARY}}" "git:(branch✎)")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ branch git (se dentro de um repositório)")"
  printf '    %s %s       %s\n' \
    "$(bbl_paint "${BBL_C_PRIMARY}" "${BBL_OS_ICON:-🍎}")" \
    "$(bbl_paint "${BBL_C_MUTED}" "IP")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ sistema operacional e IP local")"
  printf '    %s          %s\n' \
    "$(bbl_paint "${BBL_C_MUTED}" "HH:MM")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ horário atual")"
  printf '    %s   %s\n' \
    "$(bbl_paint "${BBL_C_PRIMARY}" "BORDA_DIR")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ grafismo decorativo da borda")"
  printf '\n'
  printf '  %s\n' "$(bbl_paint "${BBL_C_MUTED}" "Linha 2:")"
  printf '    %s  %s\n' \
    "$(bbl_paint_bold "${BBL_C_PRIMARY}" "${BBL_PROMPT_CHAR:-❯}")" \
    "$(bbl_paint "${BBL_C_MUTED}" "→ aqui você digita seus comandos")"
  printf '\n'

  bbl_paint "${BBL_C_ACCENT}" "  Exemplo com borda \"gothic\" + tema \"vaporwave\":"
  printf '\n\n'
  printf '    ꧁༺ user@host · ~/projetos · git:(main) · 🍎 192.168.0.1 · 14:30 ༻꧂\n'
  printf '    ❯ _\n'
  printf '\n'

  bbl_paint "${BBL_C_ACCENT}" "  Alternar entre modos:"
  printf '\n\n'
  printf '    bbl border gothic    (ativa modo decorado com borda gothic)\n'
  printf '    bbl border none      (volta ao modo clássico com colchetes)\n'
  printf '    Ctrl+X  b            (cicla pela próxima borda)\n'
  printf '\n'
}

# ══════════════════════════════════════════════════════════════════════════════
#  bbl help shortcuts
# ══════════════════════════════════════════════════════════════════════════════

_bbl_help_shortcuts() {
  _bbl_shortcuts_print
}
