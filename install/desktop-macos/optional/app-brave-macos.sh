#!/bin/zsh

# Install Brave Browser for macOS
echo "Installing Brave Browser..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "brave-browser" "--cask"

echo "✓ Brave Browser installed"
echo "🦁 Privacy-focused web browser"
echo "   Launch from Applications or Spotlight"