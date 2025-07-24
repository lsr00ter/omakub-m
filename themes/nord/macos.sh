#!/bin/zsh
# macOS-specific theme settings for Nord

# Set macOS system accent color to blue (matches Nord color scheme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

echo "Nord macOS theme applied successfully!"