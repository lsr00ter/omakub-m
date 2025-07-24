#!/bin/zsh

# Install Rectangle (window management for macOS)
# Alternative to GNOME's built-in window management
echo "Installing Rectangle window manager..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "rectangle" "--cask"

echo "✓ Rectangle installed"
echo "🪟 Rectangle provides advanced window management with keyboard shortcuts"
echo "   Access via menu bar or use keyboard shortcuts:"
echo "   - ⌘⌃← : Left half"
echo "   - ⌘⌃→ : Right half"  
echo "   - ⌘⌃↑ : Maximize"
echo "   - ⌘⌃↓ : Restore"