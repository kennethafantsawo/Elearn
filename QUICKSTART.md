# StudyForge - Quick Start Guide

Welcome to **StudyForge**! This guide will get you up and running quickly.

## ⚠️ Flutter Not Installed?

If you see `flutter: command not found`, you need to install Flutter first:

**See**: [INSTALLATION.md](INSTALLATION.md)

Or run the setup script:
```bash
# macOS/Linux
chmod +x install_flutter.sh
./install_flutter.sh

# Windows
install_flutter.bat
```

---

## 📋 Prerequisites

- Flutter 3.3.0 or higher (See [INSTALLATION.md](INSTALLATION.md) if not installed)
- Dart 3.0.0 or higher (comes with Flutter)
- Git
- (Optional) Android SDK for Android development
- (Optional) Xcode for iOS development

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/kennethafantsawo/Elearn.git
cd Elearn
```

### 2. Run Setup
Choose based on your OS:

**macOS/Linux:**
```bash
bash setup.sh
```

**Windows:**
```cmd
setup.bat
```

**Or manually:**
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App
```bash
flutter run
```

## 📱 Running on Different Platforms

### Android
```bash
flutter run -d android
# or
make run-android
```

### iOS
```bash
flutter run -d ios
# or
make run-ios
```

### Web
```bash
flutter run -d web
# or
make run-web
```

## 📦 Available Commands

### Using Make (macOS/Linux)
```bash
make help          # Show all commands
make setup         # Setup project
make clean         # Clean build artifacts
make test          # Run tests
make build-apk     # Build Android APK
make build-ios     # Build iOS app
make build-web     # Build Web app
```

### Using Flutter
```bash
flutter pub get                                    # Get dependencies
flutter pub run build_runner build                 # Generate code
flutter test                                       # Run tests
flutter analyze                                    # Analyze code
flutter clean                                      # Clean build
flutter build apk --release                        # Build Android APK
flutter build ios --release                        # Build iOS app
flutter build web --release                        # Build Web app
```

## 📁 Project Structure

```
StudyForge/
├── lib/                    # Dart source code
│   ├── main.dart          # Entry point
│   ├── theme.dart         # App theme
│   ├── constants.dart     # Constants
│   ├── pages/             # App screens
│   ├── services/          # Business logic
│   ├── models/            # Data models
│   └── widgets/           # UI components
├── android/               # Android native code
├── ios/                   # iOS native code
├── web/                   # Web source code
├── assets/                # App assets
├── test/                  # Tests
├── pubspec.yaml          # Dependencies
└── analysis_options.yaml # Lint rules
```

## 🔧 Key Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dart dependencies |
| `analysis_options.yaml` | Code linting rules |
| `lib/main.dart` | App entry point |
| `lib/theme.dart` | App styling |
| `lib/constants.dart` | App constants |
| `android/app/build.gradle` | Android configuration |
| `ios/Runner/Info.plist` | iOS configuration |

## 🎯 Common Tasks

### Add a Dependency
```bash
flutter pub add <package_name>
```

### Format Code
```bash
dart format .
```

### Analyze Code
```bash
flutter analyze
```

### Run Tests
```bash
flutter test
```

### View Logs
```bash
flutter logs
```

## 🐛 Troubleshooting

### App won't run?
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Android issues?
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run -d android
```

### iOS issues?
```bash
cd ios
pod repo update
pod install
cd ..
flutter clean
flutter pub get
flutter run -d ios
```

## 📚 Documentation

- [README.md](README.md) - Project overview
- [DEVELOPMENT.md](DEVELOPMENT.md) - Development guide
- [CONFIG.md](CONFIG.md) - Configuration guide
- [Flutter Docs](https://flutter.dev/docs)

## 💡 Tips

- Use `flutter devices` to list connected devices
- Use `flutter pub outdated` to check for package updates
- Use `flutter doctor` to diagnose environment issues
- Use `flutter doctor -v` for verbose output

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/NewFeature`)
3. Commit changes (`git commit -m 'Add NewFeature'`)
4. Push to branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## 🆘 Help

- 📖 Check [DEVELOPMENT.md](DEVELOPMENT.md) for detailed guide
- 🔧 Check [CONFIG.md](CONFIG.md) for configuration issues
- 🐛 [Report issues on GitHub](https://github.com/kennethafantsawo/Elearn/issues)
- 💬 [GitHub Discussions](https://github.com/kennethafantsawo/Elearn/discussions)

---

Happy coding! 🎉
