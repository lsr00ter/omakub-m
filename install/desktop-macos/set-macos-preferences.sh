#!/bin/zsh

function configure_macos_settings() {
    echo "Configuring macOS system preferences..."

    # Set dark mode
    osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to true" 2>/dev/null || true

    # Configure dock
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock orientation left
    defaults write com.apple.dock magnification -bool true
    defaults write com.apple.dock tilesize -int 36
    defaults write com.apple.dock largesize -int 48
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -int 0

    # Configure finder
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
    defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

    # Configure keyboard
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15

    # Configure trackpad
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Configure screenshots
    defaults write com.apple.screencapture location -string "$HOME/Desktop"
    defaults write com.apple.screencapture type -string "png"

    # Configure Safari show full URL
    defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"

    echo "✓ macOS system preferences configured"
}

function set_macos_theme() {
    local theme_color="${1:-blue}"

    echo "Setting macOS theme color to $theme_color..."

    # Set accent color
    case "$theme_color" in
        "blue") defaults write NSGlobalDomain AppleAccentColor -int 4 ;;
        "purple") defaults write NSGlobalDomain AppleAccentColor -int 5 ;;
        "pink") defaults write NSGlobalDomain AppleAccentColor -int 6 ;;
        "red") defaults write NSGlobalDomain AppleAccentColor -int 0 ;;
        "orange") defaults write NSGlobalDomain AppleAccentColor -int 1 ;;
        "yellow") defaults write NSGlobalDomain AppleAccentColor -int 2 ;;
        "green") defaults write NSGlobalDomain AppleAccentColor -int 3 ;;
        *) defaults write NSGlobalDomain AppleAccentColor -int 4 ;;
    esac

    echo "✓ Theme color set to $theme_color"
}

function restart_affected_apps() {
    echo "Restarting affected applications..."

    # Restart Dock and Finder
    killall Dock 2>/dev/null || true
    killall Finder 2>/dev/null || true
    killall SystemUIServer 2>/dev/null || true

    echo "✓ Applications restarted"
}

# Run the configuration
configure_macos_settings
set_macos_theme "${OMAKUB_THEME_COLOR:-blue}"
restart_affected_apps
