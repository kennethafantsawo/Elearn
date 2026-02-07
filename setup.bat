@echo off
REM StudyForge Build Setup for Windows

setlocal enabledelayedexpansion

echo.
echo ==================================================
echo StudyForge Build Setup
echo ==================================================
echo.

REM Check Flutter installation
echo Checking Flutter installation...
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Flutter is not installed!
    exit /b 1
)
echo OK - Flutter is installed
echo.

REM Get dependencies
echo Getting dependencies...
flutter pub get
if errorlevel 1 (
    echo ERROR: Failed to get dependencies
    exit /b 1
)
echo OK - Dependencies installed
echo.

REM Build runner for Hive
echo Building Hive adapters...
flutter pub run build_runner build --delete-conflicting-outputs
if errorlevel 1 (
    echo ERROR: Failed to build Hive adapters
    exit /b 1
)
echo OK - Hive adapters built
echo.

REM Create assets directories if they don't exist
echo Creating asset directories...
if not exist "assets\models" mkdir assets\models
if not exist "assets\icons" mkdir assets\icons
echo OK - Asset directories ready
echo.

echo ==================================================
echo Setup Complete!
echo ==================================================
echo.
echo Next steps:
echo   flutter run -d android   - Run on Android
echo   flutter run -d ios        - Run on iOS  
echo   flutter run -d web        - Run on Web
echo.

endlocal
