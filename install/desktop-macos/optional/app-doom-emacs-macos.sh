#!/bin/zsh

# Install Doom Emacs for macOS
echo "Installing Doom Emacs..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install Emacs first
install_app_via_brew "emacs" "--cask"

# Clone Doom Emacs
if [ ! -d ~/.config/emacs ]; then
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install
fi

echo "✓ Doom Emacs installed"
echo "⚡ Modern Emacs configuration framework"
echo "   Run 'emacs' from terminal or launch from Applications"
echo "   Use '~/.config/emacs/bin/doom sync' to update"