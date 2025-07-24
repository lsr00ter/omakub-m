#!/bin/zsh

# Install Spotify for macOS
echo "Installing Spotify..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "spotify" "--cask"

echo "✓ Spotify installed"
echo "🎵 Stream music using Spotify"
echo "   Launch from Applications or Spotlight"