# StudyForge - Configuration Guide

## Platform-Specific Configuration

### Android Configuration

#### Required Environment Variables
```bash
export ANDROID_SDK_ROOT=/path/to/android/sdk
export JAVA_HOME=/path/to/java
```

#### local.properties
```properties
sdk.dir=/path/to/Android/sdk
flutter.sdk=/path/to/flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
```

#### Android Emulator Setup
```bash
# List available emulators
flutter emulators

# Create emulator
flutter emulators create --name pixel_5

# Run emulator
flutter emulators launch pixel_5

# Run app on emulator
flutter run -d emulator-5554
```

#### Android Device Setup
```bash
# Enable USB debugging on device
# Settings > Developer options > USB debugging

# List connected devices
flutter devices

# Run app on device
flutter run -d <device_id>
```

### iOS Configuration

#### Xcode Setup
```bash
# Set Xcode path
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# Accept Xcode license
sudo xcodebuild -license accept
```

#### iOS Simulator Setup
```bash
# List available simulators
flutter emulators

# Launch iOS simulator
open -a Simulator

# Run app on simulator
flutter run -d iPhone\ 15\ Pro
```

#### iOS Device Setup
```bash
# Generate certificates
# Follow guide: https://flutter.dev/docs/deployment/ios

# Run on device
flutter run -d <device_id>
```

#### Podfile Configuration
The `ios/Podfile` already includes:
- Flutter integration
- Plugin support
- Pod installation settings

To update pods:
```bash
cd ios
pod repo update
pod install
cd ..
```

### Web Configuration

#### Environment Setup
```bash
# Chrome is required for web development
# Install Chrome from https://www.google.com/chrome

# Run on web
flutter run -d chrome
```

#### Web Build
```bash
# Build for web
flutter build web --release

# Serve locally
# Output: build/web/
```

## Development Environment

### Required Tools
- Flutter SDK 3.3.0+
- Dart SDK 3.0.0+
- Android SDK (for Android)
- Xcode (for iOS)
- Git
- IDE: VS Code or Android Studio

### IDE Setup

#### VS Code Extensions
- Flutter
- Dart
- Android iOS Emulator (optional)
- Awesome Flutter Snippets (optional)

#### Android Studio Plugins
- Flutter
- Dart

## Build Configuration

### Debug Build
```bash
flutter run
```

### Release Build
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### Profile Build (for performance testing)
```bash
flutter run --profile
```

## Important Files

### Android
- `android/app/build.gradle` - App build configuration
- `android/app/src/main/AndroidManifest.xml` - Permissions and config
- `android/app/src/main/res/values/strings.xml` - String resources
- `android/app/src/main/res/values/colors.xml` - Color resources
- `android/app/src/main/res/values/styles.xml` - Style resources

### iOS
- `ios/Runner/Info.plist` - App configuration
- `ios/Runner/GeneratedPluginRegistrant.swift` - Plugin registration
- `ios/Podfile` - Dependencies

### Web
- `web/index.html` - Entry point
- `web/manifest.json` - PWA manifest
- `web/flutter_service_worker.js` - Service worker

## Database Setup

### Hive Configuration
Hive is used for local storage. Models must be:
1. Annotated with `@HiveType(typeId: <id>)`
2. Have generated adapters via `build_runner`

Generate adapters:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Performance Optimization

### For Low-end Devices
- Use TinyLlama model (1.1B parameters)
- Reduce chunk size
- Optimize memory usage

### For High-end Devices
- Use larger models (Phi-3)
- Increase chunk size for better context
- Enable advanced features

## Troubleshooting

### Common Issues

#### Flutter not found
```bash
# Add Flutter to PATH
export PATH="$PATH:$(which flutter)/.."
```

#### Pod install fails
```bash
cd ios
pod repo update
pod install --repo-update
cd ..
```

#### Gradle issues
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

#### Build cache issues
```bash
flutter clean
rm -rf build/ ios/Pods/ android/.gradle/
flutter pub get
flutter pub run build_runner build
```

## Resources

- [Flutter Setup](https://flutter.dev/docs/get-started/install)
- [Android Setup](https://flutter.dev/docs/get-started/install/linux)
- [iOS Setup](https://flutter.dev/docs/get-started/install/macos)
- [Web Setup](https://flutter.dev/docs/get-started/web)

---

For additional help, see DEVELOPMENT.md
