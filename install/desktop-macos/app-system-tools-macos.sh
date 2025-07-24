#!/bin/zsh

# Install CleanMyMac X or alternative system cleaner
# Alternative to Ubuntu system maintenance tools
echo "Installing system maintenance tools..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install AppCleaner (free alternative to CleanMyMac)
install_app_via_brew "appcleaner" "--cask"

# Install DiskSight for disk usage analysis
install_app_via_brew "disk-utility" "--cask" 2>/dev/null || echo "Disk Utility already available via macOS"

echo "✓ System maintenance tools installed"
echo "🧹 AppCleaner helps completely remove applications and their files"
echo "💾 Use built-in Disk Utility for disk management"