#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

# --- Configuration ---
# Ensure your GitHub username and repo name are correct here
DOTFILES_REPO_URL="git@github.com:mehannioui/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

OS="$(uname)"

echo "🚀 Starting dotfiles setup..."
echo "OS detected: $OS"

# --- 1. Ensure Dotfiles Repository is Cloned and Up-to-Date ---
if [ ! -d "$DOTFILES_DIR/.git" ]; then # Check for .git directory to ensure it's a repo
  echo "📁 Dotfiles repository not found at $DOTFILES_DIR. Cloning from $DOTFILES_REPO_URL..."
  # Clone if the directory doesn't exist or isn't a git repo
  if [ -d "$DOTFILES_DIR" ]; then
    echo "Warning: $DOTFILES_DIR exists but is not a git repository. Moving it to ${DOTFILES_DIR}_old_$(date +%Y%m%d_%H%M%S)"
    mv "$DOTFILES_DIR" "${DOTFILES_DIR}_old_$(date +%Y%m%d_%H%M%S)"
  fi
  git clone "$DOTFILES_REPO_URL" "$DOTFILES_DIR"
else
  echo "🔄 Dotfiles repository found at $DOTFILES_DIR. Pulling latest changes..."
  (cd "$DOTFILES_DIR" && git pull origin main) # Assuming 'main' is your default branch
fi
echo "✅ Dotfiles repository ready."

# --- Function to forcefully create or update a symlink ---
# Usage: force_symlink "target_in_dotfiles_repo" "symlink_location_in_home"
force_symlink() {
  local target_file="$1"
  local symlink_location="$2"
  local symlink_basename # To store just the filename for messages

  symlink_basename="$(basename "$symlink_location")"

  # Ensure target file actually exists in the dotfiles repo
  if [ ! -e "$target_file" ] && [ ! -L "$target_file" ]; then
    echo "⚠️ Target file $target_file does not exist in dotfiles repo. Skipping $symlink_basename."
    return
  fi

  # Check if it's already a symlink pointing to the correct target to avoid unnecessary operations/output
  if [ -L "$symlink_location" ] && [ "$(readlink "$symlink_location")" == "$target_file" ]; then
    echo "👍 Symlink $symlink_basename already correctly points to $target_file."
    return
  fi

  # Ensure parent directory for symlink exists (e.g., for ~/.config/something)
  echo "Ensuring parent directory for $symlink_location exists..."
  mkdir -p "$(dirname "$symlink_location")"

  # Forcefully create/overwrite the symlink.
  # The -f option in 'ln -sf' will remove existing destination files.
  echo "🔗 Linking $target_file → $symlink_location"
  ln -sf "$target_file" "$symlink_location"
  echo "✅ Linked $symlink_basename."
}

# -------- Shared Dotfiles (for $HOME) --------
echo "🔗 Processing shared dotfiles for $HOME/ ..."
# Loop through non-hidden files AND dotfiles (excluding . and .. and .git)
# Using find is more robust for hidden files than '.*'
find "$DOTFILES_DIR/shared" -maxdepth 1 -mindepth 1 \( -name ".*" -o -not -name ".*" \) -not -name ".git" -not -name "config" | while read -r file_path; do
  filename="$(basename "$file_path")"
  # Skip 'config' directory here as it's handled separately
  if [[ "$filename" == "config" ]]; then
      continue
  fi
  force_symlink "$file_path" "$HOME/$filename"
done

# -------- Shared .config Files/Directories --------
SHARED_CONFIG_SOURCE_DIR="$DOTFILES_DIR/shared/config"
if [ -d "$SHARED_CONFIG_SOURCE_DIR" ]; then
  echo "🗂️ Processing shared config items from $SHARED_CONFIG_SOURCE_DIR/ to $CONFIG_DIR/ ..."
  mkdir -p "$CONFIG_DIR" # Ensure ~/.config exists
  # Loop through all items (files and directories) in shared/config
  find "$SHARED_CONFIG_SOURCE_DIR" -maxdepth 1 -mindepth 1 | while read -r item_path; do
    item_name="$(basename "$item_path")"
    force_symlink "$item_path" "$CONFIG_DIR/$item_name"
  done
fi

# -------- Platform-Specific Dotfiles & Configs --------
platform_dotfiles_dir=""
platform_config_dir="" # For OS-specific .config items
platform_name=""

if [[ "$OS" == "Darwin" ]]; then
  platform_name="macOS"
  platform_dotfiles_dir="$DOTFILES_DIR/macos"
  platform_config_dir="$DOTFILES_DIR/macos/config" # Optional OS-specific config path
elif [[ "$OS" == "Linux" ]]; then
  platform_name="Linux"
  platform_dotfiles_dir="$DOTFILES_DIR/linux"
  platform_config_dir="$DOTFILES_DIR/linux/config" # Optional OS-specific config path
fi

# Link OS-specific dotfiles for $HOME
if [ -n "$platform_dotfiles_dir" ] && [ -d "$platform_dotfiles_dir" ]; then
  echo "💻 Processing $platform_name-specific dotfiles for $HOME/ from $platform_dotfiles_dir/ ..."
  find "$platform_dotfiles_dir" -maxdepth 1 -mindepth 1 \( -name ".*" -o -not -name ".*" \) -not -name ".git" -not -name "config" | while read -r file_path; do
    filename="$(basename "$file_path")"
    if [[ "$filename" == "config" ]]; then # Skip 'config' subdirectory if present
        continue
    fi
    force_symlink "$file_path" "$HOME/$filename"
  done
fi

# Link OS-specific .config items
if [ -n "$platform_config_dir" ] && [ -d "$platform_config_dir" ]; then
  echo "💻 Processing $platform_name-specific config items from $platform_config_dir/ to $CONFIG_DIR/ ..."
  mkdir -p "$CONFIG_DIR" # Ensure ~/.config exists
  find "$platform_config_dir" -maxdepth 1 -mindepth 1 | while read -r item_path; do
    item_name="$(basename "$item_path")"
    force_symlink "$item_path" "$CONFIG_DIR/$item_name"
  done
fi

echo "🎉 Dotfiles setup script finished!"
echo "   Existing files/symlinks at target locations were overwritten if different."
echo "   Please restart your shell or source your shell configuration file for changes to take effect."
