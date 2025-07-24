#!/bin/zsh

# Install Zoom for macOS
echo "Installing Zoom..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "zoom" "--cask"

echo "✓ Zoom installed"
echo "📹 Video conferencing software"
echo "   Make video calls using https://zoom.us/"
echo "   Launch from Applications"