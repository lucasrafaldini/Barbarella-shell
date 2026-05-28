#!/usr/bin/env bash
# Bash prompt — uses PROMPT_COMMAND

_bbl_bash_fg() { printf '\[\033[38;5;%sm\]' "${1}"; }
_bbl_bash_reset() { printf '\[\033[0m\]'; }
_bbl_bash_bold() { printf '\[\033[1m\]'; }

_bbl_bash_git_info() {
  local branch dirty=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) \
    || branch=$(git rev-parse --short HEAD 2>/dev/null) \
    || return

  [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="✎"

  printf '%sgit:(%s%s)%s' \
    "$(_bbl_bash_fg "${BBL_C_GIT}")" \
    "${branch}${dirty}" \
    "$(_bbl_bash_reset)"
}

_bbl_rebuild_prompt() {
  bbl_rebuild_prompt
}

bbl_rebuild_prompt() {
  local git_info=""
  git rev-parse --git-dir &>/dev/null 2>&1 && git_info="$(_bbl_bash_git_info)"

  local R="$(_bbl_bash_reset)"
  local p=""

  if [[ -n "${BBL_DECO_LEFT:-}" ]]; then
    # ── Decorated mode (border style active) ──────────────────────────────
    local sep="$(_bbl_bash_fg "${BBL_C_MUTED}") · ${R}"

    # Line 1: DECO_LEFT segments DECO_RIGHT
    p+="$(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_DECO_LEFT}${R} "
    p+="$(_bbl_bash_fg "${BBL_C_SECONDARY}")\u$(_bbl_bash_fg "${BBL_C_MUTED}")@$(_bbl_bash_fg "${BBL_C_PRIMARY}")\h"
    p+="${sep}"
    p+="$(_bbl_bash_fg "${BBL_C_ACCENT}")\w"
    [[ -n "$git_info" ]] && p+="${sep}${git_info}"
    p+="${sep}"
    p+="$(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_OS_ICON}$(_bbl_bash_fg "${BBL_C_MUTED}") ${BBL_HOST_IP}"
    p+="${sep}"
    p+="$(_bbl_bash_fg "${BBL_C_MUTED}")\t${R}"
    p+=" $(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_DECO_RIGHT}${R}"
    p+='\n'

    # Line 2
    p+="$(_bbl_bash_bold)$(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_PROMPT_CHAR}${R} "

  else
    # ── Classic mode (bracket style) ──────────────────────────────────────

    # Line 1
    p+="$(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_CORNER_TL}${BBL_SEP}"
    p+="$(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_BRACKET_L}${BBL_PROMPT_ICON} Barbarella${BBL_BRACKET_R}"
    p+="$(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_SEP}${R}"
    p+=" $(_bbl_bash_fg "${BBL_C_SECONDARY}")\u$(_bbl_bash_fg "${BBL_C_MUTED}")@$(_bbl_bash_fg "${BBL_C_PRIMARY}")\h"
    p+=" $(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_SEP}${R}"
    p+=" $(_bbl_bash_fg "${BBL_C_ACCENT}")\w"
    [[ -n "$git_info" ]] && p+=" $(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_SEP} ${git_info}"
    p+=" $(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_SEP}${R}"
    p+=" $(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_OS_ICON}$(_bbl_bash_fg "${BBL_C_MUTED}") ${BBL_HOST_IP}"
    p+=" $(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_SEP}${R}"
    p+=" $(_bbl_bash_fg "${BBL_C_MUTED}")\t${R}"
    p+='\n'

    # Line 2
    p+="$(_bbl_bash_fg "${BBL_C_MUTED}")${BBL_CORNER_BL}${BBL_SEP}$(_bbl_bash_bold)$(_bbl_bash_fg "${BBL_C_PRIMARY}")${BBL_PROMPT_CHAR}${R} "
  fi

  PS1="$p"
}

_bbl_prompt_command() {
  bbl_rebuild_prompt
}

# Prepend to PROMPT_COMMAND (idempotent)
case "${PROMPT_COMMAND:-}" in
  *_bbl_prompt_command*) ;;
  "")  PROMPT_COMMAND="_bbl_prompt_command" ;;
  *)   PROMPT_COMMAND="_bbl_prompt_command; ${PROMPT_COMMAND}" ;;
esac
