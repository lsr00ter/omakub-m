#!/bin/zsh

# Install VSCode for macOS
echo "Installing Visual Studio Code..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

install_app_via_brew "visual-studio-code" "--cask"

# Set up VSCode configuration
function setup_vscode_config_macos() {
    local vscode_dir="$HOME/Library/Application Support/Code/User"
    mkdir -p "$vscode_dir"
    
    # Copy settings if available
    if [[ -f ~/.local/share/omakub-macos/configs-macos/vscode.json ]]; then
        cp ~/.local/share/omakub-macos/configs-macos/vscode.json "$vscode_dir/settings.json"
        echo "✓ VSCode settings configured"
    fi
}

setup_vscode_config_macos

# Install default supported themes
if command -v code &> /dev/null; then
    code --install-extension enkia.tokyo-night
    echo "✓ Tokyo Night theme installed"
fi

echo "✓ Visual Studio Code installed and configured"