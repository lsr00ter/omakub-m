#!/bin/zsh

# Install Signal messenger for macOS
echo "Installing Signal messenger..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "signal" "--cask"

echo "✓ Signal messenger installed"
echo "📱 Signal provides secure messaging with end-to-end encryption"