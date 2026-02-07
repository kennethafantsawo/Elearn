@echo off
REM StudyForge - Flutter Installation Script for Windows
REM Installs Flutter SDK and all dependencies

setlocal enabledelayedexpansion

echo.
echo ================================================
echo 🚀 StudyForge - Flutter Installation Script
echo ================================================
echo.

REM Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ❌ This script requires Administrator privileges
    echo    Please run Command Prompt as Administrator
    pause
    exit /b 1
)

echo Step 1: Checking prerequisites...
echo ==================================

REM Check for Git
where git >nul 2>&1
if %errorLevel% equ 0 (
    echo ✓ Git is installed
) else (
    echo ⚠ Git is NOT installed
    echo   Download from: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Check for Java (for Android development)
where java >nul 2>&1
if %errorLevel% equ 0 (
    java -version 2>&1 | findstr /R "version" >nul
    if !errorLevel! equ 0 (
        echo ✓ Java is installed
    ) else (
        echo ⚠ Java is NOT properly installed
    )
) else (
    echo ⚠ Java is NOT installed
    echo   Download from: https://www.oracle.com/java/technologies/javase-downloads.html
)

echo.
echo Step 2: Setting up directories...
echo ==================================

set FLUTTER_HOME=%USERPROFILE%\flutter

if exist "%FLUTTER_HOME%" (
    echo 📁 Flutter directory already exists at: %FLUTTER_HOME%
    set /p REINSTALL="Do you want to reinstall? (y/n) "
    if /i "!REINSTALL!"=="y" (
        echo Removing old Flutter installation...
        rmdir /s /q "%FLUTTER_HOME%"
    ) else (
        echo ✓ Using existing Flutter installation
        goto check_path
    )
)

:check_path
echo.
echo Step 3: Downloading Flutter SDK...
echo ====================================

if not exist "%FLUTTER_HOME%" (
    echo 📥 Downloading latest Flutter SDK...
    echo    This may take a few minutes...
    
    cd /d "%TEMP%"
    
    REM Download Flutter
    powershell -Command "(New-Object System.Net.ServicePointManager).SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object System.Net.WebClient).DownloadFile('https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.0-stable.zip', 'flutter.zip')"
    
    if exist "flutter.zip" (
        echo 📦 Extracting Flutter SDK...
        powershell -Command "Expand-Archive -Path flutter.zip -DestinationPath '%USERPROFILE%' -Force"
        del flutter.zip
        echo ✓ Flutter SDK extracted
    ) else (
        echo ❌ Failed to download Flutter
        pause
        exit /b 1
    )
) else (
    echo ✓ Flutter SDK exists
)

echo.
echo Step 4: Adding Flutter to PATH...
echo ==================================

setx PATH "%FLUTTER_HOME%\bin;%PATH%"

if %errorLevel% equ 0 (
    echo ✓ Added Flutter to system PATH
    echo   Note: Restart your terminal for changes to take effect
) else (
    echo ⚠ Failed to add to PATH
    echo   Try manually: setx PATH "%FLUTTER_HOME%\bin;%PATH%"
)

echo.
echo Step 5: Verifying Flutter installation...
echo ==========================================

where flutter >nul 2>&1
if %errorLevel% equ 0 (
    echo ✓ Flutter found in PATH
    flutter --version
) else (
    echo ⚠ Flutter not found - restart your terminal
    echo   Then test: flutter --version
)

echo.
echo Step 6: Running flutter doctor...
echo ==================================

flutter doctor -v

echo.
echo Step 7: Installing project dependencies...
echo ==========================================

cd /d /workspaces/Elearn
flutter pub get

echo.
echo ================================================
echo ✓ Installation Complete!
echo ================================================
echo.
echo 🚀 Next Steps:
echo    1. Restart Command Prompt or PowerShell
echo    2. Run the app: flutter run -d chrome
echo    3. Or use VS Code: Ctrl+Shift+B ^> Flutter: Run (Web)
echo.
echo 📖 Documentation:
echo    - QUICKSTART.md
echo    - LIVE_PREVIEW.md
echo    - DOCS_INDEX.md
echo.
echo Happy coding! 🎉
echo.
pause
