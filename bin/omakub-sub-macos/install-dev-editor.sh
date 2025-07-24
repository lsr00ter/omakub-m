#!/bin/zsh

EDITORS=(
  "Cursor        AI-powered code editor by Anysphere"
  "Zed           High-performance editor by Zed Industries"
  "Windsurf      AI development environment"
  "RubyMine      JetBrains Ruby/Rails IDE"
  "WebStorm      JetBrains JavaScript/TypeScript IDE"
  "IntelliJ      JetBrains Java IDE"
  "<< Back       "
)

CHOICE=$(gum choose "${EDITORS[@]}" --height 10 --header "Choose development editor to install")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  EDITOR=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]')

  case "$EDITOR" in
  "cursor") 
    echo "Installing Cursor..."
    brew install --cask cursor
    ;;
  "zed")
    echo "Installing Zed..."
    brew install --cask zed
    ;;
  "windsurf")
    echo "Installing Windsurf..."
    brew install --cask windsurf
    ;;
  "rubymine")
    echo "Installing RubyMine..."
    brew install --cask rubymine
    ;;
  "webstorm")
    echo "Installing WebStorm..."
    brew install --cask webstorm
    ;;
  "intellij")
    echo "Installing IntelliJ IDEA..."
    brew install --cask intellij-idea
    ;;
  esac
  
  echo "$EDITOR installation completed!"
fi

source $OMAKUB_PATH/bin/omakub-sub-macos/menu.sh