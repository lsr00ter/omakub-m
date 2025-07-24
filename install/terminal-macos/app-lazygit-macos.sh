#!/bin/zsh

# Install lazygit - Terminal UI for git
echo "Installing lazygit..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "lazygit"

echo "✓ lazygit installed"
echo "Usage: Run 'lazygit' in any git repository for a terminal UI"