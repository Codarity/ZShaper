# zshaper

> Shape your Zsh environment with clean, declarative power.

**zshaper** is a minimal, plugin-manager-aware Zsh setup layer that lets you declare which plugin manager you want to use (like `antidote`, `zinit`, or `zgen`) and prepares your shell environment accordingly.

---

## 🚀 Features

* Choose your plugin manager with a single line
* Automatic loading of the selected manager
* Ready to extend with plugin definitions (TOML/YAML or `.zsh_plugins.txt`)
* No lock-in to a specific plugin system

---

## 📦 Installation

Clone the repository into your dotfiles or config folder:

```bash
git clone https://github.com/Codarity/ZShaper.git ~/zshaper
```

In your `.zshrc`:

```zsh
# Choose your preferred plugin manager
use_plugin_manager antidote

# Load zshaper
source ~/zshaper/init.zsh
```

---

## 🛠 Supported Plugin Managers

* [x] antidote
* [ ] zinit (coming soon)
* [ ] zgen (planned)

---

## 🔮 Roadmap

* [ ] Declarative plugin list (TOML/YAML)
* [ ] Plugin autoload & lazy loading
* [ ] Tool installation support (fzf, bat, etc.)
* [ ] Self-diagnose / bootstrap CLI

---

## 🤝 Contributing

This is an early-stage tool. PRs, ideas, and feedback welcome!

---

## 📜 License

MIT

---

## ✨ Inspired by

* [antidote](https://github.com/mattmc3/antidote)
* [zinit](https://github.com/zdharma-continuum/zinit)
* [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
