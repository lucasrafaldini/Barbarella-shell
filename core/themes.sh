#!/usr/bin/env sh
# Theme loading and switching

BBL_THEMES_DIR="${BBL_DIR}/themes"

BBL_ALL_THEMES="hello-kitty barbie neon vaporwave frutiger-aero bratz ciano"

_bbl_load_theme() {
  local name="${1}"
  local theme_file="${BBL_THEMES_DIR}/${name}.sh"

  if [ ! -f "$theme_file" ]; then
    printf 'barbarella: theme "%s" not found\n' "$name" >&2
    printf 'Available themes: %s\n' "$BBL_ALL_THEMES" >&2
    return 1
  fi

  # shellcheck source=/dev/null
  . "$theme_file"

  # Write current theme to user config
  _bbl_config_set "BBL_CURRENT_THEME" "$name"
}

_bbl_cmd_theme() {
  case "${1:-list}" in
    list|ls|"")
      _bbl_theme_list
      ;;
    preview)
      _bbl_theme_preview_all
      ;;
    *)
      _bbl_load_theme "${1}" && {
        _bbl_rebuild_prompt
        printf '%s Theme aplicado: %s%s\n' \
          "$(bbl_fg "${BBL_C_PRIMARY}")" \
          "${BBL_PROMPT_ICON} ${BBL_THEME_LABEL}" \
          "$(bbl_reset)"
      }
      ;;
  esac
}

_bbl_theme_list() {
  printf '\n'
  bbl_paint_bold "${BBL_C_PRIMARY}" "  Temas disponíveis:"
  printf '\n\n'
  local t label icon current_marker
  for t in $BBL_ALL_THEMES; do
    local theme_file="${BBL_THEMES_DIR}/${t}.sh"
    if [ -f "$theme_file" ]; then
      # shellcheck source=/dev/null
      label="$(. "$theme_file" && echo "${BBL_THEME_LABEL}")"
      icon="$(. "$theme_file" && echo "${BBL_PROMPT_ICON}")"
      current_marker=""
      [ "$t" = "${BBL_THEME_NAME:-}" ] && current_marker=" ◀ atual"
      printf '  %s  %-20s %s%s\n' \
        "$icon" \
        "$(bbl_paint "${BBL_C_SECONDARY}" "$label")" \
        "$(bbl_dim)$(bbl_fg "${BBL_C_MUTED}")bbl theme ${t}$(bbl_reset)" \
        "$(bbl_paint "${BBL_C_SUCCESS}" "$current_marker")"
    fi
  done
  printf '\n'
}

_bbl_theme_preview_all() {
  local t
  for t in $BBL_ALL_THEMES; do
    local theme_file="${BBL_THEMES_DIR}/${t}.sh"
    [ -f "$theme_file" ] || continue
    # shellcheck source=/dev/null
    (. "$theme_file"
      printf '%s %s %s %s %s \n' \
        "$(bbl_fg "${BBL_C_PRIMARY}")${BBL_CORNER_TL}${BBL_SEP}" \
        "$(bbl_paint_bold "${BBL_C_PRIMARY}" "${BBL_BRACKET_L}${BBL_PROMPT_ICON} ${BBL_THEME_LABEL}${BBL_BRACKET_R}")" \
        "$(bbl_paint "${BBL_C_SECONDARY}" "${BBL_BRACKET_L}user@host${BBL_BRACKET_R}")" \
        "$(bbl_paint "${BBL_C_ACCENT}" "~/path")" \
        "$(bbl_reset)"
    )
  done
}
