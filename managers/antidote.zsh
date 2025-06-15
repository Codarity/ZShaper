# zshaper/managers/antidote.zsh

# Set default Antidote install path (can be overridden)
ZSHAPER_ANTIDOTE_DIR="${ZSHAPER_ANTIDOTE_DIR:-$HOME/.zsh/antidote}"

# Install Antidote if not already present
if [[ ! -f "$ZSHAPER_ANTIDOTE_DIR/antidote.zsh" ]]; then
  echo "[zshaper] Installing Antidote to $ZSHAPER_ANTIDOTE_DIR..."
  git clone --depth=1 https://github.com/mattmc3/antidote "$ZSHAPER_ANTIDOTE_DIR"
fi

# Load Antidote
source "$ZSHAPER_ANTIDOTE_DIR/antidote.zsh"

# Check if plugins are defined
if [[ -z "${ZSHAPER_PLUGINS[*]}" ]]; then
  echo "[zshaper] No plugins defined for Antidote."
  return 0
fi

# Bundle & load plugins
antidote bundle "${ZSHAPER_PLUGINS[@]}" > "${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"
source "${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"
