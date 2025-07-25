#!/bin/zsh

# Terminal applications installer for macOS
# Equivalent to Ubuntu's: sudo apt install -y fzf ripgrep bat eza zoxide plocate apache2-utils fd-find tldr

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

echo "Installing essential terminal applications..."

# Core terminal utilities with Homebrew equivalents
install_app_via_brew "fzf"          # Fuzzy finder (same name)
install_app_via_brew "ripgrep"      # Fast grep replacement (same name)
install_app_via_brew "bat"          # Better cat with syntax highlighting (same name)
install_app_via_brew "eza"          # Better ls replacement (same name)
install_app_via_brew "zoxide"       # Smart cd replacement (same name)
install_app_via_brew "fd"           # Better find replacement (fd instead of fd-find)
install_app_via_brew "tldr"         # Simplified man pages (same name)

# macOS alternatives for Ubuntu-specific tools
# install_app_via_brew "mlocate"      # Alternative to plocate (or use built-in find)
install_app_via_brew "httpie"       # Alternative to apache2-utils for HTTP testing

# Additional useful terminal tools for macOS
install_app_via_brew "tree"         # Directory tree visualization
install_app_via_brew "htop"         # Better top replacement
install_app_via_brew "jq"           # JSON processor
install_app_via_brew "yq"           # YAML processor
install_app_via_brew "curl"         # HTTP client (usually pre-installed)
install_app_via_brew "wget"         # Download utility

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

# Set up locate database (alternative to plocate)
if command -v locate &> /dev/null; then
    echo "Setting up locate database..."
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
fi

echo "📝 Note: Some tools may need additional configuration:"
echo "   - fzf: Key bindings are configured in zsh init"
echo "   - zoxide: Will be initialized in shell configuration"
echo "   - bat: Consider setting BAT_THEME environment variable"
