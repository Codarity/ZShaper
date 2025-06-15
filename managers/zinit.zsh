# zshaper/managers/zinit.zsh

# Set install location
ZINIT_HOME="${ZSHAPER_ZINIT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git}"

# Install if missing
if [[ ! -d "$ZINIT_HOME/.git" ]]; then
  echo "[zshaper] Installing Zinit to $ZINIT_HOME"
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "$ZINIT_HOME/zinit.zsh"

# Completion
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load plugins
if [[ -z "${ZSHAPER_PLUGINS[*]}" ]]; then
  echo "[zshaper] No plugins defined for Zinit."
  return 0
fi

for plugin in "${ZSHAPER_PLUGINS[@]}"; do
  zinit light "$plugin"
done
