#!/bin/zsh

# Install Steam for macOS
echo "Installing Steam..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "steam" "--cask"

echo "✓ Steam installed"
echo "🎮 Gaming platform from Valve"
echo "   Play games from https://store.steampowered.com/"
echo "   Launch from Applications"