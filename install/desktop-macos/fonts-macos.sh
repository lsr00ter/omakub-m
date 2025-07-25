#!/bin/zsh

# Install fonts for macOS
echo "Installing programming fonts..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install popular programming fonts directly (no tap needed)
install_app_via_brew "font-fira-code" "--cask"
install_app_via_brew "font-cascadia-mono" "--cask"  
install_app_via_brew "font-jetbrains-mono" "--cask"
install_app_via_brew "font-meslo-lg-nerd-font" "--cask"

# Install some additional useful fonts
install_app_via_brew "font-source-code-pro" "--cask"
install_app_via_brew "font-hack" "--cask"

echo "✓ Programming fonts installed"
echo "🔤 Installed fonts:"
echo "   - Fira Code (with ligatures)"
echo "   - Cascadia Mono (Microsoft)"
echo "   - JetBrains Mono"
echo "   - MesloLGS Nerd Font (with icons)"
echo "   - Source Code Pro"
echo "   - Hack"
echo ""
echo "These fonts are now available in all applications"
echo "Recommended for terminal: CaskaydiaMono Nerd Font or JetBrains Mono"