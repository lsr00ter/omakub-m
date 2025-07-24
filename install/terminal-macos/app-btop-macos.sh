#!/bin/zsh

# Install btop system monitor
echo "Installing btop system monitor..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "btop"

echo "✓ btop installed"