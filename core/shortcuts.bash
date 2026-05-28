#!/usr/bin/env bash
# Bash readline macros (substitutes for Zsh ZLE widgets)

# Ctrl+X t → switch to next theme
bind '"\C-xt": "\C-ubbl theme next\n"' 2>/dev/null || true

# Ctrl+X b → switch to next border
bind '"\C-xb": "\C-ubbl border next\n"' 2>/dev/null || true

# Ctrl+X a → list aliases
bind '"\C-xa": "\C-ubbl alias list\n"' 2>/dev/null || true

# Ctrl+X h → show shortcuts
bind '"\C-xh": "\C-ubbl shortcuts\n"' 2>/dev/null || true

# Ctrl+X i → refresh IP
bind '"\C-xi": "\C-ubbl ip\n"' 2>/dev/null || true

BBL_SHORTCUTS_BASH="
  Ctrl+X  t    Próximo tema           (bbl theme <nome>)
  Ctrl+X  b    Próxima borda          (bbl border <nome>)
  Ctrl+X  a    Listar aliases         (bbl alias list)
  Ctrl+X  h    Mostrar atalhos        (bbl shortcuts)
  Ctrl+X  i    Atualizar IP
"
