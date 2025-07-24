#!/bin/zsh

CHOICES=(
	"Omakub        Update Omakub itself and run any migrations"
	"Homebrew      Update Homebrew and all installed packages"
	"Ollama        Run LLMs, like Meta's Llama3, locally"
	"LazyGit       TUI for Git"
	"LazyDocker    TUI for Docker"
	"Neovim        Text editor that runs in the terminal"
	"Zellij        Adds panes, tabs, and sessions to the terminal"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Update manually-managed applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$INSTALLER" in
	"omakub") INSTALLER_FILE="$OMAKUB_PATH/bin/omakub-sub-macos/migrate.sh" ;;
	"homebrew") 
		echo "Updating Homebrew..."
		brew update && brew upgrade && brew cleanup
		gum spin --spinner globe --title "Homebrew update completed!" -- sleep 3
		;;
	"ollama") INSTALLER_FILE="$OMAKUB_PATH/install/terminal-macos/optional/app-ollama.sh" ;;
	*) INSTALLER_FILE="$OMAKUB_PATH/install/terminal-macos/app-$INSTALLER-macos.sh" ;;
	esac

	if [ -n "$INSTALLER_FILE" ] && [ -f "$INSTALLER_FILE" ]; then
		source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
	fi
fi

clear
source $OMAKUB_PATH/bin/omakub-macos