#!/bin/zsh
# macOS-specific theme settings for Tokyo Night

# Get the absolute path to this theme's directory
THEME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Set macOS system accent color to blue (closest to Tokyo Night theme)
defaults write NSGlobalDomain AppleAccentColor -int 4

# Set macOS to dark mode
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true"

# Set desktop wallpaper to Tokyo Night background
if [ -f "$THEME_DIR/background.jpg" ]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$THEME_DIR/background.jpg\""
    echo "Desktop wallpaper set to Tokyo Night background"
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