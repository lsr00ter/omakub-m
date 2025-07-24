#!/bin/zsh

# Install Audacity for macOS
echo "Installing Audacity..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "audacity" "--cask"

echo "✓ Audacity installed"
echo "🎵 Audio editing and recording software"
echo "   Launch from Applications"