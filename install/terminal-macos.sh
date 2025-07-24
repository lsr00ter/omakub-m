#!/bin/zsh

# Source the libraries first
source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install core development libraries
install_macos_libraries

echo "Installing terminal applications..."

# Run terminal app installers
for installer in ~/.local/share/omakub-macos/install/terminal-macos/*.sh; do
    if [[ -f "$installer" && "$(basename "$installer")" != "libraries-macos.sh" ]]; then
        echo "Running $(basename "$installer")..."
        source "$installer"
    fi
done

echo "✓ Terminal installation completed"
