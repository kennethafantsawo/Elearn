# StudyForge Development Guide

## Project Structure

```
StudyForge/
├── lib/                    # Dart source code
├── android/                # Android native code
├── ios/                    # iOS native code
├── web/                    # Web source code
├── assets/                 # App assets (models, icons)
├── test/                   # Unit and widget tests
├── pubspec.yaml            # Dart dependencies
└── analysis_options.yaml   # Lint rules
```

## Getting Started

### Prerequisites
- Flutter 3.3.0+
- Dart 3.0.0+
- Android SDK (for Android development)
- Xcode (for iOS development)
- Git

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/kennethafantsawo/Elearn.git
   cd Elearn
   ```

2. **Run setup script**
   - **macOS/Linux:**
     ```bash
     bash setup.sh
     ```
   - **Windows:**
     ```cmd
     setup.bat
     ```
   - **Or manually:**
     ```bash
     flutter pub get
     flutter pub run build_runner build --delete-conflicting-outputs
     mkdir -p assets/models assets/icons
     ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Available Commands

### Using Makefile (macOS/Linux)
```bash
make help              # Show all available commands
make setup             # Setup project
make clean             # Clean build artifacts
make run-android       # Run on Android device/emulator
make run-ios           # Run on iOS simulator
make run-web           # Run on web
make test              # Run tests
make build-apk         # Build Android APK
make build-ios         # Build iOS app
make build-web         # Build Web app
```

### Using Scripts
- **macOS/Linux:** `bash setup.sh`
- **Windows:** `setup.bat`

## Development Workflow

### 1. Starting Development

```bash
# Terminal 1: Run the app
flutter run -d <device_id>

# Terminal 2: Watch for file changes and rebuild
flutter pub run build_runner watch
```

### 2. Adding New Dependencies

```bash
flutter pub add <package_name>
```

### 3. Generating Code

For Hive model adapters:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

### 5. Code Analysis

```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Apply lint rules
flutter analyze --no-pub
```

## File Structure

### `lib/`
- **main.dart** - App entry point and theme setup
- **pages/** - App pages/screens
- **services/** - Business logic (AI, documents, etc.)
- **models/** - Data models
- **widgets/** - Reusable UI components

### `android/`
- **app/src/main/AndroidManifest.xml** - App permissions and config
- **app/src/main/kotlin/** - Kotlin code for Android
- **app/src/main/res/** - Android resources (strings, colors, etc.)

### `ios/`
- **Runner/** - iOS native code
- **Runner/Assets.xcassets/** - iOS asset catalog
- **Runner/Base.lproj/** - iOS storyboards

### `web/`
- **index.html** - Web entry point
- **js/** - JavaScript files
- **css/** - CSS files
- **icons/** - Web app icons

### `assets/`
- **models/** - AI models (GGUF files)
- **icons/** - App icons

## Important Notes

### Network Requests
All network requests should use the `http` or `dio` package. Always handle errors gracefully.

### Local Storage
Use Hive for local data storage. Models must be annotated with `@HiveType()` and have generated adapters.

### Permissions
- iOS: Update `Info.plist` in `ios/Runner/`
- Android: Update `AndroidManifest.xml`

### Code Style
- Follow Dart conventions (see `analysis_options.yaml`)
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

## Troubleshooting

### Flutter cache issues
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

### Build failures
```bash
# For Android
cd android && ./gradlew clean && cd ..

# For iOS
cd ios && pod repo update && pod install && cd ..

# Rebuild
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

### Android Gradle issues
- Update `local.properties` with correct SDK paths
- Update `gradle.properties` with correct versions

### iOS build issues
- Delete `ios/Pods` directory and run `pod install`
- Update iOS deployment target in Xcode
- Clear Xcode build cache: `Cmd + Shift + K`

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Building for Production

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS
```bash
# Build for iOS
flutter build ios --release
```

### Web
```bash
# Build for web
flutter build web --release
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Hive Database](https://pub.dev/packages/hive)
- [Llama Dart](https://pub.dev/packages/llama_dart)

## Support

For issues and questions:
- Open an issue on GitHub
- Check existing issues first
- Provide detailed error messages and logs

---

Happy coding! 🚀
