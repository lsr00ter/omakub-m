#!/bin/zsh

# Install fastfetch system info tool
echo "Installing fastfetch..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "fastfetch"

# Set up fastfetch configuration for macOS
mkdir -p ~/.config/fastfetch

# Copy configuration if available
if [[ -f ~/.local/share/omakub-macos/configs-macos/fastfetch.jsonc ]]; then
    cp ~/.local/share/omakub-macos/configs-macos/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
    echo "✓ fastfetch configuration applied"
fi

echo "✓ fastfetch installed"