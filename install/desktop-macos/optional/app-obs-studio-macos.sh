#!/bin/zsh

# Install OBS Studio for macOS
echo "Installing OBS Studio..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "obs" "--cask"

echo "✓ OBS Studio installed"
echo "🎬 OBS Studio for screen recording and streaming"
echo "   Capture display, webcam, and audio in the same recording"
echo "   Launch from Applications"