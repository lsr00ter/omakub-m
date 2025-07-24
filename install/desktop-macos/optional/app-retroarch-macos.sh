#!/bin/zsh

# Install RetroArch for macOS
echo "Installing RetroArch..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "retroarch" "--cask"

echo "✓ RetroArch installed"
echo "🎮 Multi-platform emulator frontend"
echo "   Launch from Applications"
echo "   Download cores for specific console emulation"