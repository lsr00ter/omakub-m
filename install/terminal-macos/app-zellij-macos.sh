#!/bin/zsh

# Install Zellij terminal multiplexer for macOS
echo "Installing Zellij terminal multiplexer..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install zellij via Homebrew
install_app_via_brew "zellij"

# Set up Zellij configuration
mkdir -p ~/.config/zellij/themes

# Copy configuration files if available
if [[ -f ~/.local/share/omakub-macos/configs/zellij.kdl ]]; then
    cp ~/.local/share/omakub-macos/configs/zellij.kdl ~/.config/zellij/config.kdl
    echo "✓ Zellij configuration applied"
fi

# Copy theme if available
if [[ -f ~/.local/share/omakub-macos/themes/tokyo-night/zellij.kdl ]]; then
    cp ~/.local/share/omakub-macos/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
    echo "✓ Tokyo Night theme configured for Zellij"
fi

echo "✓ Zellij installed and configured"
echo ""
echo "📝 Zellij usage:"
echo "   - Run 'zellij' to start a new session"
echo "   - Ctrl+p then d to detach from session"
echo "   - zellij list-sessions to see active sessions"
echo "   - zellij attach <session-name> to reattach"