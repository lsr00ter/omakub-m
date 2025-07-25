#!/bin/zsh

function cleanup_macos_dock() {
    echo "Cleaning up default macOS dock applications..."

    # Applications to remove from dock
    local unwanted_apps=(
        "Messages"
        "Maps"
        "Photos"
        "FaceTime"
        "Contacts"
        "Freeform"
        "TV"
        "Music"
        "App Store"
    )

    # Get current dock persistent-apps
    local dock_apps=$(defaults read com.apple.dock persistent-apps 2>/dev/null || echo "")

    if [[ -z "$dock_apps" ]]; then
        echo "✓ Dock persistent-apps is empty, nothing to remove"
        return
    fi

    # Remove each unwanted app from dock
    for app in "${unwanted_apps[@]}"; do
        echo "  Removing $app from dock..."

        # Use dockutil if available, otherwise use defaults
        if command -v dockutil &> /dev/null; then
            # Get the actual user who owns the dock
            local dock_user="${SUDO_USER:-$(whoami)}"

            # Run dockutil as the dock owner to avoid permission issues
            if [[ "$dock_user" != "$(whoami)" ]] && [[ -n "$SUDO_USER" ]]; then
                # Running with sudo, switch to the actual user
                sudo -u "$dock_user" dockutil --remove "$app" --no-restart 2>/dev/null || echo "    $app not found in dock"
            else
                # Running as the correct user already
                dockutil --remove "$app" --no-restart 2>/dev/null || echo "    $app not found in dock"
            fi
        else
            # Fallback: remove using defaults (more complex but works without dockutil)
            remove_app_from_dock_defaults "$app"
        fi
    done

    echo "✓ Removed unwanted apps from dock"
}

function remove_app_from_dock_defaults() {
    local app_name="$1"

    # This is a complex operation with defaults, so we'll use dockutil installation
    # if it's not available
    if ! command -v dockutil &> /dev/null; then
        install_dockutil
        dockutil --remove "$app_name" --no-restart 2>/dev/null || echo "    $app_name not found in dock"
    fi
}

function install_dockutil() {
    echo "  Installing dockutil for dock management..."

    # Check if Homebrew is available
    if command -v brew &> /dev/null; then
        brew install dockutil 2>/dev/null || {
            echo "    Failed to install dockutil via Homebrew, using manual method"
            install_dockutil_manual
        }
    else
        install_dockutil_manual
    fi
}

function install_dockutil_manual() {
    # Download and install dockutil manually
    local temp_dir=$(mktemp -d)
    cd "$temp_dir"

    curl -L "https://github.com/kcrawford/dockutil/releases/latest/download/dockutil-3.0.2.pkg" -o dockutil.pkg 2>/dev/null || {
        echo "    Failed to download dockutil, skipping dock cleanup"
        cd - >/dev/null
        return 1
    }

    sudo installer -pkg dockutil.pkg -target / >/dev/null 2>&1 || {
        echo "    Failed to install dockutil, skipping dock cleanup"
        cd - >/dev/null
        return 1
    }

    cd - >/dev/null
    rm -rf "$temp_dir"
    echo "    ✓ dockutil installed"
}

function restart_dock() {
    echo "Restarting Dock to apply changes..."

    # Get the actual user who owns the dock
    local dock_user="${SUDO_USER:-$(whoami)}"

    # Restart dock as the dock owner
    if [[ "$dock_user" != "$(whoami)" ]] && [[ -n "$SUDO_USER" ]]; then
        # Running with sudo, restart dock as the actual user
        sudo -u "$dock_user" killall Dock 2>/dev/null || true
    else
        # Running as the correct user already
        killall Dock 2>/dev/null || true
    fi

    echo "✓ Dock restarted"
}

# Run the dock cleanup
cleanup_macos_dock
restart_dock
