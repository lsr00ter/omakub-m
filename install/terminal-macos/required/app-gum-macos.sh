#!/bin/zsh

# Install gum for interactive prompts
echo "Installing gum for interactive prompts..."

# Use the libraries functions for consistency
source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

if ! command -v gum &> /dev/null; then
    install_app_via_brew "gum"
    echo "✓ gum installed successfully"
else
    echo "✓ gum already installed"
fi