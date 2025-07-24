#!/bin/zsh
# macOS-specific theme settings for Rose Pine

# Set macOS system accent color to pink (matches Rose Pine theme)
defaults write NSGlobalDomain AppleAccentColor -int 6

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

echo "Rose Pine macOS theme applied successfully!"