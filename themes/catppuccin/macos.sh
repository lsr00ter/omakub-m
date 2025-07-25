#!/bin/zsh
# macOS-specific theme settings for Catppuccin

# Get the theme directory using OMAKUB_PATH
THEME_DIR="$OMAKUB_PATH/themes/catppuccin"

# Set macOS system accent color to purple (matches Catppuccin)
defaults write NSGlobalDomain AppleAccentColor -int 5

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set reduce transparency for better readability
defaults write com.apple.universalaccess reduceTransparency -bool true

# Set desktop wallpaper to Catppuccin background
if [ -f "$THEME_DIR/background.png" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.png\""
    echo "Desktop wallpaper set to Catppuccin background"
else
    echo "Warning: Catppuccin background image not found at $THEME_DIR/background.png"
fi

echo "Catppuccin macOS theme applied successfully!"