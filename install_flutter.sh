#!/bin/bash

# StudyForge - Flutter Installation Script
# Installs Flutter SDK and all dependencies
# Compatible with: macOS, Linux

set -e

echo "================================================"
echo "🚀 StudyForge - Flutter Installation Script"
echo "================================================"
echo ""

# Detect OS
OS_TYPE=$(uname -s)

if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "📱 Detected: macOS"
    OS="macos"
elif [[ "$OS_TYPE" == "Linux" ]]; then
    echo "🐧 Detected: Linux"
    OS="linux"
else
    echo "❌ Unsupported OS: $OS_TYPE"
    echo "   Please install Flutter manually from: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo ""
echo "Step 1: Checking prerequisites..."
echo "=================================="

# Check for required tools
check_tool() {
    if command -v $1 &> /dev/null; then
        echo "✅ $1 is installed"
        return 0
    else
        echo "⚠️  $1 is NOT installed"
        return 1
    fi
}

MISSING_TOOLS=0

if ! check_tool "git"; then
    MISSING_TOOLS=1
fi

if ! check_tool "curl"; then
    MISSING_TOOLS=1
fi

echo ""

if [ $MISSING_TOOLS -eq 1 ]; then
    echo "📦 Installing missing prerequisites..."
    
    if [[ "$OS" == "macos" ]]; then
        echo "   Run: brew install git curl"
        echo "   Then run this script again"
        exit 1
    elif [[ "$OS" == "linux" ]]; then
        echo "   Run: sudo apt-get update && sudo apt-get install -y git curl"
        echo "   Then run this script again"
        exit 1
    fi
fi

echo ""
echo "Step 2: Setting up directories..."
echo "=================================="

# Set Flutter installation directory
if [[ "$OS" == "macos" ]]; then
    FLUTTER_HOME="$HOME/.flutter"
else
    FLUTTER_HOME="$HOME/.flutter"
fi

if [ -d "$FLUTTER_HOME" ]; then
    echo "📂 Flutter directory already exists at: $FLUTTER_HOME"
    read -p "   Do you want to reinstall? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "   Removing old Flutter installation..."
        rm -rf "$FLUTTER_HOME"
    else
        echo "✅ Using existing Flutter installation"
        EXISTING_FLUTTER=true
    fi
fi

echo ""
echo "Step 3: Downloading Flutter SDK..."
echo "===================================="

if [ "$EXISTING_FLUTTER" != "true" ]; then
    mkdir -p "$FLUTTER_HOME"
    cd /tmp
    
    # Get latest stable Flutter release
    echo "📥 Downloading latest Flutter SDK..."
    
    if [[ "$OS" == "macos" ]]; then
        # For Apple Silicon (M1/M2/M3) and Intel
        ARCH=$(uname -m)
        if [[ "$ARCH" == "arm64" ]]; then
            echo "   Detected: Apple Silicon (M1/M2/M3)"
            FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64.zip"
        else
            echo "   Detected: Intel Mac"
            FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_x64.zip"
        fi
    else
        echo "   Detected: Linux"
        FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_x64.tar.xz"
    fi
    
    curl -L "$FLUTTER_URL" -o flutter.tar.xz
    
    echo "📦 Extracting Flutter SDK..."
    if [[ "$OS" == "macos" ]]; then
        unzip -q flutter.tar.xz -d "$HOME"
        rm flutter.tar.xz
    else
        tar -xf flutter.tar.xz -C "$HOME"
        rm flutter.tar.xz
    fi
    
    echo "✅ Flutter SDK downloaded and extracted"
else
    FLUTTER_HOME="$HOME/.flutter"
fi

echo ""
echo "Step 4: Setting up PATH..."
echo "============================="

export PATH="$HOME/flutter/bin:$PATH"

# Detect shell
if [[ "$SHELL" == *"zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash" ]]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

echo "🔧 Shell configuration: $SHELL_RC"

# Add Flutter to PATH if not already there
if ! grep -q "flutter/bin" "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "# Flutter SDK" >> "$SHELL_RC"
    echo "export PATH=\"\$HOME/flutter/bin:\$PATH\"" >> "$SHELL_RC"
    echo "✅ Added Flutter to PATH in $SHELL_RC"
else
    echo "✅ Flutter already in PATH"
fi

# Source the shell configuration
source "$SHELL_RC" 2>/dev/null || true

echo ""
echo "Step 5: Verifying Flutter installation..."
echo "==========================================="

if command -v flutter &> /dev/null; then
    FLUTTER_VERSION=$(flutter --version 2>/dev/null | head -n 1)
    echo "✅ Flutter installed successfully!"
    echo "   Version: $FLUTTER_VERSION"
else
    echo "⚠️  Flutter not found in PATH"
    echo "   Please run in a new terminal:"
    echo "   source $SHELL_RC"
    echo "   flutter --version"
fi

echo ""
echo "Step 6: Running flutter doctor..."
echo "=================================="

flutter doctor -v || echo "⚠️  Some checks failed - see above for details"

echo ""
echo "Step 7: Installing project dependencies..."
echo "=========================================="

cd /workspaces/Elearn
flutter pub get

echo ""
echo "================================================"
echo "✅ Installation Complete!"
echo "================================================"
echo ""
echo "🚀 Next Steps:"
echo "   1. Reload your shell: source $SHELL_RC"
echo "   2. Run the app: flutter run -d chrome"
echo "   3. Or use VS Code: Ctrl+Shift+B → Flutter: Run (Web)"
echo ""
echo "📖 Documentation:"
echo "   - [QUICKSTART.md](QUICKSTART.md)"
echo "   - [LIVE_PREVIEW.md](LIVE_PREVIEW.md)"
echo "   - [DOCS_INDEX.md](DOCS_INDEX.md)"
echo ""
echo "Happy coding! 🎉"
