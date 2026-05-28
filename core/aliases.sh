#!/usr/bin/env sh
# Alias management system

BBL_USER_ALIASES="${BBL_CONFIG_DIR}/aliases.sh"

# ── Built-in alias groups ──────────────────────────────────────────────────────

_bbl_load_builtin_aliases() {
  # Navigation
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias ~='cd ~'
  alias -- -='cd -'

  # Listing
  case "$BBL_OS" in
    macos)
      alias ls='ls -G'
      alias ll='ls -lhG'
      alias la='ls -lahG'
      ;;
    *)
      alias ls='ls --color=auto'
      alias ll='ls -lh --color=auto'
      alias la='ls -lah --color=auto'
      ;;
  esac
  alias l='ll'
  alias lsd='ll | grep "^d"'

  # Safety nets
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
  alias mkdir='mkdir -p'

  # Quick edit config
  alias zshrc='${EDITOR:-nano} ~/.zshrc && source ~/.zshrc'
  alias bashrc='${EDITOR:-nano} ~/.bashrc && source ~/.bashrc'
  alias bblaliases='${EDITOR:-nano} "${BBL_USER_ALIASES}" && source "${BBL_USER_ALIASES}"'

  # Network
  alias myip='curl -s ifconfig.me && echo'
  alias localip='_bbl_get_ip'

  # Misc
  alias cls='clear'
  alias h='history'
  alias grep='grep --color=auto'
  alias path='echo $PATH | tr ":" "\n"'
}

# ── User alias file ────────────────────────────────────────────────────────────

_bbl_load_user_aliases() {
  [ -f "${BBL_USER_ALIASES}" ] && . "${BBL_USER_ALIASES}"
}

# ── bbl alias subcommands ──────────────────────────────────────────────────────

_bbl_cmd_alias() {
  case "${1:-list}" in
    list|ls|"")
      _bbl_alias_list
      ;;
    add)
      shift
      _bbl_alias_add "$@"
      ;;
    remove|rm|del)
      shift
      _bbl_alias_remove "$@"
      ;;
    edit)
      _bbl_alias_edit
      ;;
    reload)
      _bbl_load_user_aliases
      printf '%s Aliases recarregados.\n' "$(bbl_paint "${BBL_C_SUCCESS}" "✔")"
      ;;
    *)
      printf 'Uso: bbl alias [list|add <nome> <cmd>|remove <nome>|edit|reload]\n' >&2
      return 1
      ;;
  esac
}

_bbl_alias_list() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Seus aliases:"
  printf '\n\n'
  if [ -f "${BBL_USER_ALIASES}" ]; then
    grep -E '^alias ' "${BBL_USER_ALIASES}" 2>/dev/null | while IFS= read -r line; do
      local name cmd
      name="$(echo "$line" | sed "s/^alias //;s/=.*//")"
      cmd="$(echo "$line" | sed "s/^alias [^=]*=//;s/^'//;s/'$//")"
      printf '  %s  %s\n' \
        "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$name")" \
        "$(bbl_paint "${BBL_C_MUTED}" "→ $cmd")"
    done
  else
    printf '  %s\n' "$(bbl_paint "${BBL_C_MUTED}" "(nenhum alias personalizado ainda)")"
  fi

  printf '\n'
  bbl_paint_bold "${BBL_C_MUTED}" "  Aliases built-in:"
  printf '\n\n'
  local builtin_list=".. ... .... ls ll la lsd rm cp mv mkdir zshrc bashrc bblaliases myip localip cls h grep path"
  local a
  for a in $builtin_list; do
    printf '  %s\n' "$(bbl_paint "${BBL_C_ACCENT}" "$a")"
  done | paste - - - - - 2>/dev/null || true
  printf '\n'
}

_bbl_alias_add() {
  if [ $# -lt 2 ]; then
    printf 'Uso: bbl alias add <nome> <comando>\n' >&2
    printf 'Exemplo: bbl alias add gc "git commit -m"\n' >&2
    return 1
  fi
  local name="${1}"; shift
  local cmd="$*"

  # Create file with header if it doesn't exist
  if [ ! -f "${BBL_USER_ALIASES}" ]; then
    mkdir -p "$(dirname "${BBL_USER_ALIASES}")"
    printf '# Barbarella — aliases personalizados\n# Edite à vontade ou use: bbl alias add/remove\n\n' \
      > "${BBL_USER_ALIASES}"
  fi

  # Check if already exists
  if grep -q "^alias ${name}=" "${BBL_USER_ALIASES}" 2>/dev/null; then
    printf 'Alias "%s" já existe. Sobrescrever? [s/N] ' "$name"
    read -r answer
    case "$answer" in [sS]*) ;; *) return 0 ;; esac
    sed -i.bak "/^alias ${name}=/d" "${BBL_USER_ALIASES}"
  fi

  printf "alias %s='%s'\n" "$name" "$cmd" >> "${BBL_USER_ALIASES}"
  # shellcheck source=/dev/null
  . "${BBL_USER_ALIASES}"
  printf '%s alias %s criado.\n' \
    "$(bbl_paint "${BBL_C_SUCCESS}" "✔")" \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$name")"
}

_bbl_alias_remove() {
  local name="${1:-}"
  if [ -z "$name" ]; then
    printf 'Uso: bbl alias remove <nome>\n' >&2
    return 1
  fi
  if ! grep -q "^alias ${name}=" "${BBL_USER_ALIASES}" 2>/dev/null; then
    printf 'Alias "%s" não encontrado nos aliases personalizados.\n' "$name" >&2
    return 1
  fi
  sed -i.bak "/^alias ${name}=/d" "${BBL_USER_ALIASES}"
  unalias "$name" 2>/dev/null || true
  printf '%s Alias "%s" removido.\n' \
    "$(bbl_paint "${BBL_C_SUCCESS}" "✔")" \
    "$(bbl_paint_bold "${BBL_C_SECONDARY}" "$name")"
}

_bbl_alias_edit() {
  local editor="${EDITOR:-${VISUAL:-nano}}"
  printf 'Abrindo aliases em %s...\n' "$editor"
  if [ ! -f "${BBL_USER_ALIASES}" ]; then
    mkdir -p "$(dirname "${BBL_USER_ALIASES}")"
    printf '# Barbarella — aliases personalizados\n# Formato: alias nome='"'"'comando'"'"'\n\nalias exemplo='"'"'echo olá'"'"'\n' \
      > "${BBL_USER_ALIASES}"
  fi
  "${editor}" "${BBL_USER_ALIASES}"
  . "${BBL_USER_ALIASES}"
  printf '%s Aliases recarregados.\n' "$(bbl_paint "${BBL_C_SUCCESS}" "✔")"
}
