# zshaper/managers/zgenom.zsh

# Install zgenom if missing
ZGENOM_HOME="${ZSHAPER_ZGENOM_DIR:-$HOME/.zsh/zgenom}"
if [[ ! -f "$ZGENOM_HOME/zgenom.zsh" ]]; then
  echo "[zshaper] Installing zgenom to $ZGENOM_HOME..."
  git clone https://github.com/jandamm/zgenom "$ZGENOM_HOME"
fi

# Load zgenom
source "$ZGENOM_HOME/zgenom.zsh"

# Init zgenom
zgenom autoload

# Use a plugin cache file
ZGENOM_SAVE_FILE="${ZGENOM_SAVE_FILE:-${ZDOTDIR:-$HOME}/.zgenom_plugins.zsh}"
zgenom init "$ZGENOM_SAVE_FILE"

# No plugins? Exit
if [[ -z "${ZSHAPER_PLUGINS[*]}" ]]; then
  echo "[zshaper] No plugins defined for zgenom."
  return 0
fi

# If cache exists, apply and skip reloading
if [[ -f "$ZGENOM_SAVE_FILE" ]]; then
  zgenom apply
else
  for plugin in "${ZSHAPER_PLUGINS[@]}"; do
    zgenom load "$plugin"
  done
  zgenom save
fi
