# ✅ Setup Checklist - StudyForge

Use this checklist to ensure everything is set up correctly. Follow the steps in order.

## Phase 1: Pre-Setup (5 minutes)

- [ ] I have the StudyForge project folder open
- [ ] I can see `lib/`, `android/`, `ios/`, `web/` folders
- [ ] I have a terminal/command prompt open
- [ ] I'm in the `/workspaces/Elearn` directory
- [ ] I can see all these files:
  - [ ] `START_HERE.md`
  - [ ] `INSTALLATION.md`
  - [ ] `QUICKSTART.md`
  - [ ] `pubspec.yaml`
  - [ ] `install_flutter.sh` or `install_flutter.bat`

---

## Phase 2: Flutter Installation (10-15 minutes)

Determine if you need Flutter:

```bash
flutter --version
```

- [ ] If "flutter: command not found", continue to Phase 2A
- [ ] If version is shown (e.g., "3.19.0"), skip to Phase 3

### Phase 2A: Install Flutter

**For macOS/Linux:**
```bash
chmod +x install_flutter.sh
./install_flutter.sh
```
- [ ] Script runs without errors
- [ ] Script says "Installation Complete!"
- [ ] Script says "✓ Flutter installed successfully"

**For Windows:**
```bash
install_flutter.bat
```
- [ ] Script runs without errors
- [ ] Script says "Installation Complete!"
- [ ] Script says "✓ Flutter found in PATH"

**After installation (all platforms):**
```bash
# Close and reopen terminal
flutter --version
```
- [ ] Shows version (e.g., "Flutter 3.19.0")
- [ ] No "command not found" error

---

## Phase 3: Project Setup (5 minutes)

```bash
cd /workspaces/Elearn
```

- [ ] Terminal is in the Elearn directory
- [ ] `pwd` shows `/workspaces/Elearn` or `cd .` confirms we're there

### Install Dependencies
```bash
flutter pub get
```

- [ ] No errors in output
- [ ] Output ends with "Got dependencies"
- [ ] Terminal shows list of packages

### Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

- [ ] No errors in output
- [ ] Output shows "Successfully generated"

---

## Phase 4: First Run (10 minutes)

### Option A: Run on Web (Easiest)

```bash
flutter run -d chrome
```

- [ ] Chrome opens automatically
- [ ] App loads in browser
- [ ] **See splash screen with:**
  - [ ] Blue gradient background
  - [ ] School emoji (🎓) icon
  - [ ] "StudyForge" title
  - [ ] "Révision intelligente" subtitle
  - [ ] Loading spinner animation
- [ ] **After 2 seconds, see home page with:**
  - [ ] AppBar saying "StudyForge"
  - [ ] Upload button
  - [ ] Generation controls
- [ ] No error messages in console
- [ ] No red error boxes in app

### Option B: Run in VS Code

- [ ] Open VS Code
- [ ] File > Open Folder > Select `/workspaces/Elearn`
- [ ] Press `Ctrl+Shift+B` (Windows/Linux) or `Cmd+Shift+B` (macOS)
- [ ] Select `Flutter: Run (Web)` from dropdown
- [ ] Chrome opens with app loaded
- [ ] See splash screen → home page

---

## Phase 5: Verify Everything Works (5 minutes)

In the running app:

### Splash Screen Test
- [ ] Splash shows for about 2 seconds
- [ ] Splash transitions smoothly to home page
- [ ] No crashes or errors

### UI Responsiveness
- [ ] Home page loads without crash
- [ ] AppBar is visible
- [ ] Buttons are clickable
- [ ] Layout looks reasonable
- [ ] Text is readable

### Code Quality Check
```bash
flutter analyze
```
- [ ] Shows "✓ No issues found!"
- [ ] No warnings about code

---

## Phase 6: Setup Complete Verification

In the same terminal, try these commands:

```bash
# Check Flutter version
flutter --version

# Check Dart version
dart --version

# Show Flutter info
flutter doctor
```

**Expected output:**
- [ ] Flutter version: 3.13.0 or higher
- [ ] Dart version matches (done automatically)
- [ ] `flutter doctor` shows mostly ✓ marks

---

## Phase 7: Optional - VS Code Setup (10 minutes)

Recommended for better development experience:

```bash
# Install recommended extensions
Ctrl+Shift+X → Install extensions from extensions.json
```

- [ ] Dart Code extension installed
- [ ] Flutter extension installed
- [ ] Error Lens extension installed (optional)
- [ ] GitLens extension installed (optional)

**Test debugging (optional):**
- [ ] Set breakpoint on a line (click left side)
- [ ] Press F5 to start debugger
- [ ] App pauses at breakpoint
- [ ] Can inspect variables

---

## Phase 8: Successful Setup Confirmation

You should now have:

- [ ] Flutter installed and working
- [ ] Project dependencies installed
- [ ] Code generated and compiled
- [ ] App running on Chrome (or Android/iOS)
- [ ] No crashes or errors
- [ ] Good-looking UI with splash screen
- [ ] All buttons responsive
- [ ] Terminal shows no errors

---

## Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| `flutter: command not found` | Run `./install_flutter.sh` (or `.bat` on Windows) |
| `pub get failed` | Try `flutter clean && flutter pub get` |
| `build_runner failed` | Already resolved by build_runner command |
| Chrome doesn't open | Try: `flutter run -d chrome --web-port=8080` |
| App crashes on startup | Try: `flutter clean && flutter pub get && flutter run -d chrome` |
| Can't find dependencies | Close and reopen terminal after `flutter pub get` |

---

## Next Steps

Congratulations! Your setup is complete. Now:

1. **Read**: [DEVELOPMENT.md](DEVELOPMENT.md) to start coding
2. **Explore**: The flutter app code in `lib/`
3. **Try**: Uploading a document and generating notes
4. **Learn**: Check [DOCS_INDEX.md](DOCS_INDEX.md) for all documentation

---

## Checkpoint Summary

Check these boxes as you complete each phase:

| Phase | Items | Complete |
|-------|-------|----------|
| 1: Pre-Setup | 5 items | [ ] |
| 2: Flutter | 4 items | [ ] |
| 3: Dependencies | 3 items | [ ] |
| 4: First Run | 8 items | [ ] |
| 5: Verify | 4 items | [ ] |
| 6: Quality Check | 3 items | [ ] |
| 7: VS Code (optional) | 4 items | [ ] |
| 8: Final Check | 8 items | [ ] |

**Total: 39 items to verify**

---

## Reference Checklist Commands

Keep these commands handy:

```bash
# Verify installation
flutter --version
flutter doctor -v

# Setup
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Run
flutter run -d chrome              # Web
flutter run                        # Android/iOS

# Clean (if issues)
flutter clean
flutter pub get

# Code quality
flutter analyze
dart format lib/

# Test
flutter test
```

---

## Helpful Links

| Task | Link |
|------|------|
| Full Installation | [INSTALLATION.md](INSTALLATION.md) |
| Quick Start | [QUICKSTART.md](QUICKSTART.md) |
| Running App | [LIVE_PREVIEW.md](LIVE_PREVIEW.md) |
| VS Code Setup | [VSCODE_SETUP.md](VSCODE_SETUP.md) |
| Development | [DEVELOPMENT.md](DEVELOPMENT.md) |
| Troubleshooting | [TROUBLESHOOTING.md](TROUBLESHOOTING.md) |
| All Docs | [DOCS_INDEX.md](DOCS_INDEX.md) |

---

## Checklist Status

Once you complete all checkboxes:

✅ **Flutter is installed**
✅ **Dependencies are installed**
✅ **Code is generated**
✅ **App runs without errors**
✅ **UI looks professional**
✅ **You're ready to code!**

---

## Still Have Issues?

1. **Reread**: The phase you're stuck on
2. **Search**: Error message in [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
3. **Check**: [INSTALLATION.md](INSTALLATION.md) if Flutter-related
4. **Look at**: [LIVE_PREVIEW.md](LIVE_PREVIEW.md) for alternative running methods
5. **Ask**: See resources in [DOCS_INDEX.md](DOCS_INDEX.md#support)

---

## Print This Page?

🖨️ You can print this checklist and check items off as you go. It works as a guide for the entire setup process!

---

**Happy coding! 🚀**
