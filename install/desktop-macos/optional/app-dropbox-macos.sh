#!/bin/zsh

# Install Dropbox for macOS
echo "Installing Dropbox..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "dropbox" "--cask"

echo "✓ Dropbox installed"
echo "☁️ Sync files across machines using https://dropbox.com"
echo "   Launch from Applications and sign in to your account"