# zshaper/core/api.zsh

# Internal API for Zshaper
typeset -gA ZSHAPER_STATE
typeset -ga ZSHAPER_PLUGINS

plugin_manager() {
  ZSHAPER_STATE[manager]="$1"
}

plugin() {
  for existing in "${ZSHAPER_PLUGINS[@]}"; do
    [[ "$existing" == "$1" ]] && return
  done
  ZSHAPER_PLUGINS+=("$1")
}

zshaper() {
  local cmd=$1
  shift
  case "$cmd" in
    init)
      _zshaper_do_init
      ;;
    *)
      echo "Unknown zshaper command: $cmd"
      ;;
  esac
}

_zshaper_do_init() {
  if [[ -z "${ZSHAPER_STATE[manager]}" ]]; then
    echo "No plugin manager specified. Use 'plugin_manager <name>' to set one."
    return 1
  fi

  local manager="${ZSHAPER_STATE[manager]}"
  local loader="${ZSHAPER_ROOT}/managers/$manager.zsh"

  if [[ ! -f $loader ]]; then
    echo "Unsupported plugin manager: $manager"
    return 1
  fi

  # Lade Manager-Datei mit Zugriff auf $ZSHAPER_PLUGINS
  source "$loader"
}
