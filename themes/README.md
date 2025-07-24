# Theme Structure Documentation

## Overview

The themes folder contains theme configurations for both Ubuntu and macOS platforms. Each theme supports multiple applications with platform-specific implementations.

## Theme Directory Structure

Each theme directory (e.g., `themes/tokyo-night/`) contains:

### Cross-Platform Files

- `alacritty.toml` - Terminal emulator theme
- `zellij.kdl` - Terminal multiplexer theme
- `neovim.lua` - Text editor theme
- `btop.theme` - System monitor theme
- `background.jpg/png` - Desktop wallpaper

### Ubuntu-Specific Files (Ubuntu/Linux only)

- `gnome.sh` - GNOME desktop theming (gsettings, wallpapers, etc.)
- `tophat.sh` - tophat GNOME extension theming
- `chrome.sh` - Chrome browser theming (Linux approach)
- `vscode.sh` - VSCode theming (uses Linux paths)

### macOS-Specific Files (macOS only)

- `macos.sh` - macOS system integration (accent colors, dark mode)
- `vscode-macos.sh` - VSCode theming (uses macOS paths)

### Utility Scripts (Platform-specific)

- `set-gnome-theme.sh` - Ubuntu GNOME theme utility
- `set-chrome-theme.sh` - Ubuntu Chrome theme utility
- `set-vscode-theme.sh` - Ubuntu VSCode theme utility
- `set-vscode-theme-macos.sh` - macOS VSCode theme utility

## Platform Handling

### Ubuntu Version (`bin/omakub-sub/theme.sh`)

- Uses all theme files including Ubuntu-specific scripts
- Sources `gnome.sh`, `tophat.sh`, `chrome.sh`, `vscode.sh`

### macOS Version (`bin/omakub-sub-macos/theme.sh`)

- Uses cross-platform files (alacritty, zellij, neovim, btop)
- Uses macOS-specific files (`macos.sh`, `vscode-macos.sh`)
- **Intentionally skips** Ubuntu-specific files:
  - `gnome.sh` - GNOME not available on macOS
  - `tophat.sh` - Linux-specific GNOME extension
  - `chrome.sh` - Uses Linux-specific approaches
  - `vscode.sh` - Uses incorrect paths for macOS

## Supported Themes

All 7 themes support complete theming for both platforms:

1. **tokyo-night** - Dark theme with purple accents
2. **catppuccin** - Pastel theme with multiple variants
3. **nord** - Arctic-inspired blue theme
4. **everforest** - Nature-inspired green theme
5. **gruvbox** - Retro warm color scheme
6. **kanagawa** - Japanese-inspired blue theme
7. **rose-pine** - Elegant pink/rose theme

## Applications Themed

### Terminal Applications (Both Platforms)

- **Alacritty** - Terminal emulator
- **Zellij** - Terminal multiplexer
- **Neovim** - Text editor
- **btop** - System monitor
- **VSCode** - Code editor

### Desktop Integration

- **Ubuntu**: GNOME desktop, wallpapers, system colors
- **macOS**: System accent colors, dark mode, preferences

## Usage

### Ubuntu

```bash
omakub theme
```

### macOS

```bash
omakub-macos theme
```

Both commands provide the same theme selection but apply platform-appropriate configurations.
