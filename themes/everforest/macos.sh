#!/bin/zsh
# macOS-specific theme settings for Everforest

# Set macOS system accent color to green (matches Everforest nature theme)
defaults write NSGlobalDomain AppleAccentColor -int 3

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

echo "Everforest macOS theme applied successfully!"