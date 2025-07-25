#!/bin/zsh

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omakub macOS installation failed! You can retry by running: source ~/.local/share/omakub-macos/install-macos.sh"' ERR

# Check the macOS version and set up environment
source ~/.local/share/omakub-macos/install/check-version-macos.sh

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omakub-macos/install/terminal-macos/required/app-gum-macos.sh >/dev/null
source ~/.local/share/omakub-macos/install/first-run-choices-macos.sh
source ~/.local/share/omakub-macos/install/identification-macos.sh

# Clean up default dock apps before installation
source ~/.local/share/omakub-macos/install/desktop-macos/cleanup-dock-macos.sh

# macOS always has a desktop environment, so we install both terminal and desktop tools
echo "Installing terminal and desktop tools for macOS..."

# Install terminal tools
source ~/.local/share/omakub-macos/install/terminal-macos.sh

# Install desktop tools and configure macOS preferences
source ~/.local/share/omakub-macos/install/desktop-macos.sh

echo "$(tput setaf 2)Installation completed successfully!"
echo "$(tput setaf 3)You may need to restart some applications for all changes to take effect."
echo "$(tput setaf 6)Run 'omakub-macos' to access post-installation configuration options."
