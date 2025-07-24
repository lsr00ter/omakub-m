#!/bin/zsh

THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  # Create necessary config directories
  mkdir -p ~/.config/alacritty ~/.config/zellij/themes ~/.config/nvim/lua/plugins ~/.config/btop/themes
  
  # Copy Alacritty theme (macOS uses same config structure)
  cp $OMAKUB_PATH/themes/$THEME/alacritty.toml ~/.config/alacritty/theme.toml
  
  # Copy Zellij theme (terminal multiplexer - same across platforms)
  cp $OMAKUB_PATH/themes/$THEME/zellij.kdl ~/.config/zellij/themes/$THEME.kdl
  sed -i '' "s/theme \".*\"/theme \"$THEME\"/g" ~/.config/zellij/config.kdl 2>/dev/null || true
  
  # Copy Neovim theme (same across platforms)
  cp $OMAKUB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  # Copy btop theme (system monitor - same config)
  if [ -f "$OMAKUB_PATH/themes/$THEME/btop.theme" ]; then
    cp $OMAKUB_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i '' "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i '' "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi

  # Apply macOS-specific theme scripts
  if [ -f "$OMAKUB_PATH/themes/$THEME/macos.sh" ]; then
    source $OMAKUB_PATH/themes/$THEME/macos.sh
  fi
  
  # Apply VSCode theme (works on macOS)
  source $OMAKUB_PATH/themes/$THEME/vscode.sh

  # Note: Skip GNOME theming (not applicable to macOS)
  # Note: Skip tophat theming (Linux-specific system monitor)
  
  echo "Theme '$THEME' applied successfully!"
  echo "Note: Some changes may require restarting applications."
fi

source $OMAKUB_PATH/bin/omakub-sub-macos/menu.sh