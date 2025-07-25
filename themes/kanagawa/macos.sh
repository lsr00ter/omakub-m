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
    # Method 1: Try using System Events (more reliable)
    osascript -e "
    tell application \"System Events\"
        tell every desktop
            set picture to \"$THEME_DIR/background.jpg\"
        end tell
    end tell" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Desktop wallpaper set to Kanagawa background"
    else
        # Method 2: Fallback to sqlite method for newer macOS versions
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$THEME_DIR/background.jpg'" 2>/dev/null && killall Dock
        if [ $? -eq 0 ]; then
            echo "Desktop wallpaper set to Kanagawa background (via database method)"
        else
            echo "Warning: Could not set Kanagawa wallpaper. You can set it manually in System Preferences > Desktop & Screen Saver"
        fi
    fi
else
    echo "Warning: Kanagawa background image not found at $THEME_DIR/background.jpg"
fi

echo "Kanagawa macOS theme applied successfully!"