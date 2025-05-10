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
