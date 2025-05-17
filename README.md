# 🛠️ Dotfiles

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
![Platform Support](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue)
![Maintained](https://img.shields.io/badge/status-maintained-brightgreen)

My personal configuration files for macOS and Linux development environments.

This repo is organized with a clean structure to support multiple platforms and symlinks files into the correct locations automatically.

---

## ✨ Features

- 🔁 Symlink-based setup with one command
- 🧩 Modular structure: `shared`, `macos`, and `linux`
- ⚡ `zsh` + `oh-my-zsh` + `powerlevel10k`
- 🐍 `vim` + `tmux` + `starship` + `wezterm`
- 📂 XDG-style config support (`~/.config`)
- 🧼 Clean `.gitignore` to avoid tracking noise

---

## 📦 What's Inside?

```bash
dotfiles/
├── shared/         # Universal configs: .zshrc, .vimrc, .gitconfig, etc.
├── macos/          # macOS-specific configs (e.g., .wezterm.lua)
├── linux/          # Linux-specific configs (e.g., .zprofile)
├── config/         # Shared ~/.config files (e.g., starship.toml)
├── install.sh      # 🛠️ Setup script (creates symlinks based on OS)
├── .gitignore
└── README.md

## ⚙️ Installation

Clone the repo into your home directory:

```bash
git clone https://github.com/mehannioui/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh

#########################
#       dev flow        #
#########################
# Dotfiles: devrc-init + tmux fullstack workflow

A minimal, terminal-based development environment for fullstack apps using:

- `tmux` session manager
- project-local `.devrc` files
- `start-dev.sh` session launcher
- optional Git/README automation

## 🚀 Quick Start

```bash
git clone https://github.com/mehannioui/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/bin/devrc-init
echo 'export PATH="$HOME/dotfiles/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Then inside any new project folder:

```bash
devrc-init
```

## 🧠 Features

- Session name + editor prompt
- Optional creation of:
  - `client/` and `server/` folders
  - Git repo + `.gitignore` + first commit
  - `README.md`
  - `start-dev.sh` to launch tmux panes

---
