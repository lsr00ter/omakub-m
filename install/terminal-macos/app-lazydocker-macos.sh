#!/bin/zsh

# Install lazydocker - Terminal UI for docker
echo "Installing lazydocker..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "lazydocker"

echo "✓ lazydocker installed"
echo "Usage: Run 'lazydocker' to manage Docker containers and images"