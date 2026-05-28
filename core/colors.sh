#!/usr/bin/env sh
# Utility functions for printing colored text in scripts (not PS1)
# For PS1-safe versions, see prompt.zsh / prompt.bash

# Check 256-color support
_bbl_has_256color() {
  case "${TERM:-}" in
    *256color*|*24bit*|xterm*|screen*) return 0 ;;
  esac
  return 1
}

# Print ANSI foreground escape for 256-color index
bbl_fg() { printf '\033[38;5;%sm' "${1}"; }
bbl_bg() { printf '\033[48;5;%sm' "${1}"; }
bbl_bold() { printf '\033[1m'; }
bbl_dim() { printf '\033[2m'; }
bbl_reset() { printf '\033[0m'; }

# Print colored text then reset
# bbl_paint <color_index> <text>
bbl_paint() {
  printf '%s%s%s' "$(bbl_fg "${1}")" "${2}" "$(bbl_reset)"
}

bbl_paint_bold() {
  printf '%s%s%s%s' "$(bbl_bold)" "$(bbl_fg "${1}")" "${2}" "$(bbl_reset)"
}

# Print a horizontal rule using the theme's separator and primary color
bbl_rule() {
  local width="${1:-$(tput cols 2>/dev/null || echo 60)}"
  local char="${BBL_SEP:--}"
  local line
  line="$(printf '%*s' "$width" '' | tr ' ' "$char")"
  bbl_paint "${BBL_C_MUTED:-245}" "$line"
  printf '\n'
}
