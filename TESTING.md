# 🧪 Testing Guide - StudyForge

Complete guide for testing StudyForge features and ensuring everything works correctly.

## Testing Overview

This guide covers:
- Unit and widget tests
- Manual testing procedures
- Test data and samples
- Debugging test failures
- CI/CD testing

## Prerequisites

Before testing, ensure:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Testing Environments

### Web (Chrome)
Best for: Quick testing, debugging, UI verification
```bash
flutter run -d chrome
```

### Android Emulator
Best for: Full environment testing, permission testing
```bash
flutter run -d emulator-5554
```

### iOS Simulator
Best for: iOS-specific features, native integration
```bash
flutter run -d macos
```

## Unit Tests

### Running All Unit Tests
```bash
flutter test
```

### Running Specific Test File
```bash
flutter test test/unit/ai_service_test.dart
```

### Running with Coverage
```bash
flutter test --coverage
lcov --list coverage/lcov.info
```

## Widget Tests

### Running Widget Tests
```bash
flutter test test/widget/
```

### Running with Verbose Output
```bash
flutter test --verbose test/widget/
```

## Integration Tests

### Setup Integration Testing
```bash
flutter pub add integration_test
```

### Running Integration Tests
```bash
flutter test integration_test/
```

## Manual Testing Checklist

### Splash Screen
- [ ] App starts
- [ ] Splash screen displays
- [ ] "StudyForge" title visible
- [ ] "Révision intelligente" subtitle visible
- [ ] Loading indicator spins
- [ ] After 2 seconds, navigates to home
- [ ] No crashes

### Home Page
- [ ] Home page loads after splash
- [ ] AppBar displays "StudyForge"
- [ ] Layout is responsive
- [ ] No layout overflow
- [ ] Text is readable
- [ ] Colors match design

### Document Upload
- [ ] Upload button visible
- [ ] Click opens file picker
- [ ] Can select PDF files
- [ ] Can select DOCX files
- [ ] Can select TXT files
- [ ] Can select MD files
- [ ] Invalid files rejected with error
- [ ] Selected files appear in list
- [ ] Can delete files from list
- [ ] Can upload multiple files
- [ ] File size validates correctly
- [ ] Max document count enforces (20 limit)

### Generation Controls
- [ ] Generation widget visible
- [ ] "Mode:" label shows options
- [ ] "General" chip selectable
- [ ] "Precise" chip selectable
- [ ] Only one mode selected at time
- [ ] "Generate Notes" button visible
- [ ] Button clickable
- [ ] On click, loading indicator shows
- [ ] Loading state maintains during generation
- [ ] Results display in bottom sheet
- [ ] Export button available
- [ ] Close button works
- [ ] Can generate multiple times

### Error Handling
- [ ] Try invalid file format → error message
- [ ] Try file > size limit → error message
- [ ] Try upload > 20 documents → error message
- [ ] Try generate with no files → error message
- [ ] Check console for no unhandled exceptions

## Test Data

### Sample Files
Create these in `assets/test_data/`:

```bash
# Create sample files
mkdir -p assets/test_data/

# Create sample PDF
touch assets/test_data/sample.pdf

# Create sample DOCX
touch assets/test_data/sample.docx

# Create sample TXT
cat > assets/test_data/sample.txt << 'EOF'
Flutter Development Guide

Flutter is a cross-platform development framework by Google.
It allows building beautiful applications for mobile, web, and desktop.

Key Features:
- Hot Reload - Instant code changes
- Beautiful UI - Material Design
- Fast Performance - Optimized rendering
- Multi-platform - One codebase
EOF

# Create sample Markdown
cat > assets/test_data/sample.md << 'EOF'
# Dart Programming

## Variables
```dart
var name = 'John';
int age = 30;
dynamic value = 42;
```

## Functions
```dart
void sayHello() {
  print('Hello!');
}

int add(int a, int b) => a + b;
```
EOF
```

## Test Scenarios

### Scenario 1: Basic Document Upload
1. Open app
2. Click "Upload Documents"
3. Select sample.pdf
4. Verify file appears in list
5. ✅ PASS if file listed

### Scenario 2: Multiple File Upload
1. Open app
2. Upload sample.pdf
3. Upload sample.docx
4. Upload sample.txt
5. Verify all 3 appear in list
6. ✅ PASS if all listed

### Scenario 3: File Deletion
1. Upload 2 files
2. Delete first file
3. Verify only second file remains
4. ✅ PASS if deletion works

### Scenario 4: Note Generation
1. Upload sample.txt
2. Select "General" mode
3. Click "Generate Notes"
4. Wait for processing
5. View results in bottom sheet
6. ✅ PASS if results show

### Scenario 5: Error Handling
1. Try to upload invalid file (e.g., .exe)
2. Verify error message shows
3. ✅ PASS if error handled gracefully

### Scenario 6: Data Persistence
1. Upload document
2. Restart app
3. Verify document still there
4. ✅ PASS if data persisted (uses Hive)

## Performance Testing

### Load Testing
```bash
# Test with large number of documents
# Upload 20 documents (max limit)
# Verify no lag or crashes
# Check memory usage
```

### Generation Performance
```bash
# Generate notes from large document
# Monitor:
# - Generation time
# - Memory usage
# - CPU usage
```

### Built-in Profiling
```bash
flutter run --profile
# View performance overlay in app
# Press 'p' in terminal
```

## Debugging During Tests

### Enable Debug Output
```bash
flutter run -v
```

### Check Logs
```bash
# In Android
adb logcat

# In iOS
xcrun log show --predicate 'eventType == "logEvent"'
```

### Breakpoint Debugging
1. Set breakpoint in VS Code
2. Run with `F5` (debug mode)
3. App pauses at breakpoint
4. Inspect variables in debug panel

## Platform-Specific Testing

### Android Testing
```bash
# List emulators
emulator -list-avds

# Start emulator
emulator -avd Pixel_4_API_31

# Test on device
adb devices
flutter run -d <device-id>
```

### iOS Testing
```bash
# Start simulator
open -a Simulator

# Test in simulator
flutter run -d macos

# Test on device
# Connect device via USB
# Trust device in Settings
flutter run
```

### Web Testing
```bash
# Test in Chrome
flutter run -d chrome

# Test in Firefox
flutter run -d edge

# Test in Edge
flutter run -d macos
```

## Test Reports

### Code Coverage Report
```bash
flutter test --coverage
```

Output: `coverage/lcov.info`

Generate HTML report:
```bash
# Install genhtml
sudo apt-get install lcov  # Linux
brew install lcov          # macOS

# Generate HTML
genhtml -o coverage/html coverage/lcov.info
open coverage/html/index.html  # View in browser
```

### Test Results
After running tests, check:
- Number of tests passed
- Number of tests failed
- Execution time
- Code coverage percentage

## Continuous Integration

### GitHub Actions Setup
See [DEVELOPMENT.md](DEVELOPMENT.md) § "CI/CD"

### Local CI Simulation
```bash
# Run full test suite locally
./scripts/ci.sh
```

## Known Test Issues

### Issue: Build Runner Fails
**Solution:**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Tests Timeout
**Solution:**
```bash
flutter test --timeout=30s
```

### Issue: Emulator Not Found
**Solution:**
```bash
flutter emulators --launch <emulator-id>
```

### Issue: Hot Reload Fails
**Solution:**
1. Stop app (q in terminal)
2. Run again: `flutter run -d chrome`

## Test Coverage Goals

### Target Coverage
- Unit tests: 80%+
- Widget tests: 60%+
- Integration tests: Good coverage of main flows

### Critical Paths to Test
1. ✅ Document upload and validation
2. ✅ File deletion
3. ✅ Note generation
4. ✅ Error handling
5. ✅ App startup and splash
6. ✅ Data persistence with Hive

## Regression Testing

Before each release, verify:
- [ ] Splash screen works
- [ ] Document upload works
- [ ] File validation works
- [ ] Note generation works
- [ ] App doesn't crash on errors
- [ ] Previous device's data loads
- [ ] App responds to input
- [ ] UI renders correctly on all platforms

## User Acceptance Testing (UAT)

### UAT Checklist
- [ ] User can upload documents
- [ ] User can generate study notes
- [ ] Notes are relevant and accurate
- [ ] UI is intuitive
- [ ] App doesn't crash
- [ ] Performance is acceptable
- [ ] Data persists between sessions

### UAT Feedback Form
```
What aspect did you test?
[ ] Document Upload
[ ] Note Generation
[ ] Error Handling
[ ] Performance

Rating (1-5):
[ ] 1 - Major Issues
[ ] 2 - Significant Issues
[ ] 3 - Some Issues
[ ] 4 - Minor Issues
[ ] 5 - Excellent

Comments:
________________________
```

## Testing Timeline

### Daily Testing
- Manual smoke tests (5 min)
- Quick feature verification

### Before Commit
- Run relevant unit tests
- Manual test your changes
- Check for console errors

### Weekly Testing
- Full test suite
- Cross-platform testing
- Performance testing

### Before Release
- Full regression testing
- UAT verification
- Performance benchmarks

## Quick Test Commands

```bash
# Quick smoke test (all tests)
flutter test

# Specific test file
flutter test test/unit/document_service_test.dart

# Watch mode (re-run on changes)
flutter test --watch

# Generate coverage report
flutter test --coverage

# Run with verbose output
flutter test --verbose

# Run only failed tests
flutter test --fail-fast
```

## Test Outputs

### Successful Test
```
✓ Document Service Tests (150ms)
✓ AI Service Tests (300ms)
══════════════════════════════════════════
All tests passed! (3 tests, 450ms)
```

### Failed Test
```
✗ Document Service Tests
  ✗ test case name (failed assertion)
════════════════════════════════════════════
3 tests, 1 failed - 500ms
```

## Troubleshooting Tests

### Tests Not Found
```bash
flutter clean
flutter pub get
flutter test
```

### Tests Fail Intermittently
- Check for race conditions
- Verify test isolation
- Check for timing-dependent code

### Device Not Detected
```bash
# Check connected devices
flutter devices

# Start an emulator first
emulator -avd <name>
flutter run
```

## Next Steps

1. **Run smoke tests**: `flutter test`
2. **Manual testing**: Follow checklist above
3. **Platform testing**: Test on Android/iOS/Web
4. **Performance testing**: Check responsiveness
5. **Regression testing**: Before each release

---

**Need help debugging?** See [DEVELOPMENT.md](DEVELOPMENT.md) § "Debugging"

**Want to automate testing?** See [DEVELOPMENT.md](DEVELOPMENT.md) § "CI/CD"

**Questions?** Check [DOCS_INDEX.md](DOCS_INDEX.md)
