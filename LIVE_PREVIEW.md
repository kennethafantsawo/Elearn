# 🚀 StudyForge - Live Viewing Guide

## How to View the App Live

You have multiple options to view your StudyForge app in action:

### Option 1: Interactive Setup (Recommended)

#### macOS/Linux:
```bash
bash run_live.sh
```

#### Windows:
```cmd
run_live.bat
```

This script will:
1. Check your Flutter installation
2. List available devices
3. Let you choose a platform
4. Setup the project
5. Launch the app

### Option 2: Manual Command Line

#### Prerequisites
```bash
# Get dependencies
flutter pub get

# Generate code (needed for Hive)
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Run on Web (Chrome) - EASIEST
```bash
flutter run -d chrome
```

#### Run on Android
```bash
flutter run -d android
# or specify device:
flutter run -d <device_id>
```

#### Run on iOS
```bash
flutter run -d ios
```

### Option 3: VS Code Integration

#### From Command Palette:
1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)
2. Type "Flutter: Run"
3. Select the platform you want

#### From Tasks:
1. Press `Ctrl+Shift+B` (or `Cmd+Shift+B` on macOS)
2. Select "Flutter: Run (Web)" or other option

#### From Debug:
1. Press `F5` or go to Debug menu
2. Select "Flutter: Debug (Web/Android/iOS)"

### Option 4: Using Make Commands (macOS/Linux)

```bash
make run-web          # Run on Web
make run-android      # Run on Android
make run-ios          # Run on iOS
```

---

## 📱 Recommended Setup for First Time

### 1. **Web (Easiest - No Device Needed)**
```bash
# Terminal 1: Get dependencies
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Terminal 2: Run on web
flutter run -d chrome
```

**Advantages:**
- ✅ No emulator needed
- ✅ Fastest setup
- ✅ Hot reload works instantly
- ✅ Easy debugging in Chrome DevTools

### 2. **Android Emulator (If you have Android SDK)**
```bash
# Start emulator first
flutter emulators launch Pixel_5_API_30

# Then run app
flutter run -d android
```

### 3. **iOS Simulator (If you have Xcode on macOS)**
```bash
# iOS simulator starts automatically
flutter run -d ios
```

---

## 🔄 Available Devices Check

List all available devices:
```bash
flutter devices
```

Example output:
```
2 connected devices:

Chrome (web) • chrome • web-javascript • Google Chrome 120.0.0.0
Pixel 5 (emulator) • emulator-5554 • android-x86 • Android 12 (API 31)
```

---

## 🛠️ VS Code Setup for Live Development

The project includes VS Code configuration for faster development:

**.vscode/tasks.json** includes:
- `Flutter: Get Dependencies` - Install dependencies
- `Flutter: Build Runner` - Generate code
- `Flutter: Run (Web)` - Launch web app
- `Flutter: Run (Android)` - Launch Android app
- `Flutter: Run (iOS)` - Launch iOS app
- `Flutter: Clean & Setup` - Complete fresh setup
- `Flutter: Watch Changes` - Auto rebuild on changes

**.vscode/launch.json** includes:
- Debug configurations for each platform
- Press F5 to start debugging

**.vscode/settings.json** includes:
- Dart formatter configuration
- Hot reload on save
- Code formatting rules

---

## 🚀 Quick Start Commands

| Task | Command |
|------|---------|
| **Setup** | `flutter pub get` |
| **Generate Code** | `flutter pub run build_runner build` |
| **Run Web** | `flutter run -d chrome` |
| **Run Android** | `flutter run -d android` |
| **Run iOS** | `flutter run -d ios` |
| **Format Code** | `dart format .` |
| **Analyze Code** | `flutter analyze` |
| **Run Tests** | `flutter test` |

---

## 💡 Hot Reload Tips

Once the app is running:

- **Hot Reload** (keep app state):
  - Save a file in your editor
  - Or press `r` in terminal
  
- **Hot Restart** (reset app state):
  - Press `R` in terminal
  
- **Stop App**:
  - Press `q` in terminal

---

## 🐛 If Something Goes Wrong

### Dependency Issues
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

### Build Issues
```bash
flutter clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Still having issues?
See **DEVELOPMENT.md** for detailed troubleshooting

---

## 📊 What You'll See

The app will show:
1. **AppBar** - "StudyForge" title with blue background
2. **Title** - "Application d'étude locale"
3. **Upload Widget** - Button to add documents
4. **Generation Controls** - Button to generate notes (shown when docs are added)

---

## 🎯 Next Steps After Launching

Once you see the app:

1. ✅ **Test Upload Widget**
   - Click "Ajouter des documents"
   - Select a PDF, DOCX, TXT, or EPUB file

2. ✅ **Test Generation**
   - Add a document
   - Observe generation controls appear

3. ✅ **Explore Code**
   - Open lib/pages/home_page.dart
   - Edit colors/text to see hot reload

---

## 📞 Still Need Help?

- Check **QUICKSTART.md** for quick reference
- Check **DEVELOPMENT.md** for detailed guide
- Check **CONFIG.md** for platform setup
- Open an issue on GitHub

---

**Ready? Run your first command:**
```bash
flutter run -d chrome
```

Happy coding! 🎉
