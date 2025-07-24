#!/bin/zsh

# Install Google Chrome for macOS
echo "Installing Google Chrome..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "google-chrome" "--cask"

echo "✓ Google Chrome installed"
echo "Note: To set Chrome as default browser, go to:"
echo "System Preferences → General → Default web browser → Google Chrome"