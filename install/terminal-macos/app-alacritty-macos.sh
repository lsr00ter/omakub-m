#!/bin/zsh

# Install Alacritty terminal for macOS
echo "Installing Alacritty..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "alacritty" "--cask"
xattr -rd com.apple.quarantine /Applications/Alacritty.app

# Set up Alacritty configuration
mkdir -p ~/.config/alacritty

# Copy alacritty config if available
if [[ -f ~/.local/share/omakub-macos/configs-macos/alacritty.toml ]]; then
    cp ~/.local/share/omakub-macos/configs-macos/alacritty.toml ~/.config/alacritty/alacritty.toml
    echo "✓ Alacritty configuration applied"
fi

echo "✓ Alacritty installed"
