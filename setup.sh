#!/bin/zsh

echo "📦 Installing devrc-init dotfiles setup..."

# Where to clone (if not already there)
TARGET="$HOME/dotfiles"

if [ ! -d "$TARGET" ]; then
  echo "🔄 Cloning dotfiles repo into $TARGET..."
  git clone https://github.com/mehannioui/dotfiles.git "$TARGET"
else
  echo "✅ $TARGET already exists. Skipping clone."
fi

# Add to PATH if not already there
if ! printenv PATH | grep -q "$TARGET/bin"; then
  echo "🛠️  Adding $TARGET/bin to PATH in ~/.zshrc..."
  echo '\n# Add dotfiles/bin to path' >> ~/.zshrc
  echo 'export PATH="$TARGET/bin:$PATH"' >> ~/.zshrc
fi

# Make sure script is executable
chmod +x "$TARGET/bin/devrc-init"

# Source updated PATH
echo "🔁 Sourcing .zshrc..."
source ~/.zshrc

echo "✅ Done. You can now run: devrc-init"
