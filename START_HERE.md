# 🚀 START HERE - StudyForge Setup

Welcome! You just cloned StudyForge. Here's what to do next.

## ⚡ 5-Minute Quick Start

### 1️⃣ Check if Flutter is installed
```bash
flutter --version
```

**See `flutter: command not found`?** → Go to [Flutter Installation](#flutter-installation) below

### 2️⃣ Install dependencies
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3️⃣ Run the app
```bash
flutter run -d chrome
```

**That's it!** The app opens in Chrome. 🎉

---

## 🔧 Flutter Installation

### If you see: `flutter: command not found`

**Choose your OS:**

#### macOS/Linux: Run this
```bash
chmod +x install_flutter.sh
./install_flutter.sh
```

#### Windows: Run this
```bash
install_flutter.bat
```

**Or read the full guide:** [INSTALLATION.md](INSTALLATION.md)

---

## 📱 Running the App

### Option 1: Web Browser (Easiest) ✅
```bash
flutter run -d chrome
```
Opens Chrome automatically with hot reload.

### Option 2: VS Code
1. Press `Ctrl+Shift+B` (Windows/Linux) or `Cmd+Shift+B` (macOS)
2. Select `Flutter: Run (Web)`
3. Chrome opens

### Option 3: Android Emulator
```bash
flutter run
```
(Make sure Android emulator is running first)

### Option 4: iOS Simulator (macOS only)
```bash
flutter run -d macos
```

---

## 📚 Next Steps

After the app runs:

1. **Explore the app** - Upload documents, generate notes
2. **Understand the code** - Read [DEVELOPMENT.md](DEVELOPMENT.md)
3. **Start coding** - See [DOCS_INDEX.md](DOCS_INDEX.md)

---

## 🆘 Having Issues?

### My App Won't Run
1. Run: `flutter doctor`
2. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

### Can't Find Something
- [DOCS_INDEX.md](DOCS_INDEX.md) - Complete documentation guide
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common problems and fixes

### Need Help with...
| Topic | File |
|-------|------|
| Installation | [INSTALLATION.md](INSTALLATION.md) |
| Running app | [LIVE_PREVIEW.md](LIVE_PREVIEW.md) |
| Development | [DEVELOPMENT.md](DEVELOPMENT.md) |
| Platform setup | [CONFIG.md](CONFIG.md) |
| Testing | [TESTING.md](TESTING.md) |
| Bugs | [TROUBLESHOOTING.md](TROUBLESHOOTING.md) |

---

## ✅ Quick Checklist

After install, you should have:

- [ ] Flutter installed (`flutter --version` works)
- [ ] Dependencies installed (`flutter pub get` works)
- [ ] Code generated (`flutter pub run build_runner` works)
- [ ] App runs (`flutter run -d chrome` works)
- [ ] See splash screen with "StudyForge"
- [ ] Can click buttons without crashes

---

## 🎯 Architecture Overview

```
Your Flutter App
    ↓
[UI Layer - Widgets & Pages]
    ↓ 
[Service Layer - AI & Documents]
    ↓
[Data Layer - Hive Database]
    ↓
[Storage - Local Device]
```

**Files to explore:**
- `lib/main.dart` - App entry point
- `lib/pages/home_page.dart` - Main UI
- `lib/services/ai_service.dart` - AI integration
- `lib/services/document_service.dart` - File management

---

## 🚀 Key Commands

```bash
# Install dependencies
flutter pub get

# Generate code (Hive models)
flutter pub run build_runner build --delete-conflicting-outputs

# Run on web
flutter run -d chrome

# Run on Android/iOS
flutter run

# Format code
dart format lib/

# Check code quality
flutter analyze

# Run tests
flutter test

# Build for production
flutter build web
flutter build apk      # Android
flutter build ios      # iOS (macOS only)
```

---

## 📖 Full Documentation

All documentation is organized here: **[DOCS_INDEX.md](DOCS_INDEX.md)**

Start there if you need:
- Detailed setup instructions
- Development workflow
- Testing procedures
- Platform configuration
- Troubleshooting help

---

## 💡 Pro Tips

1. **Hot Reload**: Edit code, save (Ctrl+S), app updates instantly
2. **Debug**: Press F5 in VS Code to start debugging
3. **Performance**: Press 'p' while app runs to see performance overlay
4. **Logs**: Use `flutter run -v` for verbose output

---

## ✨ You're All Set!

Next step: **Run the app**
```bash
flutter run -d chrome
```

Then explore [DOCS_INDEX.md](DOCS_INDEX.md) when you're ready to develop.

**Questions?** Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or [DOCS_INDEX.md](DOCS_INDEX.md).

Happy coding! 🎉
