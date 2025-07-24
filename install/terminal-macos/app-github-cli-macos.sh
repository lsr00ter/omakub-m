#!/bin/zsh

# Install GitHub CLI
echo "Installing GitHub CLI..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "gh"

echo "✓ GitHub CLI (gh) installed"
echo "Usage: Run 'gh auth login' to authenticate with GitHub"