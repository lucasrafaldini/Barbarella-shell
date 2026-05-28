#!/usr/bin/env zsh
# Zsh prompt — uses PROMPT_SUBST + precmd hook

setopt PROMPT_SUBST

_bbl_zsh_git_info() {
  local branch dirty=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
    || branch=$(git rev-parse --short HEAD 2>/dev/null) \
    || return

  [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="✎"

  printf '%s%s%s' \
    "%F{${BBL_C_GIT}}git:(${branch}${dirty})" \
    "%f"
}

_bbl_rebuild_prompt() {
  bbl_rebuild_prompt
}

bbl_rebuild_prompt() {
  local git_info=""
  git rev-parse --git-dir &>/dev/null && git_info="$(_bbl_zsh_git_info)"

  local p=""

  if [[ -n "${BBL_DECO_LEFT:-}" ]]; then
    # ── Decorated mode (border style active) ──────────────────────────────
    local sep="%F{${BBL_C_MUTED}} · %f"

    # Line 1: DECO_LEFT segments DECO_RIGHT
    p+="%F{${BBL_C_PRIMARY}}${BBL_DECO_LEFT}%f "
    p+="%F{${BBL_C_SECONDARY}}%n%F{${BBL_C_MUTED}}@%F{${BBL_C_PRIMARY}}%m"
    p+="${sep}"
    p+="%F{${BBL_C_ACCENT}}%~"
    [[ -n "$git_info" ]] && p+="${sep}${git_info}"
    p+="${sep}"
    p+="%F{${BBL_C_PRIMARY}}${BBL_OS_ICON}%F{${BBL_C_MUTED}} ${BBL_HOST_IP}"
    p+="${sep}"
    p+="%F{${BBL_C_MUTED}}%T%f"
    p+=" %F{${BBL_C_PRIMARY}}${BBL_DECO_RIGHT}%f"
    p+=$'\n'

    # Line 2
    p+="%F{${BBL_C_PRIMARY}}%B${BBL_PROMPT_CHAR}%b%f "

  else
    # ── Classic mode (bracket style) ──────────────────────────────────────

    # Line 1
    p+="%F{${BBL_C_MUTED}}${BBL_CORNER_TL}${BBL_SEP}"
    p+="%F{${BBL_C_PRIMARY}}${BBL_BRACKET_L}${BBL_PROMPT_ICON} Barbarella${BBL_BRACKET_R}"
    p+="%F{${BBL_C_MUTED}}${BBL_SEP}%f"
    p+=" %F{${BBL_C_SECONDARY}}%n%F{${BBL_C_MUTED}}@%F{${BBL_C_PRIMARY}}%m"
    p+=" %F{${BBL_C_MUTED}}${BBL_SEP}%f"
    p+=" %F{${BBL_C_ACCENT}}%~"
    [[ -n "$git_info" ]] && p+=" %F{${BBL_C_MUTED}}${BBL_SEP} ${git_info}"
    p+=" %F{${BBL_C_MUTED}}${BBL_SEP}%f"
    p+=" %F{${BBL_C_PRIMARY}}${BBL_OS_ICON}%F{${BBL_C_MUTED}} ${BBL_HOST_IP}"
    p+=" %F{${BBL_C_MUTED}}${BBL_SEP}%f"
    p+=" %F{${BBL_C_MUTED}}%T%f"
    p+=$'\n'

    # Line 2
    p+="%F{${BBL_C_MUTED}}${BBL_CORNER_BL}${BBL_SEP}%F{${BBL_C_PRIMARY}}%B${BBL_PROMPT_CHAR}%b%f "
  fi

  PROMPT="$p"
  RPROMPT=""
}

_bbl_precmd() {
  bbl_rebuild_prompt
}

# Register precmd hook (idempotent)
autoload -Uz add-zsh-hook 2>/dev/null
add-zsh-hook precmd _bbl_precmd
