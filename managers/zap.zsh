# zshaper/managers/zap.zsh

# Set install directory
ZAP_HOME="${ZSHAPER_ZAP_DIR:-$HOME/.local/share/zap}"

# Install Zap if not present
if [[ ! -f "$ZAP_HOME/zap.zsh" ]]; then
  echo "[zshaper] Installing Zap to $ZAP_HOME..."
  mkdir -p "$(dirname "$ZAP_HOME")"
  git clone --depth=1 https://github.com/zap-zsh/zap.git "$ZAP_HOME"
fi

# Load Zap
source "$ZAP_HOME/zap.zsh"

# No plugins?
if [[ -z "${ZSHAPER_PLUGINS[*]}" ]]; then
  echo "[zshaper] No plugins defined for Zap."
  return 0
fi

# Install missing and load
zap install "${ZSHAPER_PLUGINS[@]}"
