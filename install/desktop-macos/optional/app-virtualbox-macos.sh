#!/bin/zsh

# Install VirtualBox for macOS
echo "Installing VirtualBox..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "virtualbox" "--cask"

# Extension pack available separately
install_app_via_brew "virtualbox-extension-pack" "--cask" 2>/dev/null || echo "Extension pack installation may require manual approval"

echo "✓ VirtualBox installed"
echo "💻 Run virtual machines for Linux, Windows, and other operating systems"
echo "   Launch from Applications"
echo ""
echo "⚠️  Note: macOS may require security approval for VirtualBox kernel extensions"
echo "   Go to System Preferences > Security & Privacy to allow if prompted"