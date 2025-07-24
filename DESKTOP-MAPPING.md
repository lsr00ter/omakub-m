# Desktop Apps Migration: Ubuntu → macOS

## ✅ **Direct Mappings (Same functionality)**

| Ubuntu App | macOS Equivalent | Script | Status |
|------------|------------------|---------|----|
| **Google Chrome** | Google Chrome | `app-chrome-macos.sh` | ✅ |
| **VSCode** | VSCode | `app-vscode-macos.sh` | ✅ |
| **VLC** | VLC | `app-vlc-macos.sh` | ✅ |
| **Obsidian** | Obsidian | `app-obsidian-macos.sh` | ✅ |
| **Signal** | Signal | `app-signal-macos.sh` | ✅ |
| **LibreOffice** | LibreOffice | `app-libreoffice-macos.sh` | ✅ |
| **LocalSend** | LocalSend | `app-localsend-macos.sh` | ✅ |
| **Typora** | Typora | `app-typora-macos.sh` | ✅ |
| **Xournal++** | Xournal++ | `app-xournalpp-macos.sh` | ✅ |

## 🔄 **Alternative Mappings (Different app, same purpose)**

| Ubuntu Tool | macOS Alternative | Script | Purpose |
|-------------|-------------------|---------|----------|
| **Pinta** | Krita | `app-pinta-macos.sh` | Image editing |
| **Flameshot** | Built-in + Kap | `app-screenshot-tools-macos.sh` | Screenshots |
| **wl-clipboard** | Maccy | `app-clipboard-tools-macos.sh` | Clipboard management |
| **GNOME window mgmt** | Rectangle | `app-rectangle-macos.sh` | Window management |
| **Ubuntu system tools** | AppCleaner + built-ins | `app-system-tools-macos.sh` | System maintenance |

## ❌ **Skipped (GNOME/Ubuntu-specific)**

| Ubuntu Script | Reason | macOS Equivalent |
|---------------|---------|------------------|
| `a-flatpak.sh` | Flatpak doesn't exist on macOS | Homebrew Cask |
| `app-gnome-*.sh` | GNOME-specific apps | Built-in macOS apps |
| `set-gnome-*.sh` | GNOME desktop settings | `set-macos-preferences.sh` |
| `ulauncher.sh` | GNOME app launcher | Spotlight (built-in) |
| `set-alacritty-default.sh` | Linux terminal setup | Terminal.app (built-in) |
| `app-wl-clipboard.sh` | Wayland-specific | macOS clipboard (built-in) |

## 🍎 **macOS-Specific Additions**

| Script | Purpose | Why macOS-specific |
|---------|---------|---|
| `fonts-macos.sh` | Programming fonts via Homebrew | Uses `homebrew/cask-fonts` tap |
| `set-macos-preferences.sh` | System preferences | macOS `defaults` commands |
| `app-rectangle-macos.sh` | Window management | macOS lacks built-in tiling |
| `app-clipboard-tools-macos.sh` | Enhanced clipboard | Improves basic macOS clipboard |

---

## 📂 **Optional Apps Migration**

### ✅ **Direct Optional App Mappings**

| Ubuntu App | macOS Equivalent | Script | Status |
|------------|------------------|---------|----|
| **1Password** | 1Password + CLI | `app-1password-macos.sh` | ✅ |
| **Spotify** | Spotify | `app-spotify-macos.sh` | ✅ |
| **OBS Studio** | OBS Studio | `app-obs-studio-macos.sh` | ✅ |
| **Brave Browser** | Brave Browser | `app-brave-macos.sh` | ✅ |
| **GIMP** | GIMP | `app-gimp-macos.sh` | ✅ |
| **Steam** | Steam | `app-steam-macos.sh` | ✅ |
| **Zoom** | Zoom | `app-zoom-macos.sh` | ✅ |
| **Audacity** | Audacity | `app-audacity-macos.sh` | ✅ |
| **Dropbox** | Dropbox | `app-dropbox-macos.sh` | ✅ |
| **Minecraft** | Minecraft | `app-minecraft-macos.sh` | ✅ |
| **VirtualBox** | VirtualBox | `app-virtualbox-macos.sh` | ✅ |
| **Cursor** | Cursor | `app-cursor-macos.sh` | ✅ |
| **Zed** | Zed | `app-zed-macos.sh` | ✅ |
| **Windsurf** | Windsurf | `app-windsurf-macos.sh` | ✅ |
| **RubyMine** | RubyMine | `app-rubymine-macos.sh` | ✅ |
| **RetroArch** | RetroArch | `app-retroarch-macos.sh` | ✅ |
| **Parallels Desktop** | Parallels Desktop | `app-parallels-macos.sh` | ✅ |
| **Doom Emacs** | Doom Emacs | `app-doom-emacs-macos.sh` | ✅ |

### 🔄 **Optional App Alternatives**

| Ubuntu App | macOS Alternative | Script | Purpose |
|------------|-------------------|---------|---------|
| **Web Apps** | Safari/Chrome shortcuts | `select-web-apps-macos.sh` | Web app creation |
| **Windows VM** | Parallels/VMware/VirtualBox guide | `app-windows-macos.sh` | VM setup guidance |

### ❌ **Optional Apps Not Applicable**

| Ubuntu Script | Reason | macOS Note |
|---------------|--------|------------|
| `app-asdcontrol.sh` | Linux hardware control | `app-asdcontrol-macos.sh` (info only) |
| `app-mainline-kernels.sh` | Linux kernel management | `app-mainline-kernels-macos.sh` (info only) |

## 📁 **Complete File Structure**

```text
install/desktop-macos/
├── set-macos-preferences.sh           # System configuration
├── fonts-macos.sh                     # Programming fonts
├── applications-macos.sh              # Application organization functions
├── select-optional-apps-macos.sh      # Optional app selection handler
├── app-chrome-macos.sh                # Web browser
├── app-vscode-macos.sh                # Code editor
├── app-vlc-macos.sh                   # Media player
├── app-obsidian-macos.sh              # Note-taking
├── app-signal-macos.sh                # Messaging
├── app-libreoffice-macos.sh           # Office suite
├── app-localsend-macos.sh             # File sharing
├── app-typora-macos.sh                # Markdown editor
├── app-pinta-macos.sh                 # Image editor (→ Krita)
├── app-xournalpp-macos.sh             # PDF annotation
├── app-rectangle-macos.sh             # Window management
├── app-system-tools-macos.sh          # System utilities
├── app-screenshot-tools-macos.sh      # Screenshot tools
├── app-clipboard-tools-macos.sh       # Clipboard manager
└── optional/
    ├── app-1password-macos.sh         # Password manager
    ├── app-spotify-macos.sh           # Music streaming
    ├── app-obs-studio-macos.sh        # Screen recording
    ├── app-brave-macos.sh             # Privacy browser
    ├── app-gimp-macos.sh              # Image editing
    ├── app-steam-macos.sh             # Gaming platform
    ├── app-zoom-macos.sh              # Video conferencing
    ├── app-audacity-macos.sh          # Audio editing
    ├── app-dropbox-macos.sh           # Cloud storage
    ├── app-minecraft-macos.sh         # Gaming
    ├── app-virtualbox-macos.sh        # Virtualization
    ├── app-cursor-macos.sh            # AI code editor
    ├── app-zed-macos.sh               # Fast code editor
    ├── app-windsurf-macos.sh          # AI development environment
    ├── app-rubymine-macos.sh          # Ruby IDE
    ├── app-retroarch-macos.sh         # Emulation frontend
    ├── app-parallels-macos.sh         # Professional virtualization
    ├── app-doom-emacs-macos.sh        # Modern Emacs
    ├── app-asdcontrol-macos.sh        # Info only (not applicable)
    ├── app-mainline-kernels-macos.sh  # Info only (not applicable)
    ├── app-windows-macos.sh           # VM setup guidance
    └── select-web-apps-macos.sh       # Web app shortcuts
```

## 🔧 **Installation Method Changes**

| Ubuntu Method | macOS Method | Example |
|---------------|--------------|----|
| `sudo apt install` | `brew install --cask` | GUI applications |
| `flatpak install` | `brew install --cask` | Cross-platform apps |
| Manual `.deb` download | `brew install --cask` | Most applications |
| Custom repositories | Homebrew taps | Font installation |

## ⚙️ **Configuration Path Changes**

| Ubuntu Path | macOS Path | Purpose |
|-------------|------------|---------|
| `~/.config/` | `~/Library/Application Support/` | App configs |
| `/usr/share/applications/` | `/Applications/` | App shortcuts |
| `~/.local/share/applications/` | `/Applications/` | User apps |
| Typora: `~/.config/Typora/themes` | `~/Library/Application Support/abnerworks.Typora/themes` | Themes |

All scripts properly source the libraries and handle macOS-specific installation patterns!
