#!/bin/zsh

# Install LibreOffice for macOS
echo "Installing LibreOffice..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

echo "LibreOffice installation starting... This may take several minutes."
install_app_via_brew "libreoffice" "--cask"

echo "✓ LibreOffice installed"
echo "📄 LibreOffice provides compatibility with Word, Excel, and PowerPoint files"