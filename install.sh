#!/usr/bin/env bash
# Barbarella Installer
# Uso: bash install.sh

set -euo pipefail

BBL_SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BBL_INSTALL_DIR="${HOME}/.barbarella"
BBL_CONFIG_DIR="${HOME}/.config/barbarella"

# ── Colors for the installer itself ───────────────────────────────────────────

_i_fg()    { printf '\033[38;5;%sm' "${1}"; }
_i_reset() { printf '\033[0m'; }
_i_bold()  { printf '\033[1m'; }
_i_paint() { printf '%s%s%s%s' "$(_i_bold)" "$(_i_fg "${1}")" "${2}" "$(_i_reset)"; }

C_PINK=213; C_HOT_PINK=198; C_LAVENDER=141; C_MUTED=182
C_MINT=85;  C_GOLD=220;     C_WHITE=255;    C_ERROR=197

_say()   { printf '  %s\n' "$*"; }
_ok()    { printf '  %s %s\n' "$(_i_paint "${C_MINT}" "✔")" "$*"; }
_info()  { printf '  %s %s\n' "$(_i_paint "${C_LAVENDER}" "→")" "$*"; }
_warn()  { printf '  %s %s\n' "$(_i_paint "${C_GOLD}" "⚠")" "$*" >&2; }
_err()   { printf '  %s %s\n' "$(_i_paint "${C_ERROR}" "✖")" "$*" >&2; exit 1; }

_ask() {
  local prompt="${1}" default="${2:-}"
  printf '  %s' "$(_i_paint "${C_PINK}" "❯") $(_i_paint "${C_WHITE}" "${prompt}")"
  [ -n "$default" ] && printf ' %s' "$(_i_fg "${C_MUTED}")[${default}]$(_i_reset)"
  printf ': '
  read -r answer
  echo "${answer:-$default}"
}

_ask_yn() {
  local prompt="${1}" default="${2:-s}"
  local ans
  ans="$(_ask "${prompt} [s/n]" "$default")"
  case "$ans" in [sS]*) return 0 ;; *) return 1 ;; esac
}

# ── Banner ─────────────────────────────────────────────────────────────────────

_banner() {
  printf '\n'
  _i_paint "${C_PINK}"     "  ╭──────────────────────────────────────────────────────╮"; echo
  _i_paint "${C_HOT_PINK}" "  │                                                      │"; echo
  _i_paint "${C_PINK}"     "  │   "; _i_paint "${C_WHITE}" "✨  B A R B A R E L L A  ✨"
  _i_paint "${C_PINK}"     "                     │"; echo
  _i_paint "${C_HOT_PINK}" "  │   "; _i_paint "${C_MUTED}" "Terminal feminino para Zsh e Bash"
  _i_paint "${C_HOT_PINK}" "          │"; echo
  _i_paint "${C_PINK}"     "  │                                                      │"; echo
  _i_paint "${C_PINK}"     "  ╰──────────────────────────────────────────────────────╯"; echo
  printf '\n'
}

# ── Theme preview ──────────────────────────────────────────────────────────────

_preview_themes() {
  printf '\n'
  _say "$(_i_paint "${C_WHITE}" "Temas disponíveis:")"
  printf '\n'

  local i=1
  local themes="hello-kitty barbie neon vaporwave frutiger-aero bratz ciano"
  for t in $themes; do
    local theme_file="${BBL_SRC_DIR}/themes/${t}.sh"
    [ -f "$theme_file" ] || continue

    # Source theme vars in a subshell to preview
    eval "$(grep -E '^BBL_(THEME_LABEL|PROMPT_ICON|C_PRIMARY|C_SECONDARY|C_MUTED)=' "$theme_file")"

    printf '  %s  %s  %-18s  %s\n' \
      "$(_i_paint "${C_MUTED}" "${i}.")" \
      "${BBL_PROMPT_ICON}" \
      "$(_i_paint "${BBL_C_PRIMARY}" "${BBL_THEME_LABEL:-$t}")" \
      "$(_i_fg "${BBL_C_SECONDARY}")████$(_i_fg "${BBL_C_PRIMARY}")████$(_i_fg "${BBL_C_MUTED}")████$(_i_reset)"
    i=$(( i + 1 ))
  done
  printf '\n'
}

# ── Shell detection ────────────────────────────────────────────────────────────

_detect_shells() {
  BBL_HAS_ZSH=0; BBL_HAS_BASH=0
  command -v zsh  &>/dev/null && BBL_HAS_ZSH=1
  command -v bash &>/dev/null && BBL_HAS_BASH=1
}

# ── Installation ───────────────────────────────────────────────────────────────

_copy_files() {
  _info "Copiando arquivos para ${BBL_INSTALL_DIR}..."

  if [ -d "${BBL_INSTALL_DIR}" ]; then
    _warn "Instalação anterior encontrada em ${BBL_INSTALL_DIR}"
    if ! _ask_yn "Sobrescrever?" "s"; then
      _info "Instalação cancelada."
      exit 0
    fi
  fi

  rm -rf "${BBL_INSTALL_DIR}"
  mkdir -p "${BBL_INSTALL_DIR}"
  mkdir -p "${BBL_CONFIG_DIR}"

  cp -r "${BBL_SRC_DIR}/core"   "${BBL_INSTALL_DIR}/"
  cp -r "${BBL_SRC_DIR}/themes" "${BBL_INSTALL_DIR}/"
  cp    "${BBL_SRC_DIR}/barbarella.zsh"  "${BBL_INSTALL_DIR}/"
  cp    "${BBL_SRC_DIR}/barbarella.bash" "${BBL_INSTALL_DIR}/"

  # Create user aliases file from template if not exists
  if [ ! -f "${BBL_CONFIG_DIR}/aliases.sh" ]; then
    cp "${BBL_SRC_DIR}/user/aliases.sh.template" "${BBL_CONFIG_DIR}/aliases.sh"
  fi

  _ok "Arquivos copiados."
}

_preview_borders() {
  printf '\n'
  _say "$(_i_paint "${C_WHITE}" "Bordas decorativas:")"
  _say "$(_i_paint "${C_MUTED}" "Bordas envolvem a linha do prompt com grafismos.")"
  _say "$(_i_paint "${C_MUTED}" "Pode mudar a qualquer momento com: bbl border <nome>")"
  printf '\n'

  _say "  $(_i_paint "${C_MUTED}" "── MSN / Text Art ──")"

  local i=0
  local borders_msn="none waves elegant dream kawaii moonlight petals circles"
  for b in $borders_msn; do
    i=$(( i + 1 ))
    case "$b" in
      none)      printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Sem borda")" "$(_i_paint "${C_MUTED}" "(modo clássico com colchetes)")" ;;
      waves)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Waves")" "$(_i_paint "${C_LAVENDER}" "©º°¨¨°º© info ©º°¨¨°º©")" ;;
      elegant)   printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Elegant")" "$(_i_paint "${C_LAVENDER}" "»»-(¯·.·´¯)-> info <-(¯·.·´¯)-««")" ;;
      dream)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Dream")" "$(_i_paint "${C_LAVENDER}" ",.-~*´¨¯¨·~-.¸-( info )-,.-~*´¨¯¨·~-.¸")" ;;
      kawaii)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Kawaii")" "$(_i_paint "${C_LAVENDER}" "(^^(-_-)^^) info (^^(-_-)^^)")" ;;
      moonlight) printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Moonlight")" "$(_i_paint "${C_LAVENDER}" ".°.. °.. °.. info ..° ..° ..°.")" ;;
      petals)    printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Petals")" "$(_i_paint "${C_LAVENDER}" "(¯·.(¯·.(¯·. info .·´¯).·´¯).·´¯)")" ;;
      circles)   printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Circles")" "$(_i_paint "${C_LAVENDER}" ".o0×X×0o. info .o0×X×0o.")" ;;
    esac
  done
  printf '\n'
  _say "  $(_i_paint "${C_MUTED}" "── Unicode / Emoji ──")"

  local borders_uni="shimmer gothic boop candy crown hearts bow snowflake kittycat cherry party sparkly"
  for b in $borders_uni; do
    i=$(( i + 1 ))
    case "$b" in
      shimmer)   printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Shimmer")" "$(_i_paint "${C_LAVENDER}" "ミ★ info ★彡")" ;;
      gothic)    printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Gothic")" "$(_i_paint "${C_LAVENDER}" "꧁༺ info ༻꧂")" ;;
      boop)      printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Boop")" "$(_i_paint "${C_LAVENDER}" "(◍•ᴗ•◍) ミ💖 info 💖彡")" ;;
      candy)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Candy")" "$(_i_paint "${C_LAVENDER}" "🍰 ⋆ 🍭 🎀 info 🎀 🍭 ⋆ 🍰")" ;;
      crown)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Crown")" "$(_i_paint "${C_LAVENDER}" "°•꧁,👑_ info _👑꧂•°")" ;;
      hearts)    printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Hearts")" "$(_i_paint "${C_LAVENDER}" "◦•●❤♡ info ♡❤●•◦")" ;;
      bow)       printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Bow")" "$(_i_paint "${C_LAVENDER}" "•´¯·. 🎀 info 🎀 .·¯´•")" ;;
      snowflake) printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Snowflake")" "$(_i_paint "${C_LAVENDER}" "*ੈ✩‧₊˚ info ˚₊‧✩*ੈ")" ;;
      kittycat)  printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Kittycat")" "$(_i_paint "${C_LAVENDER}" "≽^•⩊•^≼ info ◝(ᵔᵕᵔ)◜")" ;;
      cherry)    printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Cherry")" "$(_i_paint "${C_LAVENDER}" "🌸ξξ(∵❤◡❤∵)ξξ info ξξ(∵❤◡❤∵)ξξ🌸")" ;;
      party)     printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Party")" "$(_i_paint "${C_LAVENDER}" "ﾟ･:,｡★＼(^-^)♪ info ♪(^-^)/★,｡･:ﾟ")" ;;
      sparkly)   printf '  %s  %-14s %s\n' "$(_i_paint "${C_MUTED}" "${i}.")" "$(_i_paint "${C_PINK}" "Sparkly")" "$(_i_paint "${C_LAVENDER}" "｡+ﾟ☆ﾟ+｡★｡+ﾟ info ☆ﾟ+｡★｡+ﾟ☆ﾟ+")" ;;
    esac
  done

  _say ""
  _say "$(_i_paint "${C_MUTED}" "+ 54 bordas extras acessíveis via: bbl border list")"
  printf '\n'
}

_write_config() {
  local theme="${1}" border="${2:-none}"
  local config_file="${BBL_CONFIG_DIR}/config.sh"
  cat > "$config_file" <<EOF
# Barbarella — configuração do usuário
# Gerado pelo installer em $(date)

BBL_CURRENT_THEME="${theme}"
BBL_CURRENT_BORDER="${border}"
EOF
  _ok "Configuração salva (tema: ${theme}, borda: ${border})."
}

_patch_rc_file() {
  local rc_file="${1}" source_file="${2}"
  local marker="# Barbarella"

  if grep -q "$marker" "${rc_file}" 2>/dev/null; then
    _info "${rc_file} já tem Barbarella. Pulando."
    return 0
  fi

  cat >> "${rc_file}" <<EOF

${marker}
export BBL_DIR="\${HOME}/.barbarella"
source "\${BBL_DIR}/${source_file}"
EOF
  _ok "Linha adicionada em ${rc_file}."
}

# ── Main ───────────────────────────────────────────────────────────────────────

main() {
  _banner
  _detect_shells

  # ── Step 1: Choose shell ──────────────────────────────────────────────────
  _say "$(_i_paint "${C_WHITE}" "Qual shell você usa?")"
  printf '\n'

  local shell_choice=""
  if [[ $BBL_HAS_ZSH -eq 1 && $BBL_HAS_BASH -eq 1 ]]; then
    _say "  $(_i_paint "${C_MUTED}" "1.") $(_i_paint "${C_PINK}" "Zsh")  $(_i_paint "${C_MUTED}" "(recomendado)")"
    _say "  $(_i_paint "${C_MUTED}" "2.") $(_i_paint "${C_PINK}" "Bash")"
    _say "  $(_i_paint "${C_MUTED}" "3.") $(_i_paint "${C_PINK}" "Ambos")"
    printf '\n'
    shell_choice="$(_ask "Escolha" "1")"
  elif [[ $BBL_HAS_ZSH -eq 1 ]]; then
    shell_choice="1"
    _info "Somente Zsh encontrado."
  elif [[ $BBL_HAS_BASH -eq 1 ]]; then
    shell_choice="2"
    _info "Somente Bash encontrado."
  else
    _err "Nem Zsh nem Bash encontrados. Instale um deles primeiro."
  fi

  # ── Step 2: Choose theme ──────────────────────────────────────────────────
  printf '\n'
  _preview_themes

  local themes_arr=("hello-kitty" "barbie" "neon" "vaporwave" "frutiger-aero" "bratz" "ciano")
  local theme_choice
  theme_choice="$(_ask "Número ou nome do tema" "1")"

  # Resolve number to name
  local chosen_theme
  if [[ "$theme_choice" =~ ^[1-9]$ ]]; then
    chosen_theme="${themes_arr[$(( theme_choice - 1 ))]}"
  else
    chosen_theme="$theme_choice"
  fi

  # Validate
  local valid=0
  for t in "${themes_arr[@]}"; do
    [[ "$t" == "$chosen_theme" ]] && valid=1 && break
  done
  [[ $valid -eq 0 ]] && {
    _warn "Tema \"${chosen_theme}\" não encontrado, usando hello-kitty."
    chosen_theme="hello-kitty"
  }

  # ── Step 3: Choose border ───────────────────────────────────────────────
  printf '\n'
  _preview_borders

  local borders_install=("none" "waves" "elegant" "dream" "kawaii" "moonlight" "petals" "circles" "shimmer" "gothic" "boop" "candy" "crown" "hearts" "bow" "snowflake" "kittycat" "cherry" "party" "sparkly")
  local border_choice
  border_choice="$(_ask "Número ou nome da borda" "1")"

  local chosen_border
  if [[ "$border_choice" =~ ^[0-9]+$ ]]; then
    chosen_border="${borders_install[$(( border_choice - 1 ))]}"
  else
    chosen_border="$border_choice"
  fi

  [[ -z "$chosen_border" ]] && chosen_border="none"

  # ── Step 4: Copy files ────────────────────────────────────────────────────
  printf '\n'
  _say "$(_i_paint "${C_WHITE}" "Instalando...")"
  printf '\n'

  _copy_files
  _write_config "$chosen_theme" "$chosen_border"

  # ── Step 5: Patch RC files ────────────────────────────────────────────────
  case "$shell_choice" in
    1|zsh)
      _patch_rc_file "${HOME}/.zshrc" "barbarella.zsh"
      ;;
    2|bash)
      _patch_rc_file "${HOME}/.bashrc" "barbarella.bash"
      ;;
    3|ambos|both)
      _patch_rc_file "${HOME}/.zshrc"  "barbarella.zsh"
      _patch_rc_file "${HOME}/.bashrc" "barbarella.bash"
      ;;
  esac

  # ── Done ──────────────────────────────────────────────────────────────────
  printf '\n'
  _i_paint "${C_PINK}" "  ╭─────────────────────────────────────────────────────╮"; echo
  _i_paint "${C_PINK}" "  │                                                     │"; echo
  _i_paint "${C_PINK}" "  │   "; _i_paint "${C_MINT}" "✔  Barbarella instalado com sucesso!"
  _i_paint "${C_PINK}" "            │"; echo
  _i_paint "${C_PINK}" "  │                                                     │"; echo
  _i_paint "${C_PINK}" "  │   "; _i_paint "${C_MUTED}" "Abra um novo terminal ou execute:"
  _i_paint "${C_PINK}" "           │"; echo

  local src_cmd
  case "$shell_choice" in
    1) src_cmd="source ~/.zshrc" ;;
    2) src_cmd="source ~/.bashrc" ;;
    3) src_cmd="source ~/.zshrc  (ou ~/.bashrc)" ;;
  esac

  _i_paint "${C_PINK}" "  │   "; _i_paint "${C_WHITE}" "  ${src_cmd}"
  _i_paint "${C_PINK}" "                        │"; echo
  _i_paint "${C_PINK}" "  │                                                     │"; echo
  _i_paint "${C_PINK}" "  │   "; _i_paint "${C_MUTED}" "Dica: digite "; _i_paint "${C_PINK}" "bbl help"
  _i_paint "${C_MUTED}" " para ver o manual"
  _i_paint "${C_PINK}" "     │"; echo
  _i_paint "${C_PINK}" "  │   "; _i_paint "${C_MUTED}" "      e "; _i_paint "${C_PINK}" "bbl theme list"
  _i_paint "${C_MUTED}" " para ver os temas"
  _i_paint "${C_PINK}" "      │"; echo
  _i_paint "${C_PINK}" "  │                                                     │"; echo
  _i_paint "${C_PINK}" "  ╰─────────────────────────────────────────────────────╯"; echo
  printf '\n'
}

main "$@"
