#!/bin/zsh

set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	# Check if font is already installed (fast check in font directories)
	if ! find ~/Library/Fonts /Library/Fonts /System/Library/Fonts -name "*${font_name// }*" 2>/dev/null | head -1 | grep -q .; then
		cd /tmp
		curl -L -o "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"

		# Install to user fonts directory on macOS
		mkdir -p ~/Library/Fonts
		cp "$file_name"/*."$file_type" ~/Library/Fonts/

		rm -rf "$file_name.zip" "$file_name"
		cd -
		clear
		source $OMAKUB_PATH/ascii-macos.sh
		echo "Font '$font_name' installed successfully!"
	else
		echo "Font '$font_name' is already installed."
	fi

	# Update Alacritty font config (same structure as Ubuntu)
	mkdir -p ~/.config/alacritty
	cp "$OMAKUB_PATH/configs-macos/alacritty/fonts/$file_name.toml" ~/.config/alacritty/font.toml 2>/dev/null || {
		echo "Font config not found, using default Alacritty font configuration"
	}

	# Update VSCode font (macOS path is different)
	local vscode_settings="$HOME/Library/Application Support/Code/User/settings.json"
	if [ -f "$vscode_settings" ]; then
		sed -i '' "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" "$vscode_settings"
	fi

	echo "Font settings updated for Alacritty and VSCode"
}

if [ "$#" -gt 1 ]; then
	choice=${@[-1]}  # zsh syntax for last argument
else
	choice=$(gum choose "Cascadia Mono" "Fira Mono" "JetBrains Mono" "Meslo" "> Change size" "<< Back" --height 8 --header "Choose your programming font")
fi

case $choice in
"Cascadia Mono")
	set_font "CaskaydiaMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip" "ttf"
	;;
"Fira Mono")
	set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
	;;
"JetBrains Mono")
	set_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
	;;
"Meslo")
	set_font "MesloLGS Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" "ttf"
	;;
"> Change size")
	source $OMAKUB_PATH/bin/omakub-sub-macos/font-size.sh
	exit
	;;
esac

source $OMAKUB_PATH/bin/omakub-sub-macos/menu.sh
