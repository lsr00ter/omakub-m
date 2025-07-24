#!/bin/zsh

# Install Zed editor for macOS
echo "Installing Zed..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "zed" "--cask"

echo "✓ Zed installed"
echo "⚡ Fast, collaborative code editor"
echo "   Launch from Applications"