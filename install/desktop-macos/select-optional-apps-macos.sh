#!/bin/zsh

# Load macOS functions for application organization
source ~/.local/share/omakub-macos/defaults/zsh/functions

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKUB_PATH/install/desktop-macos/optional/app-${app:l}-macos.sh"
		done
	fi
fi