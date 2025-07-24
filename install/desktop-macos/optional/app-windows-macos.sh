#!/bin/zsh

# Setup Windows VM on macOS
echo "Setting up Windows VM resources..."

source ~/.local/share/omakub-macos/install/terminal-macos/libraries-macos.sh

echo "📁 Creating VM resources directory"
mkdir -p ~/Downloads/VM-Resources

echo "📥 For Windows VM setup on macOS, you can use:"
echo "   1. Parallels Desktop (paid, best performance) - install via parallels optional app"
echo "   2. VMware Fusion (paid, good performance)"  
echo "   3. VirtualBox (free, basic performance) - install via virtualbox optional app"
echo ""
echo "🪟 Download Windows 11 ISO from:"
echo "   https://www.microsoft.com/software-download/windows11"
echo ""
echo "💡 Recommended: Use Parallels Desktop for best macOS integration and performance"
echo "   Install Parallels via: source install/desktop-macos/optional/app-parallels-macos.sh"