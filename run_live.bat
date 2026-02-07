@echo off
REM StudyForge - Live Preview Setup Script for Windows

cls
echo ================================================
echo StudyForge - Live Preview Setup
echo ================================================
echo.

REM Check Flutter
echo Checking Flutter installation...
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Flutter is not installed
    echo Please install Flutter from https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)
echo OK - Flutter is installed

REM Check connected devices
echo.
echo Checking available devices...
flutter devices
echo.

REM Show options
echo Select a platform to run on:
echo 1. Web ^(Chrome^)
echo 2. Android ^(Emulator or Device^)
echo 3. iOS ^(Simulator^)
echo 4. Setup Only ^(No Launch^)
echo.

set /p CHOICE="Enter your choice (1-4): "

REM Setup
echo.
echo Setting up project...
flutter pub get
echo OK - Dependencies installed

echo.
echo Building code generation...
flutter pub run build_runner build --delete-conflicting-outputs
echo OK - Code generation complete

REM Run based on choice
echo.
if "%CHOICE%"=="1" (
    echo Launching on Web ^(Chrome^)...
    flutter run -d chrome
) else if "%CHOICE%"=="2" (
    echo Launching on Android...
    flutter run -d android
) else if "%CHOICE%"=="3" (
    echo Launching on iOS...
    flutter run -d ios
) else if "%CHOICE%"=="4" (
    echo Setup complete!
    echo.
    echo To run the app:
    echo   flutter run -d chrome   - Web
    echo   flutter run -d android  - Android
    echo   flutter run -d ios      - iOS
) else (
    echo Invalid choice
    exit /b 1
)

echo.
echo ================================================
echo Done!
echo ================================================
pause
