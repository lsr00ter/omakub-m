#!/bin/zsh

# Install btop system monitor
echo "Installing btop system monitor..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "btop"

# Set up btop configuration for macOS
mkdir -p ~/.config/btop

# Copy configuration if available
if [[ -f ~/.local/share/omakub-macos/configs-macos/btop.conf ]]; then
    cp ~/.local/share/omakub-macos/configs-macos/btop.conf ~/.config/btop/btop.conf
    echo "✓ btop configuration applied"
fi

echo "✓ btop installed"