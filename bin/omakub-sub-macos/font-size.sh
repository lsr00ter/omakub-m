#!/bin/zsh

choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	# Update Alacritty font size (macOS uses same config structure)
	sed -i '' "s/^size = .*$/size = $choice/g" ~/.config/alacritty/font-size.toml
	source $OMAKUB_PATH/bin/omakub-sub-macos/font-size.sh
else
	source $OMAKUB_PATH/bin/omakub-sub-macos/font.sh
fi