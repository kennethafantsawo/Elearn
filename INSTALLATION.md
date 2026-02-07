# 📦 Flutter Installation Guide - StudyForge

If you see `flutter: command not found`, you need to install Flutter SDK first. This guide will help you do that.

## Quick Start

### For macOS/Linux Users
```bash
cd /workspaces/Elearn
chmod +x install_flutter.sh
./install_flutter.sh
```

### For Windows Users
```bash
cd /workspaces/Elearn
install_flutter.bat
```

---

## Manual Installation

If the scripts don't work, follow these manual steps.

### macOS

#### 1. Install Prerequisites
```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Git and other tools
brew install git curl
```

#### 2. Download Flutter
```bash
# Create Flutter directory
mkdir -p ~/flutter

# Download Flutter (choose based on your Mac)
# For Apple Silicon (M1, M2, M3):
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64.zip -o ~/flutter.zip

# For Intel Mac:
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_x64.zip -o ~/flutter.zip

# Extract
unzip ~/flutter.zip -d ~
rm ~/flutter.zip
```

#### 3. Add to PATH
```bash
# Edit your shell configuration file:
# For Zsh (default on modern macOS):
nano ~/.zshrc

# For Bash:
nano ~/.bashrc

# Add these lines at the end:
# Flutter SDK
export PATH="$HOME/flutter/bin:$PATH"

# Save (Ctrl+O, Enter, Ctrl+X)

# Apply changes
source ~/.zshrc  # or ~/.bashrc
```

#### 4. Verify
```bash
flutter --version
where flutter
```

---

### Linux (Ubuntu/Debian)

#### 1. Install Prerequisites
```bash
sudo apt-get update
sudo apt-get install -y git curl wget
```

#### 2. Download Flutter
```bash
# Create Flutter directory
mkdir -p ~/flutter

# Download Flutter
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_x64.tar.xz -o ~/flutter.tar.xz

# Extract
tar -xf ~/flutter.tar.xz -C ~
rm ~/flutter.tar.xz
```

#### 3. Add to PATH
```bash
# Edit shell configuration
nano ~/.bashrc

# Add at the end:
# Flutter SDK
export PATH="$HOME/flutter/bin:$PATH"

# Save (Ctrl+O, Enter, Ctrl+X)

# Apply changes
source ~/.bashrc
```

#### 4. Verify
```bash
flutter --version
which flutter
```

---

### Windows

#### 1. Install Prerequisites
- **Git**: Download from [git-scm.com](https://git-scm.com/download/win)
- **Java**: Download from [oracle.com](https://www.oracle.com/java/technologies/javase-downloads.html)

#### 2. Download Flutter
1. Create folder: `C:\flutter`
2. Download latest Flutter:
   - Open PowerShell as Administrator
   ```powershell
   $url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.0-stable.zip"
   $output = "$env:USERPROFILE\Desktop\flutter.zip"
   (New-Object System.Net.WebClient).DownloadFile($url, $output)
   ```
3. Extract `flutter.zip` to `C:\flutter`

#### 3. Add to PATH
1. Right-click **This PC** → **Properties**
2. Click **Advanced system settings**
3. Click **Environment Variables**
4. Under **User variables**, click **New**
   - Variable name: `PATH`
   - Variable value: `C:\flutter\bin`
5. Click **OK** × 3
6. Restart Command Prompt or PowerShell

#### 4. Verify
```bash
flutter --version
where flutter
```

---

## Verifying Installation

### Run Flutter Doctor
```bash
flutter doctor -v
```

You should see something like:
```
✓ Flutter (Channel stable, 3.19.0, on macOS 14.1.2)
✓ Android toolchain
✓ Xcode (or similar)
✓ Chrome
✓ VS Code
```

If anything shows ✗, see [Troubleshooting](#troubleshooting) below.

---

## Installing Project Dependencies

Once Flutter is installed:

```bash
cd /workspaces/Elearn

# Get dependencies
flutter pub get

# Generate code for Hive models
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Verification Checklist

After installation, verify these work:

```bash
# Should print Flutter version
flutter --version

# Should print Dart version
dart --version

# Should show Flutter SDK location
which flutter  # macOS/Linux
where flutter  # Windows

# Should show healthy ecosystem
flutter doctor

# Should download dependencies (take 1-5 min)
cd /workspaces/Elearn
flutter pub get

# Should work without errors
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## First Run

Once everything is installed:

### Option 1: Web (Easiest)
```bash
flutter run -d chrome
```
App opens in Chrome with hot reload enabled.

### Option 2: VS Code
1. Press `Ctrl+Shift+B` (or `Cmd+Shift+B` on macOS)
2. Select `Flutter: Run (Web)`
3. Chrome opens automatically

### Option 3: Android Emulator
```bash
# Start emulator first
emulator -avd Pixel_4_API_31

# Run app
flutter run
```

### Option 4: iOS Simulator (macOS only)
```bash
# Start simulator
open -a Simulator

# Run app
flutter run -d macos
```

---

## Troubleshooting

### Issue: "flutter: command not found" after installation

**Solution:**
1. Close your terminal/IDE completely
2. Open a **new** terminal
3. Test: `flutter --version`

If still not found:
```bash
# Check if Flutter is in PATH
echo $PATH  # macOS/Linux
echo %PATH%  # Windows

# Manually add Flutter to current session
export PATH="$HOME/flutter/bin:$PATH"  # macOS/Linux
set PATH=%USERPROFILE%\flutter\bin;%PATH%  # Windows cmd
$env:PATH = "C:\flutter\bin;$env:PATH"  # PowerShell
```

---

### Issue: "pub get" fails or times out

**Solution:**
```bash
# Clear pub cache
flutter pub cache clean

# Try again
flutter pub get

# If still failing, try upgrade
flutter upgrade
```

---

### Issue: "Xcode not found" (macOS)

**Solution:**
```bash
xcode-select --install

# If already installed, reset:
sudo xcode-select --reset
```

---

### Issue: "Java not found" 

**Solution:**
```bash
# macOS
brew install openjdk@11

# Linux
sudo apt-get install openjdk-11-jdk

# Windows - Download from Java website and set JAVA_HOME
```

---

### Issue: Emulator not found

**Solution:**
```bash
# List available emulators
flutter emulators

# Start one
flutter emulators --launch <emulator-id>

# Or use VS Code task
# Ctrl+Shift+B → Flutter: Run (Android)
```

---

### Issue: Pod install failed (iOS)

**Solution:**
```bash
# Update CocoaPods
sudo gem install cocoapods
pod setup

# Clean iOS build
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..

# Try again
flutter clean
flutter pub get
flutter run -d ios
```

---

## Environment Variables

Some tools need environment variables:

### FLUTTER_SDK
Points to Flutter installation directory:
```bash
# macOS/Linux
export FLUTTER_SDK=$HOME/flutter

# Windows (PowerShell)
$env:FLUTTER_SDK = "C:\flutter"
```

### JAVA_HOME
Points to Java installation:
```bash
# macOS
export JAVA_HOME=$(/usr/libexec/java_home)

# Linux
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Windows (PowerShell)
$env:JAVA_HOME = "C:\Program Files\Java\jdk-11"
```

---

## Version Management

### Check installed versions
```bash
flutter --version     # Flutter version
dart --version        # Dart version
```

### Update Flutter
```bash
flutter upgrade
```

### Use specific Flutter version
```bash
# List versions
flutter version

# Switch version
flutter version v3.13.0
```

---

## Platform-Specific Setup

After Flutter is installed, optionally set up specific platforms:

### Android
- Android SDK Manager (comes with Flutter)
- Android Studio recommended
- See [CONFIG.md](CONFIG.md) § Android

### iOS (macOS only)
```bash
# Install Xcode command line tools
xcode-select --install

# Install/update CocoaPods
sudo gem install cocoapods
```

### Web (all platforms)
- Installed by default
- Requires Chrome/Chromium/Firefox

---

## System Requirements

| Item | Minimum | Recommended |
|------|---------|-------------|
| macOS | 10.14.6 | Latest (14+) |
| Ubuntu | 18.04 LTS | 22.04 LTS |
| Windows | Windows 10 | Windows 11 |
| RAM | 4GB | 8GB+ |
| Storage | 4GB | 10GB+ (for all platforms) |
| Disk Type | HDD | SSD (faster builds) |

---

## Performance Tips

1. **Use SSD** - Builds are much faster
2. **More RAM** - Parallel builds with more RAM
3. **IDE** - VS Code is lighter than Android Studio
4. **JVM Heap** - In `android/gradle.properties`:
   ```
   org.gradle.jvmargs=-Xmx4096m
   ```

---

## Getting Help

If installation fails:

1. **Check** `flutter doctor -v` for issues
2. **Read** [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
3. **Search** [Flutter docs](https://flutter.dev/docs/get-started/install)
4. **Ask** on Stack Overflow with tag `[flutter]`

---

## Next Steps

Once Flutter is fully installed:

1. **Run the app**: `flutter run -d chrome`
2. **Read** [QUICKSTART.md](QUICKSTART.md)
3. **Setup VS Code**: [VSCODE_SETUP.md](VSCODE_SETUP.md)
4. **Start developing**: [DEVELOPMENT.md](DEVELOPMENT.md)

---

**Happy coding! 🚀**
