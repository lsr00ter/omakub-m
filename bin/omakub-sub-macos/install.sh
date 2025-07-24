#!/bin/zsh

CHOICES=(
  "Dev Editor        Install alternative programming editors"
  "Dev Language      Install programming language environment"
  "Dev Database      Install development database in Docker"
  "1Password         Manage your passwords securely across devices"
  "Audacity          Record and edit audio"
  "Brave             Chrome-based browser with built-in ad blocking"
  "Cursor            AI-powered code editor"
  "Dropbox           Sync files across computers with ease"
  "GIMP              Image manipulation tool ala Photoshop"
  "Minecraft         Everyone's favorite blocky building game"
  "OBS Studio        Record screencasts with inputs from both display + webcam"
  "Ollama            Run LLMs, like Meta's Llama3, locally"
  "Parallels Desktop Run Windows and Linux VMs on Mac"
  "RetroArch         Play retro games"
  "RubyMine          JetBrains Ruby/Rails IDE"
  "Spotify           Stream music from the world's most popular service"
  "Steam             Play games from Valve's store"
  "VirtualBox        Virtual machines to run Windows/Linux"
  "Windsurf          AI-powered development environment"
  "Zed               High-performance code editor"
  "Zoom              Attend and host video chat meetings"
  "Web Apps          Install web apps with their own icon and shell"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 25 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $OMAKUB_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-editor") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub-macos/install-dev-editor.sh" ;;
  "web-apps") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/select-web-apps-macos.sh" ;;
  "dev-language") INSTALLER_FILE="$OMAKUB_PATH/install/terminal-macos/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$OMAKUB_PATH/install/terminal-macos/select-dev-storage.sh" ;;
  "ollama") INSTALLER_FILE="$OMAKUB_PATH/install/terminal-macos/optional/app-ollama.sh" ;;
  "1password") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-1password-macos.sh" ;;
  "parallels-desktop") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-parallels-macos.sh" ;;
  "rubymine") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-rubymine-macos.sh" ;;
  "cursor") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-cursor-macos.sh" ;;
  "windsurf") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-windsurf-macos.sh" ;;
  "zed") INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-zed-macos.sh" ;;
  *) INSTALLER_FILE="$OMAKUB_PATH/install/desktop-macos/optional/app-$INSTALLER-macos.sh" ;;
  esac

  if [ -f "$INSTALLER_FILE" ]; then
    source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
  else
    echo "Installer not found: $INSTALLER_FILE"
    echo "This application may not be available for macOS yet."
    sleep 2
  fi
fi

clear
source $OMAKUB_PATH/bin/omakub-macos