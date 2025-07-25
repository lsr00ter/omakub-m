#!/bin/zsh

# Terminal applications installer for macOS
# Note: Core utilities (fzf, ripgrep, bat, eza, zoxide, fd, tree, jq, yq, curl, wget) 
# are installed via libraries-macos.sh which is sourced above

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

echo "Installing essential terminal applications..."

# Core terminal utilities (already installed via libraries-macos.sh)
# fzf, ripgrep, bat, eza, zoxide, fd are installed in libraries-macos.sh
install_app_via_brew "tldr"         # Simplified man pages (same name)

# macOS alternatives for Ubuntu-specific tools
# install_app_via_brew "mlocate"      # Alternative to plocate (or use built-in find)
install_app_via_brew "httpie"       # Alternative to apache2-utils for HTTP testing

# Additional useful terminal tools for macOS
# tree, jq, yq, curl, wget are already installed in libraries-macos.sh
install_app_via_brew "htop"         # Better top replacement

echo "✓ Terminal applications installed successfully"

# Configure fzf key bindings and completion
if command -v fzf &> /dev/null; then
    echo "Setting up fzf shell integration..."

    # fzf shell integration is handled in defaults/zsh/init
    # but we can run the install script to ensure it's set up
    if [[ -f "$HOMEBREW_PREFIX/opt/fzf/install" ]]; then
        yes | "$HOMEBREW_PREFIX/opt/fzf/install" --key-bindings --completion --no-update-rc
    fi
fi

# Note: locate database setup (alternative to plocate)
# macOS manages the locate database automatically via com.apple.locate.plist
# The system updates it periodically, so no manual setup is required
# if command -v locate &> /dev/null; then
#     echo "Setting up locate database..."
#     sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
# fi

echo "📝 Note: Some tools may need additional configuration:"
echo "   - fzf: Key bindings are configured in zsh init"
echo "   - zoxide: Will be initialized in shell configuration"
echo "   - bat: Consider setting BAT_THEME environment variable"
