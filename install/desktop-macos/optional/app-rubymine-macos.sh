#!/bin/zsh

# Install RubyMine for macOS
echo "Installing RubyMine..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "rubymine" "--cask"

echo "✓ RubyMine installed"
echo "💎 Ruby and Rails IDE from JetBrains"
echo "   Launch from Applications"
echo "   Requires JetBrains account or license"