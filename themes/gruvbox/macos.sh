#!/bin/zsh
# macOS-specific theme settings for Gruvbox

# Get the theme directory using OMAKUB_PATH
THEME_DIR="$OMAKUB_PATH/themes/gruvbox"

# Set macOS system accent color to orange (matches Gruvbox warm tones)
defaults write NSGlobalDomain AppleAccentColor -int 1

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Gruvbox background
if [ -f "$THEME_DIR/background.jpg" ]; then
    # Method 1: Try using System Events (more reliable)
    osascript -e "
    tell application \"System Events\"
        tell every desktop
            set picture to \"$THEME_DIR/background.jpg\"
        end tell
    end tell" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Desktop wallpaper set to Gruvbox background"
    else
        # Method 2: Fallback to sqlite method for newer macOS versions
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$THEME_DIR/background.jpg'" 2>/dev/null && killall Dock
        if [ $? -eq 0 ]; then
            echo "Desktop wallpaper set to Gruvbox background (via database method)"
        else
            echo "Warning: Could not set Gruvbox wallpaper. You can set it manually in System Preferences > Desktop & Screen Saver"
        fi
    fi
else
    echo "Warning: Gruvbox background image not found at $THEME_DIR/background.jpg"
fi

echo "Gruvbox macOS theme applied successfully!"