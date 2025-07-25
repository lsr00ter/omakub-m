#!/bin/zsh

# Load macOS functions for application organization
source ~/.local/share/omakub-macos/defaults/zsh/functions

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		# Convert to array and iterate properly
		local app_array
		IFS=$'\n' read -rd '' -A app_array <<< "$apps"
		
		for app in "${app_array[@]}"; do
			# Skip empty lines and trim whitespace
			app=$(echo "$app" | xargs)
			if [[ -n "$app" ]]; then
				echo "Installing optional app: $app"
				source "$OMAKUB_PATH/install/desktop-macos/optional/app-${app:l}-macos.sh"
			fi
		done
	fi
fi