#!/bin/zsh

# Install Typora markdown editor for macOS
echo "Installing Typora..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "typora" "--cask"

# Set up Typora themes if available
if [[ -d ~/.local/share/omakub-macos/configs/typora ]]; then
    echo "Setting up Typora themes..."
    
    # macOS Typora themes directory
    TYPORA_THEMES_DIR="$HOME/Library/Application Support/abnerworks.Typora/themes"
    mkdir -p "$TYPORA_THEMES_DIR"
    
    # Copy theme files
    if [[ -f ~/.local/share/omakub-macos/configs/typora/ia_typora.css ]]; then
        cp ~/.local/share/omakub-macos/configs/typora/ia_typora.css "$TYPORA_THEMES_DIR/"
    fi
    
    if [[ -f ~/.local/share/omakub-macos/configs/typora/ia_typora_night.css ]]; then
        cp ~/.local/share/omakub-macos/configs/typora/ia_typora_night.css "$TYPORA_THEMES_DIR/"
    fi
    
    echo "✓ Typora themes configured"
fi

echo "✓ Typora installed"
echo "✏️  Typora is a markdown editor with live preview"