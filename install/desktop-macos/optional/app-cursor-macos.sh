#!/bin/zsh

# Install Cursor AI-powered code editor for macOS
echo "Installing Cursor..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "cursor" "--cask"

echo "✓ Cursor installed"
echo "🤖 AI-powered code editor"
echo "   Launch from Applications"