# Omakub for macOS

This is the macOS adaptation of Omakub - a shell script-based setup tool that transforms a fresh macOS installation into a fully-configured development environment.

## Quick Start

```bash
# Bootstrap installation
zsh <(curl -s https://raw.githubusercontent.com/your-repo/omakub-macos/main/boot-macos.sh)

# Or clone and run locally
git clone https://github.com/your-repo/omakub-macos.git
cd omakub-macos
./boot-macos.sh
```

## Requirements

- macOS 14+ (Sonoma or later)
- Intel or Apple Silicon Mac
- Internet connection
- Administrator privileges

## What Gets Installed

### Core Infrastructure
- **Homebrew** - Package manager for macOS
- **Git** - Version control
- **gum** - Interactive prompts

### Terminal Applications
- **Neovim** - Modern vim-based editor with LazyVim
- **Alacritty** - GPU-accelerated terminal emulator
- **btop** - System monitor
- **fastfetch** - System information tool

### Desktop Applications
- **Google Chrome** - Web browser
- **Visual Studio Code** - Code editor
- **Optional apps**: 1Password, Spotify, Zoom, Dropbox, Rectangle, Alfred, iTerm2

### Development Tools
- **Programming Languages**: Ruby on Rails, Node.js, Go, PHP, Python, Elixir, Rust, Java
- **Databases**: MySQL, Redis, PostgreSQL (via Docker)
- **Development libraries**: autoconf, pkg-config, openssl, readline, etc.

### macOS Configurations
- Dark mode enabled
- Dock auto-hide and magnification
- Finder path bar and status bar
- Improved keyboard repeat rates
- Trackpad tap-to-click
- Screenshot settings

## Architecture

### Core Scripts
- `boot-macos.sh` - Entry point that sets up Homebrew and clones the repo
- `install-macos.sh` - Main orchestrator handling the full installation
- `install/check-version-macos.sh` - Validates macOS version and architecture
- `test-macos.sh` - Testing script for development

### Installation Framework
- `install/terminal-macos.sh` - Orchestrates terminal application installation
- `install/desktop-macos.sh` - Orchestrates desktop application installation
- `install/terminal-macos/*.sh` - Individual terminal app installers
- `install/desktop-macos/*.sh` - Individual desktop app installers

### Configuration Management
- `configs/` - Template configuration files
- `install/first-run-choices-macos.sh` - User preference collection
- `install/identification-macos.sh` - Git user setup
- `install/desktop-macos/set-macos-preferences.sh` - System preferences

### Key Differences from Ubuntu Version

| Component | Ubuntu | macOS |
|-----------|--------|-------|
| Package Manager | APT (`sudo apt install`) | Homebrew (`brew install`) |
| Desktop Apps | Flatpak | Homebrew Cask |
| System Config | gsettings (GNOME) | defaults write + osascript |
| Shell | Bash | Zsh |
| User Info | getent | dscl |
| Paths | `~/.config/` | `~/Library/Application Support/` |

## Development

### File Structure
```
omakub-macos/
├── boot-macos.sh                              # Entry point
├── install-macos.sh                           # Main installer
├── test-macos.sh                              # Test runner
├── configs/
│   └── alacritty.toml                         # Terminal config
├── install/
│   ├── check-version-macos.sh                 # System validation
│   ├── first-run-choices-macos.sh             # User preferences
│   ├── identification-macos.sh                # Git setup
│   ├── terminal-macos.sh                      # Terminal orchestrator
│   ├── desktop-macos.sh                       # Desktop orchestrator
│   ├── terminal/
│   │   ├── libraries-macos.sh                 # Homebrew functions
│   │   └── required/
│   │       └── app-gum-macos.sh               # gum installer
│   ├── terminal-macos/
│   │   ├── app-alacritty-macos.sh            # Terminal emulator
│   │   ├── app-neovim-macos.sh               # Text editor
│   │   ├── app-btop-macos.sh                 # System monitor
│   │   └── app-fastfetch-macos.sh            # System info
│   └── desktop-macos/
│       ├── set-macos-preferences.sh           # System config
│       ├── app-chrome-macos.sh                # Web browser
│       └── app-vscode-macos.sh                # Code editor
└── CLAUDE.md                                  # Developer documentation
```

### Adding New Applications

1. **Terminal Applications**: Create `install/terminal-macos/app-{name}-macos.sh`
2. **Desktop Applications**: Create `install/desktop-macos/app-{name}-macos.sh`
3. **Use the standard pattern**:
   ```bash
   #!/bin/zsh
   source ~/.local/share/omakub-macos/install/terminal/libraries-macos.sh
   install_app_via_brew "package-name" "--cask"  # for GUI apps
   # or
   install_app_via_brew "package-name"           # for CLI tools
   ```

### Testing

```bash
# Test basic functionality
./test-macos.sh

# Test individual components
source install/check-version-macos.sh
source install/terminal/libraries-macos.sh
```

### Key Functions

- `check_macos_version()` - Validates macOS version and sets Homebrew paths
- `install_app_via_brew()` - Installs packages via Homebrew with error handling
- `configure_macos_settings()` - Sets system preferences
- `set_macos_theme()` - Configures accent colors

## Migration Status

### ✅ Completed (Phase 1: Core Infrastructure)
- [x] macOS version detection and validation
- [x] Homebrew integration and package management
- [x] Core script structure and orchestration
- [x] Basic application installation patterns
- [x] System preferences configuration
- [x] User interaction and choice collection

### 🚧 In Progress (Phase 2: Application Installation)
- [ ] Complete terminal application suite
- [ ] Complete desktop application suite
- [ ] Theme system adaptation
- [ ] Configuration file management

### 📋 Planned (Phase 3: Configuration & Theming)
- [ ] Shell configuration (zsh adaptation)
- [ ] Theme system for terminal applications
- [ ] Configuration templates
- [ ] Font installation system

### 📋 Future (Phase 4: Polish & Integration)
- [ ] CLI management interface (`omakub-macos` command)
- [ ] Update and uninstall functionality
- [ ] macOS-specific optimizations
- [ ] CI/CD and automated testing

## Known Limitations

1. **Manual Steps Required**: Some applications (like setting default browser) require manual user interaction
2. **No GNOME Equivalent**: Many Ubuntu/GNOME-specific features don't have direct macOS equivalents
3. **Homebrew Dependencies**: Requires Homebrew which may conflict with other package managers
4. **Limited Theme Support**: macOS has fewer theming options compared to Linux desktop environments

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-app`
3. Add your application installer following the existing patterns
4. Test thoroughly on both Intel and Apple Silicon Macs
5. Submit a pull request

## Troubleshooting

### Common Issues

1. **"Command not found: brew"**
   - Solution: The boot script should install Homebrew automatically
   - Manual fix: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. **"Permission denied"**
   - Solution: Ensure scripts are executable: `chmod +x script-name.sh`
   - Some operations may require sudo privileges

3. **"App already exists"**
   - Solution: Homebrew will skip already installed packages
   - To reinstall: `brew reinstall package-name`

### Architecture Detection

The scripts automatically detect your Mac's architecture:
- **Apple Silicon (M1/M2/M3)**: Uses `/opt/homebrew`
- **Intel**: Uses `/usr/local`

### Logs and Debugging

Enable verbose output:
```bash
set -x  # Add to script for debugging
brew install --verbose package-name
```

## License

MIT License - see LICENSE file for details.

## Credits

Based on the original [Omakub](https://github.com/basecamp/omakub) by Basecamp, adapted for macOS.