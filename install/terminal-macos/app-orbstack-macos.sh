#!/bin/zsh

# Install OrbStack instead of Docker Desktop for macOS
# OrbStack is faster and more efficient than Docker Desktop on macOS
echo "Installing OrbStack (Docker alternative for macOS)..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

# Install OrbStack via Homebrew Cask
install_app_via_brew "orbstack" "--cask"

echo "✓ OrbStack installed"
echo ""
echo "📝 OrbStack setup:"
echo "   - OrbStack provides Docker and Linux machines for macOS"
echo "   - It's faster and more efficient than Docker Desktop"
echo "   - The docker CLI will be available after OrbStack starts"
echo "   - Start OrbStack from Applications or run 'open -a OrbStack'"
echo ""
echo "⚠️  Note: You may need to restart your terminal after OrbStack starts"
echo "   to use the docker command."