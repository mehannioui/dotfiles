VERSION="1.0.0"
echo "📦 Installing devrc-init setup (v$VERSION)..."

#!/bin/zsh

echo "📦 Installing devrc-init dotfiles setup..."

DOTFILES_DIR="$HOME/dotfiles"
BIN_PATH="$DOTFILES_DIR/bin"

# Step 1: Clone repo if missing
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "🔄 Cloning dotfiles repo into $DOTFILES_DIR..."
  git clone https://github.com/mehannioui/dotfiles.git "$DOTFILES_DIR"
else
  echo "✅ $DOTFILES_DIR already exists. Skipping clone."
fi

# Step 2: Ensure bin/devrc-init is executable
chmod +x "$BIN_PATH/devrc-init"

# Step 3: Clean old PATH lines
sed -i '' '/dotfiles\\/bin/d' ~/.zshrc

# Step 4: Add bin to PATH if not already present
if ! grep -q "$BIN_PATH" ~/.zshrc; then
  echo "\n# Add dotfiles/bin to path" >> ~/.zshrc
  echo "export PATH=\"$BIN_PATH:\$PATH\"" >> ~/.zshrc
  echo "✅ Added to PATH in ~/.zshrc"
fi

# Step 5: Reload shell
echo "🔁 Reloading ~/.zshrc..."
source ~/.zshrc

echo "🎉 devrc-init setup v$VERSION installed!"
echo "👉 Run this to bootstrap a new project:"
echo "   mkdir my-app && cd my-app && devrc-init"
