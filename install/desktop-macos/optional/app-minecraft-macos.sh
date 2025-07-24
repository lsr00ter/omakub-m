#!/bin/zsh

# Install Minecraft for macOS
echo "Installing Minecraft..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "minecraft" "--cask"

echo "✓ Minecraft installed"
echo "🎮 Popular sandbox video game"
echo "   Launch from Applications"
echo "   Requires Java which is bundled with the macOS version"