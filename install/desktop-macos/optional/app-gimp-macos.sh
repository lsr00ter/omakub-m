#!/bin/zsh

# Install GIMP for macOS
echo "Installing GIMP..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "gimp" "--cask"

echo "✓ GIMP installed"
echo "🎨 GNU Image Manipulation Program"
echo "   Professional image editing software"
echo "   Launch from Applications"