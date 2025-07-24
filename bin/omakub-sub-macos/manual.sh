#!/bin/zsh

CHOICES=(
	"Manual        Show manual configuration options"
	"Web Apps      Install web applications as native apps"
	"Homebrew      Manage Homebrew packages and services"
	"Fonts         Install and manage programming fonts"
	"macOS Config  Configure macOS system preferences"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 10 --header "Manual configuration options")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't do anything
	echo ""
else
	case "$CHOICE" in
	"Web Apps"*)
		echo "=== Web App Installation ==="
		echo "Use the web2app function to create native macOS apps from web URLs:"
		echo ""
		echo "Examples:"
		echo "  web2app 'Gmail' 'https://mail.google.com' 'https://ssl.gstatic.com/ui/v1/icons/mail/images/favicon5.ico'"
		echo "  web2app 'Twitter' 'https://twitter.com' 'https://abs.twimg.com/icons/apple-touch-icon-192x192.png'"
		echo ""
		echo "Then use: app2dock 'AppName' to add to dock"
		;;
	"Homebrew"*)
		echo "=== Homebrew Management ==="
		echo "Useful Homebrew commands:"
		echo "  brew update              - Update Homebrew"
		echo "  brew upgrade             - Upgrade all packages"
		echo "  brew cleanup             - Clean up old versions"
		echo "  brew list                - List installed packages"
		echo "  brew search <name>       - Search for packages"
		echo "  brew info <name>         - Get package information"
		echo "  brew services list       - List services"
		echo "  brew services start <name> - Start a service"
		;;
	"Fonts"*)
		echo "=== Font Management ==="
		echo "Font locations on macOS:"
		echo "  ~/Library/Fonts/         - User fonts"
		echo "  /Library/Fonts/          - System fonts"
		echo ""
		echo "Use the omakub font command to install programming fonts"
		echo "Or manually install .ttf/.otf files by double-clicking"
		;;
	"macOS Config"*)
		echo "=== macOS Configuration ==="
		echo "System Preferences locations:"
		echo "  General → Appearance → Dark"
		echo "  Dock & Menu Bar → Automatically hide dock"
		echo "  Keyboard → Use F1, F2, etc. as standard function keys"
		echo ""
		echo "Command line configuration:"
		echo "  defaults write com.apple.dock autohide -bool true"
		echo "  defaults write NSGlobalDomain AppleInterfaceStyle Dark"
		echo "  killall Dock  # Restart dock to apply changes"
		;;
	*)
		echo "Manual configuration options selected: $CHOICE"
		;;
	esac
	
	echo ""
	echo "Press any key to continue..."
	read -k1
fi

source $OMAKUB_PATH/bin/omakub-sub-macos/menu.sh