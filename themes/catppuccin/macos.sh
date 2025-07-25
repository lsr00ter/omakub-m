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
    # Method 1: Try using System Events (more reliable)
    osascript -e "
    tell application \"System Events\"
        tell every desktop
            set picture to \"$THEME_DIR/background.png\"
        end tell
    end tell" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Desktop wallpaper set to Catppuccin background"
    else
        # Method 2: Fallback to sqlite method for newer macOS versions
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$THEME_DIR/background.png'" 2>/dev/null && killall Dock
        if [ $? -eq 0 ]; then
            echo "Desktop wallpaper set to Catppuccin background (via database method)"
        else
            echo "Warning: Could not set Catppuccin wallpaper. You can set it manually in System Preferences > Desktop & Screen Saver"
        fi
    fi
else
    echo "Warning: Catppuccin background image not found at $THEME_DIR/background.png"
fi

echo "Catppuccin macOS theme applied successfully!"