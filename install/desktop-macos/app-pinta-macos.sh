#!/bin/zsh

# Install Pinta image editor for macOS (alternative to GIMP for simple editing)
echo "Installing Pinta image editor..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Pinta might not be available via Homebrew, so let's use an alternative
if brew search pinta &>/dev/null && brew search pinta | grep -q "^pinta$"; then
    install_app_via_brew "pinta" "--cask"
    echo "✓ Pinta installed"
else
    echo "Pinta not available via Homebrew, installing alternative..."
    # Install Krita as a more powerful alternative
    install_app_via_brew "krita" "--cask"
    echo "✓ Krita installed (alternative to Pinta)"
    echo "🎨 Krita is a professional painting and image editing application"
fi