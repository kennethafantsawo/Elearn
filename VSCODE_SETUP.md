# 🚀 VS Code Live Preview - Step by Step

## Step 1: Install VS Code Extensions

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Install these extensions:
   - **Dart Code** (by Dart Code)
   - **Flutter** (by Dart Code)
   - **Error Lens** (optional, for better error display)
   - **GitLens** (optional, for git integration)

---

## Step 2: Open the Project

1. File → Open Folder → Select `/workspaces/Elearn`
2. Wait for Dart/Flutter to initialize (check bottom status bar)

---

## Step 3: Quick Setup in Terminal

Open integrated terminal (Ctrl+` or View → Terminal) and run:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

You should see:
```
✓ Running build... 
✓ Build complete!
```

---

## Step 4: Choose Your Platform

### Option A: Run on Web (Easiest)

**Method 1 - Using Tasks:**
1. Press `Ctrl+Shift+B` (Tasks menu)
2. Select "Flutter: Run (Web)"
3. Chrome opens automatically

**Method 2 - Using Terminal:**
```bash
flutter run -d chrome
```

**Method 3 - Using Debug:**
1. Press `F5`
2. Select "Flutter: Debug (Web)"

---

### Option B: Run on Android

**Prerequisites:** Android emulator must be running

```bash
# List devices
flutter devices

# Run on Android
flutter run -d android
```

---

### Option C: Run on iOS

**Prerequisites:** Xcode and iOS simulator (macOS only)

```bash
flutter run -d ios
```

---

## Step 5: Using Hot Reload

Once the app is running:

### Auto Hot Reload
1. Edit a file (e.g., `lib/theme.dart`)
2. Save file (Ctrl+S / Cmd+S)
3. App updates automatically! ✨

### Manual Hot Reload
In terminal where app is running:
- Press `r` → Hot reload
- Press `R` → Hot restart

---

## Step 6: Interact with the App

### In Web Browser:
```
Web app opens at: http://localhost:XXXXX

Splash Screen (2 seconds)
        ↓
Home Page with:
  - AppBar "StudyForge"
  - Upload button
  - (Generation controls appear after upload)
```

### In Mobile Emulator:
- Tap "Ajouter des documents"
- Select a file from your device
- See file in list
- Generation controls appear

---

## 🎯 Quick Action Buttons in VS Code

| Action | Shortcut | Location |
|--------|----------|----------|
| Run App | Click ▶️ at top | Status bar |
| Stop App | Press `q` | Terminal |
| Hot Reload | `r` | Terminal |
| Open DevTools | `d` | Terminal (Web) |
| Format Code | `Shift+Alt+F` | Anywhere |
| Find Issues | `Ctrl+J` | Problems panel |

---

## 🐛 Debugging in VS Code

### 1. Set Breakpoints
```dart
// lib/pages/home_page.dart

void methodName() {
  // Click on line number to set breakpoint
  print('Debug point here');  // ← Click gutter here
}
```

### 2. Run Debugger
Press `F5` or Debug menu → Start

### 3. Debug Controls
- ▶️ Continue
- ⏸️ Step Over
- ⬇️ Step Into
- ⬆️ Step Out

### 4. Inspect Variables
Hover over variables to see values

---

## 📊 What You'll See

### Terminal Output
```
Launching lib/main.dart on Chrome in debug mode...
lib/main.dart is being served at http://localhost:54321
Chrome DevTools available at http://localhost:54322
```

### Browser Window (Web)
Automatic Chrome window opens showing:
- Splash screen for 2 seconds
- Then home page with UI elements
- Fully interactive app

### Status Bar
Bottom of VS Code shows:
- ✓ Attached debugger
- Device info
- Frame rate

---

## 🎨 Live Editing Example

### Before:
```dart
static ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFF1F6FEB),  // Blue
```

### Edit it:
```dart
static ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFFFF5722),  // Orange
```

### Save (Ctrl+S) → Instantly see orange theme!

---

## 📱 Testing File Upload

1. App is running
2. Click "Ajouter des documents" button
3. In web browser:
   - Opens file picker
   - Select any file
   - File is simulated as uploaded
   - Appears in list

4. Click × to remove
5. Generation controls appear after adding files

---

## 🖥️ Web DevTools (Advanced)

In browser while web app runs:

**Option 1:**
- Right-click → Inspect

**Option 2:**
- Press `F12` in browser

**Option 3:**
- Flutter DevTools: Press `d` in terminal

---

## 💡 Pro Tips

### Tip 1: Multiple Terminals
Keep running:
- Terminal 1: `flutter run -d chrome`
- Terminal 2: `flutter pub run build_runner watch`

Auto-rebuild on code generation changes!

### Tip 2: Side by Side Editing
1. Open `lib/main.dart`
2. Open `lib/theme.dart`
3. Split editor (Ctrl+\)
4. Edit theme and see changes live

### Tip 3: Search Files
- Ctrl+P: Quick open file
- Ctrl+Shift+F: Search in project
- Ctrl+G: Go to line

### Tip 4: Minimap
- Right edge shows code overview
- Scroll with minimap
- Click to navigate

---

## 🛑 Stop the App

In terminal where app is running:
```
Press q → Exits app
```

Or click Stop button in VS Code

---

## 📖 Full Project Structure (VS Code)

```
Elearn/
├── lib/
│   ├── main.dart              ← Start here
│   ├── theme.dart             ← Edit colors
│   ├── constants.dart         ← App constants
│   ├── pages/
│   │   ├── home_page.dart     ← Main UI
│   │   └── splash_screen.dart ← Splash
│   ├── services/
│   │   ├── ai_service.dart    ← AI logic
│   │   └── document_service.dart
│   ├── models/
│   │   └── document_model.dart
│   └── widgets/
│       ├── document_upload_widget.dart
│       └── generation_controls_widget.dart
├── pubspec.yaml               ← Dependencies
└── analysis_options.yaml      ← Lint rules
```

---

## 📋 Workflow Checklist

- [ ] Open project in VS Code
- [ ] Install Flutter extension
- [ ] Run `flutter pub get`
- [ ] Run `flutter pub run build_runner build`
- [ ] Press `Ctrl+Shift+B` → Select "Flutter: Run (Web)"
- [ ] Chrome opens with app
- [ ] Edit `lib/theme.dart` color
- [ ] Save file
- [ ] See changes instantly (hot reload)
- [ ] Test file upload
- [ ] Test generation controls
- [ ] Press `q` to stop

---

## 🎓 Learning Next

After seeing the app running:

1. **Explore the Code**
   - Read comments in lib/main.dart
   - Check lib/pages/home_page.dart
   - Understand the structure

2. **Modify the UI**
   - Change colors in lib/theme.dart
   - Change text in lib/pages/home_page.dart
   - See hot reload in action

3. **Add Features**
   - Create new widgets
   - Add new services
   - Connect to AI

---

## 🎉 You're Ready!

Ready to see StudyForge in action?

**Choose one:**

```bash
# Easiest - Web
ctrl+shift+b → Flutter: Run (Web)

# Or Terminal
flutter run -d chrome
```

Then see your app come to life! 🚀

---

**Need help?** See LIVE_PREVIEW.md or DEVELOPMENT.md
