#!/bin/zsh
# macOS-specific theme settings for Gruvbox

# Set macOS system accent color to orange (matches Gruvbox warm tones)
defaults write NSGlobalDomain AppleAccentColor -int 1

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

echo "Gruvbox macOS theme applied successfully!"