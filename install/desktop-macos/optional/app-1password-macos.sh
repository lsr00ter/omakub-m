#!/bin/zsh

# Install 1Password and 1Password CLI for macOS
echo "Installing 1Password and 1Password CLI..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install 1Password app
install_app_via_brew "1password" "--cask"

# Install 1Password CLI
install_app_via_brew "1password-cli" ""

echo "✓ 1Password and 1Password CLI installed"
echo "🔐 1Password is your password manager and secure vault"
echo "   Launch from Applications or use 'op' command in terminal"
echo ""
echo "💡 Setup instructions:"
echo "   1. Sign in to your 1Password account"
echo "   2. Enable CLI integration in 1Password app settings"
echo "   3. Use 'op signin' to authenticate CLI"