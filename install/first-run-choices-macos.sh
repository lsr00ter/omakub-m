#!/bin/zsh

# macOS-specific optional apps (different from Ubuntu GNOME apps)
OPTIONAL_APPS=("1password" "Spotify" "Zoom" "Dropbox" "Rectangle" "Alfred" "iTerm2")
DEFAULT_OPTIONAL_APPS='1password,Spotify,Rectangle'
export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 8 --header "Select optional macOS apps")

# Programming languages (same as Ubuntu)
AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

# Databases (same as Ubuntu, will run in Docker)
AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="MySQL"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")

# macOS-specific terminal choice
TERMINAL_CHOICES=("Alacritty" "iTerm2" "Terminal.app")
DEFAULT_TERMINAL="Alacritty"
export OMAKUB_TERMINAL_CHOICE=$(gum choose "${TERMINAL_CHOICES[@]}" --selected "$DEFAULT_TERMINAL" --height 4 --header "Select your preferred terminal")

echo "Configuration choices saved:"
echo "Optional apps: $OMAKUB_FIRST_RUN_OPTIONAL_APPS"
echo "Languages: $OMAKUB_FIRST_RUN_LANGUAGES"
echo "Databases: $OMAKUB_FIRST_RUN_DBS"
echo "Terminal: $OMAKUB_TERMINAL_CHOICE"
