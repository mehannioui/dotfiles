#!/bin/zsh

VERSION="1.0.0"
echo "📦 Installing devkick (v$VERSION)..."

DOTFILES_DIR="$HOME/dotfiles"
DEVKICK_DIR="$DOTFILES_DIR/devkick"
BIN_PATH="$DEVKICK_DIR/bin"
ZSHRC="$HOME/.zshrc"

# Step 1: Clone dotfiles if missing
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "🔄 Cloning dotfiles repo into $DOTFILES_DIR..."
  git clone https://github.com/mehannioui/dotfiles.git "$DOTFILES_DIR"
else
  echo "✅ Dotfiles already exist at $DOTFILES_DIR"
fi

# Step 2: Ensure devrc-init is executable
if [ -f "$BIN_PATH/devrc-init" ]; then
  chmod +x "$BIN_PATH/devrc-init"
  echo "✅ devrc-init is executable"
else
  echo "❌ devrc-init not found in $BIN_PATH"
fi

# Step 3: Add devkick/bin to PATH if missing
if ! grep -q 'devkick/bin' "$ZSHRC"; then
  echo "\n# Add devkick/bin to PATH" >> "$ZSHRC"
  echo "export PATH=\"$BIN_PATH:\$PATH\"" >> "$ZSHRC"
  echo "✅ Added devkick/bin to PATH in $ZSHRC"
else
  echo "✅ PATH already includes devkick/bin"
fi

# Step 4: Reload .zshrc if interactive
if [[ $- == *i* ]]; then
  echo "🔁 Reloading $ZSHRC..."
  source "$ZSHRC"
else
  echo "ℹ️ Run 'source ~/.zshrc' to activate updated PATH"
fi

# Done
echo "🎉 devkick v$VERSION installed!"
echo "👉 To bootstrap a new project, run:"
echo "   mkdir my-app && cd my-app && devrc-init"
