#!/usr/bin/env zsh
# Zsh ZLE widgets and keybindings

# ── Widgets ────────────────────────────────────────────────────────────────────

_bbl_widget_theme_next() {
  local themes=($BBL_ALL_THEMES)
  local current="$BBL_THEME_NAME"
  local idx=0 i
  for i in "${!themes[@]}"; do
    [[ "${themes[$i]}" == "$current" ]] && { idx=$i; break; }
  done
  local next=$(( (idx + 1) % ${#themes[@]} ))
  _bbl_load_theme "${themes[$next]}"
  bbl_rebuild_prompt
  zle reset-prompt
  zle -M "Tema: ${BBL_PROMPT_ICON} ${BBL_THEME_LABEL}"
}
zle -N _bbl_widget_theme_next

_bbl_widget_alias_list() {
  zle -M ""
  bbl_rebuild_prompt
  zle reset-prompt
  _bbl_alias_list
}
zle -N _bbl_widget_alias_list

_bbl_widget_shortcuts() {
  zle -M ""
  bbl_rebuild_prompt
  zle reset-prompt
  _bbl_shortcuts_print
}
zle -N _bbl_widget_shortcuts

_bbl_widget_border_next() {
  _bbl_border_next
  bbl_rebuild_prompt
  zle reset-prompt
  zle -M "Borda: ${BBL_BORDER_LABEL}"
}
zle -N _bbl_widget_border_next

_bbl_widget_refresh_ip() {
  _bbl_refresh_ip
  bbl_rebuild_prompt
  zle reset-prompt
  zle -M "IP: ${BBL_HOST_IP}"
}
zle -N _bbl_widget_refresh_ip

# ── Keybindings ────────────────────────────────────────────────────────────────
#
#   Ctrl+X  t   →  Próximo tema
#   Ctrl+X  b   →  Próxima borda decorativa
#   Ctrl+X  a   →  Listar aliases
#   Ctrl+X  h   →  Mostrar atalhos
#   Ctrl+X  i   →  Atualizar IP
#

bindkey '^Xt' _bbl_widget_theme_next
bindkey '^Xb' _bbl_widget_border_next
bindkey '^Xa' _bbl_widget_alias_list
bindkey '^Xh' _bbl_widget_shortcuts
bindkey '^Xi' _bbl_widget_refresh_ip

BBL_SHORTCUTS_ZSH="
  Ctrl+X  t    Próximo tema           (bbl theme <nome>)
  Ctrl+X  b    Próxima borda          (bbl border <nome>)
  Ctrl+X  a    Listar aliases         (bbl alias list)
  Ctrl+X  h    Mostrar atalhos        (bbl shortcuts)
  Ctrl+X  i    Atualizar IP no prompt
"
