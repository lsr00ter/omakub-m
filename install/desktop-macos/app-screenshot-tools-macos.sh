#!/bin/zsh

# Install screenshot and screen recording tools for macOS
# Alternative to Flameshot (Ubuntu) 
echo "Installing screenshot tools..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install CleanShot X alternative - Kap for screen recording
install_app_via_brew "kap" "--cask"

# Install Skitch for screenshot annotation
install_app_via_brew "skitch" "--cask" 2>/dev/null || echo "Skitch not available, using built-in tools"

echo "✓ Screenshot tools configured"
echo "📸 macOS built-in screenshot tools:"
echo "   - ⌘⇧3 : Full screen screenshot"
echo "   - ⌘⇧4 : Selection screenshot"
echo "   - ⌘⇧5 : Screenshot options menu"
echo "🎬 Kap provides advanced screen recording capabilities"