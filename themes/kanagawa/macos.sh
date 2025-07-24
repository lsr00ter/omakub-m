#!/bin/zsh
# macOS-specific theme settings for Kanagawa

# Set macOS system accent color to blue (matches Kanagawa water theme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

echo "Kanagawa macOS theme applied successfully!"