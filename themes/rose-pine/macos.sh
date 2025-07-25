#!/bin/zsh
# macOS-specific theme settings for Rose Pine

# Get the theme directory using OMAKUB_PATH
THEME_DIR="$OMAKUB_PATH/themes/rose-pine"

# Set macOS system accent color to pink (matches Rose Pine theme)
defaults write NSGlobalDomain AppleAccentColor -int 6

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Rose Pine background
if [ -f "$THEME_DIR/background.jpg" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.jpg\""
    echo "Desktop wallpaper set to Rose Pine background"
else
    echo "Warning: Rose Pine background image not found at $THEME_DIR/background.jpg"
fi

echo "Rose Pine macOS theme applied successfully!"