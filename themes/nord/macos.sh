#!/bin/zsh
# macOS-specific theme settings for Nord

# Get the absolute path to this theme's directory
THEME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set macOS system accent color to blue (matches Nord color scheme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Nord background
if [ -f "$THEME_DIR/background.png" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.png\""
    echo "Desktop wallpaper set to Nord background"
else
    echo "Warning: Nord background image not found at $THEME_DIR/background.png"
fi

echo "Nord macOS theme applied successfully!"