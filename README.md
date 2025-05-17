# 🛠️ Dotfiles

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
![Platform Support](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue)
![Maintained](https://img.shields.io/badge/status-maintained-brightgreen)

My personal configuration files for macOS and Linux development environments, with an integrated terminal-based fullstack dev workflow using `tmux`.

This repo is modular, multi-platform, and optimized for clean symlinks and developer productivity.

---

## ✨ Features

- 🔁 Symlink-based installation with one command
- 🧩 Modular structure: `shared/`, `macos/`, `linux/`, and `shared/config/`
- ⚡ `zsh` + `oh-my-zsh` + `powerlevel10k`
- 🐍 `vim` + `tmux` + `starship` + `wezterm`
- 📂 Supports XDG-compliant configs (`~/.config`)
- 🧼 `.gitignore` avoids clutter and backups
- 🚀 `devrc-init`: fast project bootstrapping in `tmux`

---

## 📦 Directory Structure

```bash
dotfiles/
├── shared/           # Universal dotfiles (.zshrc, .vimrc, etc.)
├── shared/config/    # XDG configs (starship.toml, nvim/, etc.)
├── macos/            # macOS-specific dotfiles (wezterm.lua, zprofile)
├── linux/            # Linux-specific dotfiles (zprofile, etc.)
├── devkick/
│   ├── bin/
│   │   └── devrc-init      # Script to scaffold & launch dev sessions
│   └── setup.sh            # One-time PATH setup for devrc-init
├── install.sh        # Symlinks dotfiles based on OS
├── .gitignore
└── README.md

Installing Dotfiles
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

cd ~/dotfiles
chmod +x devkick/bin/devrc-init
./devkick/setup.sh

Then inside any new project folder from a terminal:

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
