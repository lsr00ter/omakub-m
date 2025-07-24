#!/bin/zsh

# Install Neovim for macOS
echo "Installing Neovim..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install neovim and dependencies
brew install neovim
brew install luarocks tree-sitter

# LazyVim setup (same as Ubuntu)
if [ ! -d "$HOME/.config/nvim" ]; then
    echo "Setting up LazyVim configuration..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
    
    # Copy theme and configs (these would need to be created)
    mkdir -p ~/.config/nvim/plugin/after
    if [[ -f ~/.local/share/omakub-macos/configs-macos/neovim/transparency.lua ]]; then
        cp ~/.local/share/omakub-macos/configs-macos/neovim/transparency.lua ~/.config/nvim/plugin/after/
    fi
    
    if [[ -f ~/.local/share/omakub-macos/themes/tokyo-night/neovim.lua ]]; then
        cp ~/.local/share/omakub-macos/themes/tokyo-night/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
    fi
    
    # Turn off relative line numbers
    echo "vim.opt.relativenumber = false" >> ~/.config/nvim/lua/config/options.lua
fi

echo "✓ Neovim installed and configured"