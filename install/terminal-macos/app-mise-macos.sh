#!/bin/zsh

# Install mise for managing multiple versions of languages
# See https://mise.jdx.dev/
echo "Installing mise (development environment manager)..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install mise via Homebrew
install_app_via_brew "mise"

echo "✓ mise installed"
echo ""
echo "📝 mise setup:"
echo "   - mise manages multiple versions of languages (Node.js, Python, Ruby, etc.)"
echo "   - It's initialized in your zsh configuration"
echo "   - Use 'mise install node@latest' to install Node.js"
echo "   - Use 'mise install python@latest' to install Python"
echo "   - Use 'mise use node@20' to set Node.js 20 for current project"
echo ""
echo "📚 Common commands:"
echo "   - mise list-all node    # List available Node.js versions"
echo "   - mise install          # Install versions from .mise.toml"
echo "   - mise ls               # List installed versions"