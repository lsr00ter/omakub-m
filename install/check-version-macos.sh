#!/bin/zsh

function check_macos_version() {
    local product_name=$(sw_vers -productName)
    local version=$(sw_vers -productVersion)
    local major_version=$(echo "$version" | cut -d. -f1)
    
    if [[ "$product_name" != "macOS" ]] || [[ "$major_version" -lt 14 ]]; then
        echo "$(tput setaf 1)Error: macOS 14+ (Sonoma) required"
        echo "Current: $product_name $version"
        echo "Installation stopped."
        exit 1
    fi
    
    # Detect architecture for Homebrew path
    local arch=$(uname -m)
    if [[ "$arch" == "arm64" ]]; then
        export HOMEBREW_PREFIX="/opt/homebrew"
        export OMAKUB_ARCH="arm64"
    else
        export HOMEBREW_PREFIX="/usr/local"
        export OMAKUB_ARCH="x86_64"
    fi
    
    echo "$(tput setaf 2)macOS $version detected on $arch architecture"
    echo "Homebrew prefix: $HOMEBREW_PREFIX"
}

# Run the check
check_macos_version