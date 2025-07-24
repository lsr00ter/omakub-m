#!/bin/zsh

echo "Installing desktop applications and configuring macOS..."

# Configure macOS system preferences
source ~/.local/share/omakub-macos/install/desktop-macos/set-macos-preferences.sh

# Run desktop app installers
for installer in ~/.local/share/omakub-macos/install/desktop-macos/*.sh; do 
    if [[ -f "$installer" && "$(basename "$installer")" != "set-macos-preferences.sh" && "$(basename "$installer")" != "select-optional-apps-macos.sh" ]]; then
        echo "Running $(basename "$installer")..."
        source "$installer"
    fi
done

# Install optional apps if selected during first run
source ~/.local/share/omakub-macos/install/desktop-macos/select-optional-apps-macos.sh

echo "✓ Desktop installation completed"