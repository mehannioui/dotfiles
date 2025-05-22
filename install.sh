#!/bin/bash

set -e

DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
OS="$(uname)"

echo "📁 Installing dotfiles from $DOTFILES"
echo "🔍 Detected OS: $OS"

# -------- Shared Dotfiles --------
echo "🔗 Linking shared dotfiles..."
for file in "$DOTFILES/shared"/.*; do
  filename="$(basename "$file")"

  # Skip . and ..
  if [[ "$filename" == "." || "$filename" == ".." ]]; then
    continue
  fi

  # Symlink to home directory
  ln -sf "$file" "$HOME/$filename"
  echo "✅ Linked $filename → $HOME/$filename"
done

# -------- Shared .config Files --------
if [ -d "$DOTFILES/shared/config" ]; then
  echo "🗂️ Linking config files to ~/.config..."
  mkdir -p "$CONFIG_DIR"
  for config_file in "$DOTFILES/shared/config/"*; do
    config_name="$(basename "$config_file")"
    ln -sf "$config_file" "$CONFIG_DIR/$config_name"
    echo "✅ Linked $config_name → $CONFIG_DIR/$config_name"
  done
fi

# -------- Platform-Specific Files --------
if [[ "$OS" == "Darwin" ]]; then
  echo "🍏 Linking macOS-specific files..."
  for file in "$DOTFILES/macos"/.*; do
    filename="$(basename "$file")"
    [[ "$filename" == "." || "$filename" == ".." ]] && continue
    ln -sf "$file" "$HOME/$filename"
    echo "✅ Linked $filename → $HOME/$filename"
  done
elif [[ "$OS" == "Linux" ]]; then
  echo "🐧 Linking Linux-specific files..."
  for file in "$DOTFILES/linux"/.*; do
    filename="$(basename "$file")"
    [[ "$filename" == "." || "$filename" == ".." ]] && continue
    ln -sf "$file" "$HOME/$filename"
    echo "✅ Linked $filename → $HOME/$filename"
  done
fi

echo "🎉 All dotfiles installed and linked!"
