#!/bin/zsh
# macOS-specific VSCode theme application

# Check if VSCode is installed and get the correct settings path
if command -v code &>/dev/null; then
    # macOS VSCode settings path
    VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
    
    if [ -n "$VSC_EXTENSION" ]; then
        echo "Installing VSCode extension: $VSC_EXTENSION"
        code --install-extension "$VSC_EXTENSION" >/dev/null 2>&1
    fi
    
    if [ -f "$VSCODE_SETTINGS" ] && [ -n "$VSC_THEME" ]; then
        echo "Applying VSCode theme: $VSC_THEME"
        # Create backup
        cp "$VSCODE_SETTINGS" "$VSCODE_SETTINGS.backup"
        
        # Update theme in settings.json
        sed -i '' "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" "$VSCODE_SETTINGS"
    elif [ -n "$VSC_THEME" ]; then
        echo "VSCode settings file not found. Please open VSCode first to create initial settings."
    fi
else
    echo "VSCode not found. Skipping VSCode theme application."
fi