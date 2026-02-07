#!/bin/bash

# StudyForge - Live Preview Setup Script
# This script sets up and runs the StudyForge app for live viewing

set -e

echo "================================================"
echo "StudyForge - Live Preview Setup"
echo "================================================"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Flutter
echo -e "${YELLOW}Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}✗ Flutter is not installed${NC}"
    echo "Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit 1
fi
echo -e "${GREEN}✓ Flutter is installed${NC}"

# Check connected devices
echo ""
echo -e "${YELLOW}Checking available devices...${NC}"
flutter devices
echo ""

# Show options
echo -e "${YELLOW}Select a platform to run on:${NC}"
echo "1. Web (Chrome)"
echo "2. Android (Emulator or Device)"
echo "3. iOS (Simulator)"
echo "4. Setup Only (No Launch)"
echo ""

read -p "Enter your choice (1-4): " CHOICE

# Setup
echo ""
echo -e "${YELLOW}Setting up project...${NC}"
flutter pub get
echo -e "${GREEN}✓ Dependencies installed${NC}"

echo ""
echo -e "${YELLOW}Building code generation...${NC}"
flutter pub run build_runner build --delete-conflicting-outputs
echo -e "${GREEN}✓ Code generation complete${NC}"

# Run based on choice
echo ""
case $CHOICE in
    1)
        echo -e "${YELLOW}Launching on Web (Chrome)...${NC}"
        flutter run -d chrome
        ;;
    2)
        echo -e "${YELLOW}Launching on Android...${NC}"
        flutter run -d android
        ;;
    3)
        echo -e "${YELLOW}Launching on iOS...${NC}"
        flutter run -d ios
        ;;
    4)
        echo -e "${GREEN}Setup complete!${NC}"
        echo ""
        echo "To run the app:"
        echo "  flutter run -d web       # Web"
        echo "  flutter run -d android   # Android"
        echo "  flutter run -d ios       # iOS"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}Done!${NC}"
echo -e "${GREEN}================================================${NC}"
