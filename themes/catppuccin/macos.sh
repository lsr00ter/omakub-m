#!/bin/zsh
# macOS-specific theme settings for Catppuccin

# Set macOS system accent color to purple (matches Catppuccin)
defaults write NSGlobalDomain AppleAccentColor -int 5

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set reduce transparency for better readability
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "Catppuccin macOS theme applied successfully!"