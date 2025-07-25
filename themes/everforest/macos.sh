#!/bin/zsh
# macOS-specific theme settings for Everforest

# Get the absolute path to this theme's directory
THEME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set macOS system accent color to green (matches Everforest nature theme)
defaults write NSGlobalDomain AppleAccentColor -int 3

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Everforest background
if [ -f "$THEME_DIR/background.jpg" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.jpg\""
    echo "Desktop wallpaper set to Everforest background"
else
    echo "Warning: Everforest background image not found at $THEME_DIR/background.jpg"
fi

echo "Everforest macOS theme applied successfully!"