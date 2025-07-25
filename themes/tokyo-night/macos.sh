#!/bin/zsh
# macOS-specific theme settings for Tokyo Night

# Get the theme directory using OMAKUB_PATH
THEME_DIR="$OMAKUB_PATH/themes/tokyo-night"

# Set macOS system accent color to blue (closest to Tokyo Night theme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Tokyo Night background
if [ -f "$THEME_DIR/background.jpg" ]; then
    # Method 1: Try using System Events (more reliable)
    osascript -e "
    tell application \"System Events\"
        tell every desktop
            set picture to \"$THEME_DIR/background.jpg\"
        end tell
    end tell" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Desktop wallpaper set to Tokyo Night background"
    else
        # Method 2: Fallback to sqlite method for newer macOS versions
        sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$THEME_DIR/background.jpg'" 2>/dev/null && killall Dock
        if [ $? -eq 0 ]; then
            echo "Desktop wallpaper set to Tokyo Night background (via database method)"
        else
            echo "Warning: Could not set Tokyo Night wallpaper. You can set it manually in System Preferences > Desktop & Screen Saver"
        fi
    fi
else
    echo "Warning: Tokyo Night background image not found at $THEME_DIR/background.jpg"
fi

# Configure Terminal.app with Tokyo Night colors (if user prefers Terminal.app over Alacritty)
if [[ -n "$TOKYO_NIGHT_TERMINAL" ]]; then
    # Create Tokyo Night Terminal profile
    osascript <<EOF
tell application "Terminal"
    set mySettings to (make new settings set with properties {name:"Tokyo Night"})
    tell mySettings
        set background color to {6666, 6939, 9766} -- #1a1b26
        set normal text color to {43433, 45361, 54998} -- #a9b1d6
        set cursor color to {43433, 45361, 54998}
        set bold text color to {65535, 65535, 65535}
    end tell
    set default settings to mySettings
end tell
EOF
fi

echo "Tokyo Night macOS theme applied successfully!"