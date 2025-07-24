#!/bin/zsh

function install_app_via_brew() {
    local app_name="$1"
    local cask_flag="$2"
    
    if [[ "$cask_flag" == "--cask" ]]; then
        echo "Installing $app_name via Homebrew Cask..."
        if brew install --cask "$app_name"; then
            echo "✓ Successfully installed $app_name"
        else
            echo "✗ Failed to install $app_name"
            return 1
        fi
    else
        echo "Installing $app_name via Homebrew..."
        if brew install "$app_name"; then
            echo "✓ Successfully installed $app_name"
        else
            echo "✗ Failed to install $app_name"
            return 1
        fi
    fi
}

function ensure_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Set up Homebrew environment
        if [[ $(uname -m) == "arm64" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    fi
    
    echo "Updating Homebrew..."
    brew update
}

function install_macos_libraries() {
    ensure_homebrew
    
    echo "Installing development libraries..."
    
    # Core build tools (equivalent to build-essential)
    brew install \
        autoconf \
        pkg-config \
        bison \
        llvm \
        cmake \
        make
        
    # SSL and crypto libraries
    brew install \
        openssl@3 \
        readline \
        zlib \
        libyaml \
        libffi
        
    # Database tools and libraries
    brew install \
        sqlite3 \
        mysql-client \
        postgresql@16 \
        redis
        
    # Image processing libraries (equivalent to libvips, imagemagick)
    brew install \
        vips \
        imagemagick
        
    # Additional development libraries
    brew install \
        libxml2 \
        libxslt \
        libiconv \
        zstd \
        lz4 \
        xz
        
    # Compression and archive tools
    brew install \
        gzip \
        bzip2 \
        unzip \
        zip
        
    # Version control and text processing
    brew install \
        git \
        curl \
        wget \
        jq \
        yq
        
    # Development utilities
    brew install \
        tree \
        ripgrep \
        fd \
        bat \
        eza \
        fzf \
        zoxide
        
    # Optional: Install Rust if not present (some tools depend on it)
    if ! command -v rustc &> /dev/null; then
        echo "Installing Rust toolchain..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
        
    echo "✓ Development libraries installed"
    echo ""
    echo "📝 Note: Some libraries may require additional configuration:"
    echo "   - OpenSSL: export PKG_CONFIG_PATH=\"\$HOMEBREW_PREFIX/opt/openssl@3/lib/pkgconfig\""
    echo "   - readline: export PKG_CONFIG_PATH=\"\$HOMEBREW_PREFIX/opt/readline/lib/pkgconfig:\$PKG_CONFIG_PATH\""
    echo "   - libffi: export PKG_CONFIG_PATH=\"\$HOMEBREW_PREFIX/opt/libffi/lib/pkgconfig:\$PKG_CONFIG_PATH\""
    echo "   - These are already handled in the zsh configuration"
}