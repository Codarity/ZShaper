# zshaper/managers/zplug.zsh

# Set default install location (falls nicht explizit gesetzt)
ZPLUG_HOME="${ZPLUG_HOME:-${ZSHAPER_ZPLUG_DIR:-$HOME/.zsh/zplug}}"

# Install zplug if missing
if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
  echo "[zshaper] Installing zplug to $ZPLUG_HOME..."
  git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

# Load zplug
export ZPLUG_HOME
source "$ZPLUG_HOME/init.zsh"

# Check for defined plugins
if [[ -z "${ZSHAPER_PLUGINS[*]}" ]]; then
  echo "[zshaper] No plugins defined for zplug."
  return 0
fi

# Register plugins
for plugin in "${ZSHAPER_PLUGINS[@]}"; do
  zplug "$plugin"
done

# Install missing
if ! zplug check --verbose; then
  echo "[zshaper] Installing missing plugins..."
  zplug install
fi

# Load all plugins
zplug load
