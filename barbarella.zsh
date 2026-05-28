#!/usr/bin/env zsh
# Barbarella — framework de terminal feminino
# Fonte: https://github.com/seuusuario/barbarella
#
# Adicione ao ~/.zshrc:
#   source ~/.barbarella/barbarella.zsh

BBL_DIR="${BBL_DIR:-${${(%):-%x}:A:h}}"
BBL_CONFIG_DIR="${BBL_CONFIG_DIR:-${HOME}/.config/barbarella}"

# ── Bootstrap ──────────────────────────────────────────────────────────────────

# shellcheck source=core/detect.sh
source "${BBL_DIR}/core/detect.sh"
# shellcheck source=core/colors.sh
source "${BBL_DIR}/core/colors.sh"
# shellcheck source=core/themes.sh
source "${BBL_DIR}/core/themes.sh"
# shellcheck source=core/borders.sh
source "${BBL_DIR}/core/borders.sh"
# shellcheck source=core/aliases.sh
source "${BBL_DIR}/core/aliases.sh"
# shellcheck source=core/help.sh
source "${BBL_DIR}/core/help.sh"
# shellcheck source=core/shortcuts.zsh
source "${BBL_DIR}/core/shortcuts.zsh"
# shellcheck source=core/prompt.zsh
source "${BBL_DIR}/core/prompt.zsh"

# ── Load user config ───────────────────────────────────────────────────────────

_bbl_config_set() {
  local key="${1}" val="${2}"
  local config_file="${BBL_CONFIG_DIR}/config.sh"
  mkdir -p "${BBL_CONFIG_DIR}"
  if grep -q "^${key}=" "${config_file}" 2>/dev/null; then
    sed -i.bak "s|^${key}=.*|${key}=\"${val}\"|" "${config_file}"
  else
    printf '%s="%s"\n' "${key}" "${val}" >> "${config_file}"
  fi
}

[ -f "${BBL_CONFIG_DIR}/config.sh" ] && source "${BBL_CONFIG_DIR}/config.sh"

# ── Load theme ─────────────────────────────────────────────────────────────────

_bbl_load_theme "${BBL_CURRENT_THEME:-hello-kitty}"

# ── Load border ───────────────────────────────────────────────────────────────

_bbl_load_border "${BBL_CURRENT_BORDER:-none}"

# ── Load user aliases ──────────────────────────────────────────────────────────

_bbl_load_builtin_aliases
_bbl_load_user_aliases

# ── bbl command ────────────────────────────────────────────────────────────────

bbl() {
  local cmd="${1:-help}"
  shift 2>/dev/null || true

  case "${cmd}" in
    theme)      _bbl_cmd_theme "$@" ;;
    border|b)   _bbl_cmd_border "$@" ;;
    alias|a)    _bbl_cmd_alias "$@" ;;
    help|h|--help|-h) _bbl_cmd_help "$@" ;;
    shortcuts|keys) _bbl_cmd_shortcuts ;;
    ip)         _bbl_refresh_ip && bbl_rebuild_prompt && printf 'IP: %s\n' "${BBL_HOST_IP}" ;;
    version|--version|-v)
      printf 'Barbarella v%s (%s · %s)\n' "${BBL_VERSION:-1.0.0}" "${BBL_THEME_LABEL:-?}" "${BBL_BORDER_LABEL:-sem borda}"
      ;;
    *)
      printf 'barbarella: comando desconhecido "%s"\n' "${cmd}" >&2
      _bbl_cmd_help
      return 1
      ;;
  esac
}

# ── Welcome banner (first load only) ──────────────────────────────────────────

if [[ -z "${BBL_LOADED:-}" ]]; then
  export BBL_LOADED=1
  printf '%s Barbarella %s carregado  %s  %s\n' \
    "$(bbl_fg "${BBL_C_MUTED}")" \
    "${BBL_PROMPT_ICON}" \
    "$(bbl_paint "${BBL_C_MUTED}" "tema: $(bbl_paint_bold "${BBL_C_SECONDARY}" "${BBL_THEME_LABEL}")")" \
    "$(bbl_paint "${BBL_C_MUTED}" "│ bbl help para o manual$(bbl_reset)")"
fi
