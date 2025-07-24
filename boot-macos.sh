#!/bin/zsh

set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
                    for macOS
'

echo -e "$ascii_art"
echo "=> Omakub for macOS - Designed for macOS 14+ (Sonoma) installations!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Check if Homebrew is installed, install if not
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Set up Homebrew environment based on architecture
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install git if not present
if ! command -v git &> /dev/null; then
    echo "Installing git..."
    brew install git
fi

echo "Cloning Omakub for macOS..."
rm -rf ~/.local/share/omakub-macos
mkdir -p ~/.local/share
git clone https://github.com/lsr00ter/omakub-m.git ~/.local/share/omakub-macos >/dev/null

# Note: For now using the Ubuntu repo, but this would be changed to omakub-macos repo when available
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub-macos
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub-macos/install-macos.sh
