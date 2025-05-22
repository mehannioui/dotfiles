# 🛠️ My Dotfiles

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
![Platform Support](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue)
![Maintained](https://img.shields.io/badge/status-maintained-brightgreen)

My personal configuration files for macOS and Linux development environments, designed for a consistent and productive workflow, especially with `tmux`, `zsh`, and `nvim`.

This repository is structured to be modular, multi-platform, and uses a symlink-based installation for easy setup and synchronization.

---

## ✨ Core Features

- 💨 **One-Command Setup:** A single script (`install.sh`) symlinks all configurations.
- 💻 **Cross-Platform:** Supports macOS and Linux with shared and OS-specific settings.
- 🧩 **Modular Structure:**
    - `shared/`: Universal dotfiles (e.g., `.zshrc`, `.gitconfig`).
    - `shared/config/`: Universal XDG configurations (e.g., for `nvim/`, `yazi/`, `starship.toml`).
    - `macos/`: macOS-specific configurations (e.g., `wezterm.lua`).
    - `linux/`: Linux-specific configurations.
- 🚀 **Productivity Tools:** Configurations tailored for `zsh` (with Oh My Zsh & Powerlevel10k ideally), `nvim`, `tmux`, `wezterm`, `yazi`, `starship`, and more.
- 🧼 **Clean Home Directory:** Uses symlinks to keep your `$HOME` directory tidy, with actual config files organized within this repository.
- 🔄 **Easy Syncing:** Keep all your machines synchronized by committing changes here and running the install script.

---

## 🚀 Quick Installation

1.  **Clone the Repository:**
    *(If you have SSH keys set up for GitHub, use the SSH URL. Otherwise, use HTTPS and you might be prompted for credentials or a PAT).*
    ```bash
    # Using SSH (recommended)
    git clone git@github.com:mehannioui/dotfiles.git ~/dotfiles
    # Or using HTTPS
    # git clone [https://github.com/mehannioui/dotfiles.git](https://github.com/mehannioui/dotfiles.git) ~/dotfiles
    ```

2.  **Navigate into the Directory:**
    ```bash
    cd ~/dotfiles
    ```

3.. **Run the Installation Script:**
    This script will create symlinks from your home directory (and `~/.config`) to the files within this `~/dotfiles` repository.
    ```bash
    ./install.sh
    ```
    *(If you get a permission denied error, run `chmod +x install.sh` first).*

    **Note:** The `install.sh` script will forcefully overwrite existing files or symlinks in your home directory (`~`) and `~/.config/` that correspond to the dotfiles it manages, *without creating backups*. This is intentional for a clean setup once you're confident.

---

## 📦 Directory Structure

```text
dotfiles/
├── shared/               # Universal dotfiles (e.g., .zshrc, .gitconfig, .tmux.conf)
│   └── config/           # Universal XDG configs (e.g., nvim/, yazi/, starship.toml)
├── macos/                # macOS-specific dotfiles & configs (e.g., .zprofile_macos, wezterm.lua)
│   └── config/           # (Optional) macOS-specific XDG configs
├── linux/                # Linux-specific dotfiles & configs (e.g., .zprofile_linux)
│   └── config/           # (Optional) Linux-specific XDG configs
├── devkick/              # Tools for quickly starting development projects
│   ├── bin/
│   │   └── devrc-init    # Script to scaffold & launch dev sessions
│   └── setup.sh          # One-time PATH setup for devrc-init
├── install.sh            # Symlinks dotfiles based on OS
├── .gitignore            # Specifies intentionally untracked files
└── README.md             # This file
```
---

## 🔧 Usage

* After running `install.sh`, new terminal sessions should automatically pick up configurations for tools like Zsh, Tmux, Nvim, etc.
* To update your dotfiles on any machine, navigate to `~/dotfiles`, run `git pull origin main` (or your default branch), and then re-run `./install.sh` to ensure all symlinks are correctly pointing to the latest files.
* When you make changes to a configuration locally (e.g., edit your `~/.zshrc`, which is now a symlink), you are actually editing the file within the `~/dotfiles` repository. Remember to `cd ~/dotfiles`, then `git add`, `git commit`, and `git push` those changes to sync them to GitHub.

---
## 🛠️ `devkick`: Fullstack Dev Workflow

`devkick` is a minimal, terminal-based utility to quickly scaffold and launch `tmux` sessions for fullstack development projects.

### 🚀 `devkick` Quick Start

1.  **Ensure `devkick` is on your PATH** (the main `install.sh` might help with this if `devkick/bin` is added to PATH by one of your shell configs, or run the `devkick/setup.sh` script once):
    ```bash
    cd ~/dotfiles
    ./devkick/setup.sh # (You might only need to do this once per machine)
    ```
2.  **Inside any new or existing project folder, run:**
    ```bash
    devrc-init
    ```
    This will guide you through setting up a `tmux` development session.

### 🧠 `devkick` Features

-   Prompts for session name and primary editor command.
-   Optionally creates `client/` and `server/` subdirectories.
-   Optionally initializes a Git repository with a `.gitignore` and makes an initial commit.
-   Optionally generates a basic `README.md`.
-   Creates a `start-dev.sh` script in your project to quickly relaunch your `tmux` session with predefined panes (e.g., for editor, server, client, git).

---

## 🤝 Contributing

This is a personal dotfiles repository, but feel free to fork it or use it as inspiration!

## 📜 License

[MIT License](LICENSE) (Assuming you add a LICENSE file, otherwise remove this line or choose a license)
