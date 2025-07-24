#!/bin/zsh

# Install Parallels Desktop for macOS
echo "Installing Parallels Desktop..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "parallels" "--cask"

echo "✓ Parallels Desktop installed"
echo "💻 Professional virtualization software for macOS"
echo "   Best performance for running Windows, Linux, and other operating systems"
echo "   Launch from Applications"
echo ""
echo "💡 Setup tips:"
echo "   - Requires license purchase or subscription"
echo "   - Offers excellent macOS integration and performance"
echo "   - Supports Apple Silicon and Intel Macs"
echo "   - Can import existing VM files from other platforms"