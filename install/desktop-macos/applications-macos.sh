#!/bin/zsh

# macOS equivalent of organizing applications into Dock or Launchpad folders
# On macOS, we create application shortcuts and organize them for easy access

echo "Setting up application organization for macOS..."

# Create application directories
mkdir -p ~/.local/share/omakub-macos/applications/icons
mkdir -p ~/.local/share/omakub-macos/applications/shortcuts

# Create web app function for macOS (equivalent to web2app)
web2app_macos() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: web2app_macos <AppName> <AppURL> <IconURL>"
    return 1
  fi

  local APP_NAME="$1"
  local APP_URL="$2" 
  local ICON_URL="$3"
  local ICON_DIR="$HOME/.local/share/omakub-macos/applications/icons"
  local APP_DIR="/Applications"
  local ICON_PATH="${ICON_DIR}/${APP_NAME}.png"

  mkdir -p "$ICON_DIR"

  # Download icon
  if ! curl -sL -o "$ICON_PATH" "$ICON_URL"; then
    echo "Error: Failed to download icon for $APP_NAME"
    return 1
  fi

  # Create web app using Safari or Chrome
  if command -v chrome >/dev/null 2>&1 || [ -d "/Applications/Google Chrome.app" ]; then
    # Use Chrome to create web app
    osascript <<EOF
tell application "Google Chrome"
    make new window
    set URL of active tab of front window to "$APP_URL"
end tell
EOF
    echo "✓ Created Chrome web app for $APP_NAME"
    echo "  Use Chrome > More Tools > Create Shortcut to add to Applications"
  else
    # Use Safari fallback
    echo "💡 To create $APP_NAME web app:"
    echo "  1. Open Safari and go to $APP_URL"
    echo "  2. File > Add to Dock"
    echo "  3. Choose 'Add to Applications folder'"
  fi
}

# Add app to macOS Dock (equivalent to app2folder for GNOME)
app2dock_macos() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: app2dock_macos <AppName.app>"
    return 1
  fi

  local APP_NAME="$1"
  local APP_PATH="/Applications/$APP_NAME"

  if [ -d "$APP_PATH" ]; then
    # Add to Dock using defaults
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$APP_PATH</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    killall Dock
    echo "✓ Added $APP_NAME to Dock"
  else
    echo "❌ Application $APP_PATH not found"
  fi
}

# Create Launchpad folder (similar to GNOME app folders)
create_launchpad_folder() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: create_launchpad_folder <FolderName>"
    return 1
  fi

  local FOLDER_NAME="$1"
  echo "💡 To create '$FOLDER_NAME' folder in Launchpad:"
  echo "  1. Open Launchpad (F4 or four-finger pinch)"
  echo "  2. Drag one app onto another to create a folder"
  echo "  3. Click the folder name to rename it to '$FOLDER_NAME'"
}

echo "✓ Application organization functions loaded"
echo "📱 Available functions:"
echo "   - web2app_macos <AppName> <URL> <IconURL>"
echo "   - app2dock_macos <AppName.app>"
echo "   - create_launchpad_folder <FolderName>"