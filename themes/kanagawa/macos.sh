#!/bin/zsh
# macOS-specific theme settings for Kanagawa

# Get the theme directory using OMAKUB_PATH
THEME_DIR="$OMAKUB_PATH/themes/kanagawa"

# Set macOS system accent color to blue (matches Kanagawa water theme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Kanagawa background
if [ -f "$THEME_DIR/background.jpg" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.jpg\""
    echo "Desktop wallpaper set to Kanagawa background"
else
    echo "Warning: Kanagawa background image not found at $THEME_DIR/background.jpg"
fi

echo "Kanagawa macOS theme applied successfully!"