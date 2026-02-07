# 👀 StudyForge - Visual Preview Guide

## What You'll See When You Run the App

### 📺 Splash Screen (First 2 seconds)

```
┌────────────────────────────────────┐
│                                    │
│                                    │
│            ┌──────────┐            │
│            │   🎓    │            │
│            └──────────┘            │
│                                    │
│           StudyForge               │
│         Révision intelligente      │
│                                    │
│              ⟳ Loading             │
│                                    │
│                                    │
└────────────────────────────────────┘
```

**Features:**
- Blue gradient background
- School icon in the center
- App name and tagline
- Loading indicator

---

### 🏠 Home Page (After splash)

```
┌────────────────────────────────────┐
│ ┌──────────────────────────────┐  │
│ │         StudyForge           │◀─┤ AppBar (Blue #1F6FEB)
│ └──────────────────────────────┘  │
│                                    │
│ Application d'étude locale         │
│ (Title - Large Bold Text)          │
│                                    │
│ ┌────────────────────────────────┐ │
│ │  📁 Ajouter des documents     │ │
│ └────────────────────────────────┘ │ Upload Button (ElevatedButton)
│                                    │
│ 📄 Sample Document 1.pdf   [×]    │ (Shown after upload)
│ 📄 Sample Document 2.docx  [×]    │
│                                    │
│ ────────────────────────────────── │ Divider (if docs present)
│                                    │
│ ┌────────────────────────────────┐ │
│ │ Options de génération          │ │
│ │                                │ │ Generation Controls
│ │ ○ Mode Général  ● Mode Précis  │ │ (Card with filters)
│ │                                │ │
│ │  🤖 Générer la fiche           │ │
│ │     de révision                │ │
│ └────────────────────────────────┘ │
│                                    │
│ Formats: PDF, DOCX, TXT, EPUB     │
│ Max 20 documents                  │ Hint Text
│                                    │
└────────────────────────────────────┘
```

**Interactive Elements:**
- 📱 Tap "Ajouter des documents" → File picker opens
- 📄 Tap [×] button → Remove document
- 🎚️ Toggle "Mode Général/Précis" → Change generation type
- 🤖 Tap "Générer" → Start generation (when docs added)

---

## 🎨 Color Scheme

| Element | Color | Hex |
|---------|-------|-----|
| Primary | Blue | #1F6FEB |
| Primary Dark | Dark Blue | #0D47A1 |
| Accent | Cyan | #03DAC6 |
| Error | Red | #B00020 |
| Background | White | #FFFFFF |
| Surface | Light Gray | #F5F5F5 |
| Text | Dark Gray | #212121 |
| Hint | Medium Gray | #757575 |

---

## 🔄 User Flow

```
Start App
    ↓
Splash Screen (2s)
    ↓
Home Page
    ├─→ Click "Add Documents"
    │   ├─→ File Picker Opens
    │   ├─→ Select File
    │   └─→ File Listed
    │
    └─→ When Documents Added
        ├─→ Generation Controls Visible
        ├─→ View Documents Listed
        ├─→ Choose Generation Mode
        └─→ Tap "Generate" → Notes Appear
```

---

## 📋 Feature Checklist - What Works

### ✅ Upload Widget
- [x] File picker button
- [x] File validation (PDF, DOCX, TXT, EPUB)
- [x] Max 20 documents validation
- [x] File listing with delete button
- [x] Error dialog on validation

### ✅ Generation Controls
- [x] Generation mode selection (General/Precise)
- [x] Dynamic visibility (show when docs added)
- [x] Loading state indicator
- [x] Generate button with icon
- [x] Results display in bottom sheet

### ✅ Home Page
- [x] AppBar with title
- [x] Page title
- [x] Upload widget integration
- [x] Generation widget integration
- [x] State management
- [x] Clean layout

### ✅ UI/UX
- [x] Material Design 3
- [x] Proper spacing and padding
- [x] Color scheme implemented
- [x] Responsive layout
- [x] Error handling

---

## 🎯 Running Commands

### Using Scripts (Easiest)

**macOS/Linux:**
```bash
bash run_live.sh
```

**Windows:**
```cmd
run_live.bat
```

### Direct Flutter Commands

**Web (Recommended for first test):**
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

---

## 🖥️ Web Browser View

When running on `chrome`:
- URL: `http://localhost:<port>`
- Responsive: Works on mobile view too
- DevTools: Right-click → Inspect
- Hot Reload: Works on file save

---

## 📱 Mobile Emulator View

- Portrait orientation by default
- Full-screen layout
- Touch interactions
- System bars visible

---

## 🎓 What to Test

### Basic UI
- [ ] Splash screen appears for 2 seconds
- [ ] Transitions smoothly to home page
- [ ] AppBar displays correctly
- [ ] All text is readable
- [ ] Colors match theme

### Upload Functionality
- [ ] "Ajouter des documents" button clickable
- [ ] File picker opens on click
- [ ] Can select a file
- [ ] File appears in list
- [ ] Can delete file with [×]
- [ ] Max 20 files validation works
- [ ] Invalid file format shows error

### Generation
- [ ] Generation controls hidden initially
- [ ] Appears after adding documents
- [ ] Mode selection works (Général/Précis)
- [ ] Loading indicator works
- [ ] Results shown in bottom sheet

---

## 🐛 Troubleshooting

### App Won't Run
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

### Hot Reload Not Working
- Save file → Auto-reload should happen
- Or press `r` in terminal

### Port Already in Use (Web)
```bash
flutter run -d chrome --web-port 8181
```

### Device Not Found
```bash
flutter devices  # List available devices
flutter run -d <device_id>
```

---

## 🎬 Next Steps

1. **Run the app** → See the UI
2. **Test file upload** → Try adding a document
3. **Test generation** → See generation controls
4. **Explore code** → Open lib/ files
5. **Modify UI** → Change colors/text and hot reload

---

## 💡 Tips for Development

- **Hot Reload**: After saving → app updates instantly (state preserved)
- **Hot Restart**: Press `R` → app restarts (state lost)
- **DevTools**: In web, press `i` to open DevTools
- **Logging**: Use `print()` statements to debug
- **Breakpoints**: Use VS Code debugging feature

---

## 🎨 Styling Tips

To experiment with colors:
```dart
// In lib/theme.dart
static const primaryColor = Color(0xFF1F6FEB); // Change this
```

Save → Hot reload → Colors update immediately!

---

## 📞 Visual Reference

### Icon Usage
- 📁 Upload file
- 🤖 AI generation
- ✨ Features
- 📄 Document
- ⚙️ Settings
- × Close/Delete

### Animation Indicators
- ⟳ Loading
- ✓ Success
- ⚠️ Warning
- ✗ Error

---

**Ready to see your app?**

```bash
flutter run -d chrome
```

🚀 Launch and explore! 🎉
