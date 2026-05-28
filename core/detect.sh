#!/usr/bin/env sh
# Shell and OS detection — sourced first by both barbarella.zsh and barbarella.bash

if [ -n "${ZSH_VERSION:-}" ]; then
  BBL_SHELL="zsh"
elif [ -n "${BASH_VERSION:-}" ]; then
  BBL_SHELL="bash"
else
  BBL_SHELL="sh"
fi

case "$(uname -s 2>/dev/null)" in
  Darwin) BBL_OS="macos" ; BBL_OS_ICON="🍎" ;;
  Linux)  BBL_OS="linux" ; BBL_OS_ICON="🐧" ;;
  *)      BBL_OS="other" ; BBL_OS_ICON="💻" ;;
esac

_bbl_get_ip() {
  if [ "$BBL_OS" = "macos" ]; then
    ipconfig getifaddr en0 2>/dev/null \
      || ipconfig getifaddr en1 2>/dev/null \
      || echo "–"
  else
    hostname -I 2>/dev/null | awk '{print $1}' || echo "–"
  fi
}

_bbl_refresh_ip() {
  BBL_HOST_IP="$(_bbl_get_ip)"
}

_bbl_refresh_ip
