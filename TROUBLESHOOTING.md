# 🔧 Troubleshooting Guide - StudyForge

Comprehensive troubleshooting guide for common issues and their solutions.

## Table of Contents

- [Installation & Setup Issues](#installation--setup-issues)
- [Build & Compilation Errors](#build--compilation-errors)
- [Runtime Errors](#runtime-errors)
- [Platform-Specific Issues](#platform-specific-issues)
- [Performance Issues](#performance-issues)
- [Development Environment Issues](#development-environment-issues)
- [Getting Help](#getting-help)

---

## Installation & Setup Issues

### Issue: "Flutter not found" or "flutter: command not found"

**Symptoms:**
- Terminal says `flutter` is not installed
- `flutter doctor` doesn't work
- Apps won't run

**Solutions:**

1. **Check if Flutter is installed:**
   ```bash
   which flutter
   flutter --version
   ```

2. **Install Flutter:**
   - [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
   - Run: `./setup.sh` or `setup.bat`

3. **Add Flutter to PATH:**
   ```bash
   # macOS/Linux - Add to ~/.zshrc or ~/.bashrc
   export PATH="$PATH:[path-to-flutter]/bin"
   source ~/.zshrc
   ```

4. **Verify Installation:**
   ```bash
   flutter doctor
   ```
   All items should show ✓

---

### Issue: "Java not found" or "gradle errors"

**Symptoms:**
- `Error: Unable to locate a Java Runtime`
- `Gradle build failed`
- Android build errors

**Solutions:**

1. **Install Java:**
   ```bash
   # macOS
   brew install openjdk@11
   
   # Linux
   sudo apt-get install openjdk-11-jdk
   
   # Windows
   # Download from oracle.com
   ```

2. **Set JAVA_HOME:**
   ```bash
   # Find Java location
   which java
   /usr/libexec/java_home  # macOS
   
   # Add to environment
   export JAVA_HOME=/path/to/java
   ```

3. **Run Flutter Doctor:**
   ```bash
   flutter doctor -v
   ```

---

### Issue: Xcode or CocoaPods errors on iOS

**Symptoms:**
- `Xcode not found`
- `pod: command not found`
- iOS build fails

**Solutions:**

1. **Install Xcode:**
   ```bash
   xcode-select --install
   ```

2. **Install/Update CocoaPods:**
   ```bash
   sudo gem install cocoapods
   pod setup
   ```

3. **Clean iOS build:**
   ```bash
   cd ios
   rm -rf Pods
   rm Podfile.lock
   pod install
   cd ..
   flutter pub get
   ```

4. **Verify iOS Setup:**
   ```bash
   flutter doctor -v | grep -A 20 ios
   ```

---

### Issue: "Pub get failed" or dependency errors

**Symptoms:**
- `Could not find package`
- `version constraints cannot be satisfied`
- Dependency conflicts

**Solutions:**

1. **Clean and retry:**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Check pubspec.yaml syntax:**
   - Verify YAML formatting (spaces not tabs)
   - Check dependency versions match online

3. **Update dependencies:**
   ```bash
   flutter pub upgrade
   ```

4. **Check specific package:**
   ```bash
   flutter pub get --verbose
   ```

---

## Build & Compilation Errors

### Issue: "lib/main.dart has compile errors"

**Symptoms:**
- Red squiggly lines in files
- `Error: The file doesn't have a library or part of declaration`
- Files not recognized as Dart

**Solutions:**

1. **Reload Dart Analysis:**
   ```
   Ctrl+Shift+P → Flutter: Run Code Analysis
   ```

2. **Restart Dart server:**
   - VS Code: Reload window (Ctrl+R)
   - Or close and reopen project

3. **Check file structure:**
   - Ensure `lib/` directory exists
   - Ensure files are in correct locations

4. **Generate code if needed:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

---

### Issue: "Build Runner errors" or ".g.dart files not found

**Symptoms:**
- `document_model.g.dart not found`
- `Build failed` during compilation
- Hive adapters not generated

**Solutions:**

1. **Run Build Runner:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **Watch mode (auto-generate on save):**
   ```bash
   flutter pub run build_runner watch
   ```

3. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Check build runner installation:**
   ```bash
   # Verify in pubspec.yaml
   dev_dependencies:
     build_runner:
     hive_generator:
   ```

---

### Issue: "Target of URI doesn't exist" in imports

**Symptoms:**
- Red squiggles under `import 'package:...'`
- `Package not found`
- Imports don't resolve

**Solutions:**

1. **Verify package installed:**
   ```bash
   flutter pub get
   ```

2. **Check pubspec.yaml:**
   - Package listed under `dependencies` or `dev_dependencies`
   - No syntax errors
   - Correct indentation (spaces only)

3. **Example dependency:**
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     hive_flutter: ^1.1.0
     file_picker: ^5.0.0
   ```

4. **Reload IDE:**
   - VS Code: Ctrl+R to reload
   - Or restart Dart server

---

### Issue: "Gradle build failed" (Android)

**Symptoms:**
- Android build fails
- `FAILURE: Build failed`
- Gradle sync errors

**Solutions:**

1. **Check Gradle version in android/gradle/wrapper/gradle-wrapper.properties:**
   ```properties
   distributionUrl=https\://services.gradle.org/distributions/gradle-7.6.1-all.zip
   ```

2. **Clean Gradle cache:**
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   ```

3. **Update Gradle:**
   ```bash
   cd android
   ./gradlew wrapper --gradle-version 7.6.1
   cd ..
   ```

4. **Check JVM memory:**
   ```bash
   # In android/gradle.properties
   org.gradle.jvmargs=-Xmx4096m
   ```

---

## Runtime Errors

### Issue: "Exception: Unable to load asset" or "AssetNotFound"

**Symptoms:**
- App crashes with asset error
- Images/files not loading
- `Unable to load asset: assets/...`

**Solutions:**

1. **Check pubspec.yaml assets section:**
   ```yaml
   flutter:
     assets:
       - assets/
       - assets/images/
   ```

2. **Verify file exists:**
   ```bash
   ls -la assets/
   # File should actually exist
   ```

3. **Update asset declaration:**
   ```bash
   # After adding assets, run:
   flutter clean
   flutter pub get
   flutter run
   ```

4. **Check spelling:**
   - Asset paths are case-sensitive
   - Match exactly: `assets/images/icon.png` not `Assets/Images/...`

---

### Issue: "MissingPluginException" or platform not implemented

**Symptoms:**
- `MissingPluginException: No implementation found`
- `E/flutter: Unhandled Exception`
- Native code not available

**Solutions:**

1. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Reinstall app on device:**
   ```bash
   flutter run --release
   ```

3. **Check plugin platform:**
   - For Android: `android/` folder
   - For iOS: `ios/` folder
   - Run `flutter pub get` to sync

4. **For specific plugins:**
   ```bash
   flutter pub get
   # Then rebuild platform
   flutter run
   ```

---

### Issue: "Null safety" errors or "null reference exception"

**Symptoms:**
- `Error: Null check operator used on null value`
- `NoSuchMethodError: The getter '...' was called on null`
- `LateInitializationError`

**Solutions:**

1. **Check null safety in code:**
   ```dart
   // Bad - can be null
   String name = getNullableString();
   print(name.length);  // Crash!
   
   // Good - check for null
   String? name = getNullableString();
   if (name != null) {
     print(name.length);  // Safe
   }
   ```

2. **Use null coalescing:**
   ```dart
   String name = getNullableString() ?? "Unknown";
   ```

3. **Check variable initialization:**
   ```dart
   // Bad
   String name;
   print(name);  // Error!
   
   // Good
   String name = "John";
   print(name);
   ```

---

### Issue: "Unhandled Exception" in console

**Symptoms:**
- App crashes unexpectedly
- Long error stack trace
- App force closes

**Solutions:**

1. **Read error message carefully:**
   ```
   Unhandled Exception: [error type]: [error message]
   ```

2. **Find the line number:**
   - Look for your file in stack trace
   - Go to that line

3. **Add error handling:**
   ```dart
   try {
     // Code that might fail
     riskyOperation();
   } catch (e) {
     print('Error: $e');
     // Handle gracefully
   }
   ```

4. **Check logs:**
   ```bash
   flutter run -v  # Verbose mode
   ```

---

## Platform-Specific Issues

### Android Issues

#### Issue: "App crashes on startup"

**Solutions:**
```bash
# 1. Clean everything
flutter clean
rm -rf build/
rm -rf android/.gradle/

# 2. Rebuild
flutter pub get
flutter run -d android
```

#### Issue: "Permission denied" errors

**Solutions:**
1. Check `AndroidManifest.xml` has required permissions:
   ```xml
   <uses-permission android:name="android.permission.INTERNET" />
   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
   ```

2. Request runtime permissions in code

#### Issue: "Emulator not responding"

**Solutions:**
```bash
# Restart emulator
emulator -avd Pixel_4_API_31 -wipe-data

# Or use a real device
adb devices
flutter run -d <device-id>
```

---

### iOS Issues

#### Issue: "Pod install failed" or "Podfile lock conflicts"

**Solutions:**
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..
flutter clean
flutter run -d ios
```

#### Issue: "Xcode build error"

**Solutions:**
```bash
# Clean Xcode
cd ios
xcodebuild clean
cd ..

# Or completely clean
flutter clean
flutter pub get
flutter run -d ios
```

#### Issue: "App crashes on iOS device"

**Solutions:**
1. Check device trusts Xcode (Settings > Developer)
2. Update deployment target in Xcode
3. Check codesigning certificate

---

### Web Issues

#### Issue: "Chrome won't start" or "web not available"

**Solutions:**
```bash
# Check for Chrome
which google-chrome  # Linux
which "Google Chrome"  # macOS
# Windows: should be in Program Files

# Run on specific browser
flutter run -d chrome
flutter run -d edge  # Edge browser
```

#### Issue: "Web app loads but is blank"

**Solutions:**
```bash
# 1. Check JavaScript console
# Press F12 in Chrome
# Check for errors

# 2. Clean web build
flutter clean
cd web
rm -rf build/
cd ..
flutter run -d chrome
```

#### Issue: "CORS errors" or "Blocked request"

**Solutions:**
- This is usually safe for local development
- Check browser console (F12) for actual errors
- May be unrelated to actual issue

---

## Performance Issues

### Issue: "App is slow" or "frame drops"

**Symptoms:**
- UI stutters or freezes
- Slow response to taps
- High CPU/memory usage

**Solutions:**

1. **Check Performance Overlay:**
   ```
   While app running in terminal, press 'p'
   or
   Ctrl+Shift+P → Flutter: Toggle Performance Overlay
   ```
   - Top line (blue): GPU time
   - Bottom line (orange): CPU time
   - Should be < 16ms (60 FPS)

2. **Profile the app:**
   ```bash
   flutter run --profile
   ```

3. **Use Dart DevTools:**
   ```bash
   flutter pub global activate devtools
   devtools
   ```

4. **Check for unnecessary rebuilds:**
   - Don't rebuild entire widget tree
   - Use StatefulWidget only when needed
   - Cache expensive operations

---

### Issue: "High memory usage" or "app crashes with OutOfMemory"

**Symptoms:**
- App gets slower over time
- "Killed due to memory pressure"
- Emulator running out of memory

**Solutions:**

1. **Reduce image sizes:**
   - Compress PNG/JPG before use
   - Use fit property: `Image.fit = BoxFit.cover`

2. **Clean up resources:**
   - Dispose controllers in `dispose()`
   - Close streams and connections

3. **Increase emulator memory:**
   ```bash
   emulator -avd Pixel_4_API_31 -memory 4096
   ```

4. **Check for memory leaks:**
   ```bash
   flutter run --profile
   # Monitor memory in DevTools
   ```

---

## Development Environment Issues

### Issue: "VS Code doesn't recognize Dart/Flutter"

**Symptoms:**
- No autocomplete in Dart files
- No syntax highlighting
- Errors not shown

**Solutions:**

1. **Install extensions:**
   ```
   Ctrl+Shift+X → Search "Dart"
   Install "Dart Code" (Dart Code)
   Install "Flutter" (Flutter)
   ```

2. **Set Dart SDK path:**
   - Settings > Extensions > Dart Configuration
   - Set "Dart: Sdk Path" to Flutter's dart

3. **Reload VS Code:**
   ```
   Ctrl+Shift+P → Developer: Reload Window
   ```

---

### Issue: "Hot reload not working"

**Symptoms:**
- Changes don't appear immediately
- Have to restart app to see changes

**Solutions:**

1. **Enable hot reload:**
   - In terminal running app, press 'r'
   - Or `Ctrl+S` if configured

2. **Check settings.json:**
   ```json
   "dart.flutterHotReloadOnSave": "always"
   ```

3. **Some changes require hot restart (R):**
   - Dependency changes
   - Package imports
   - Static initializers
   - Main function

4. **If hot reload consistently fails:**
   ```bash
   # Stop app (q in terminal)
   flutter run
   # Try again
   ```

---

### Issue: "Debugger not stopping at breakpoints"

**Symptoms:**
- Breakpoints don't work
- F5 debugging doesn't pause code
- Can't inspect variables

**Solutions:**

1. **Use F5 for debugging (not plain flutter run):**
   - VS Code: Press F5
   - Or select "Flutter: Debug" configuration

2. **Check breakpoint is valid:**
   - Click on line number to set red dot
   - Not in comments or empty lines

3. **Check you're in debug mode:**
   - Look for "Paused on breakpoint" in VS Code

4. **Restart debugger if stuck:**
   - Click stop button
   - Press F5 again

---

### Issue: "Git merge conflicts" after updates

**Symptoms:**
- Can't pull latest changes
- `CONFLICT` messages
- Can't push changes

**Solutions:**

1. **See conflicts:**
   ```bash
   git status
   ```

2. **View conflicted file:**
   ```bash
   # VS Code shows conflicts visually
   # Accept Current, Accept Incoming, or Accept Both
   ```

3. **Solve conflict:**
   ```bash
   # Edit file manually
   git add .
   git commit -m "Resolve conflicts"
   git push
   ```

---

## Getting Help

### Before Asking for Help

1. **Check documentation:**
   - [README.md](README.md)
   - [DEVELOPMENT.md](DEVELOPMENT.md)
   - [LIVE_PREVIEW.md](LIVE_PREVIEW.md)

2. **Useful commands:**
   ```bash
   flutter doctor -v      # Show full environment info
   flutter run -v         # Verbose output
   google-chrome --version  # Check Chrome version
   ```

3. **Check error message:**
   - Read full error, not just first line
   - Look for file:line reference
   - Search error message online

### Information to Include When Asking for Help

1. **Error message** - Full text
2. **What you were doing** - Steps to reproduce
3. **Platform** - Android/iOS/Web/Emulator/Device
4. **Output of:**
   ```bash
   flutter doctor -v
   flutter --version
   dart --version
   ```
5. **Relevant code** - If applicable

### Resources

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **Stack Overflow**: Tag [flutter]
- **GitHub Issues**: Search existing issues
- **Flutter Discord**: Getting help from community

### Common Search Terms

```
"Error type" + flutter
"package name" + issue
site:stackoverflow.com + [flutter]
github flutter issues + search term
```

---

## Quick Reference

### Most Common Fixes

| Issue | Quick Fix |
|-------|-----------|
| App won't start | `flutter clean && flutter pub get` |
| Build fails | `flutter clean && flutter pub get && flutter run` |
| Hot reload doesn't work | Press 'R' for hot restart |
| Can't find package | Run `flutter pub get` |
| Asset not found | Check `pubspec.yaml` assets section |
| Breakpoint doesn't work | Use F5 debug mode |
| Null error | Add null check with `if (var != null)` |
| Android build fails | Clean Gradle: `flutter clean` |
| iOS build fails | `cd ios && pod install && cd ..` |
| High memory usage | Reduce image sizes, dispose resources |

---

## Still Stuck?

1. **Read the error message again** - Often contains the answer
2. **Check recent changes** - What changed before error?
3. **Search documentation** - Likely already answered
4. **Try minimal example** - Strip down to simplest case
5. **Ask for help** - Include info above

---

**Remember: Every error is fixable. Take time to understand what went wrong, and you'll learn the system better! 🚀**
