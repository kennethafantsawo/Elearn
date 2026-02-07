#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}StudyForge Build Setup${NC}"
echo -e "${GREEN}================================================${NC}\n"

# Check Flutter installation
echo -e "${YELLOW}Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter is not installed!${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter is installed${NC}\n"

# Get dependencies
echo -e "${YELLOW}Getting dependencies...${NC}"
flutter pub get
echo -e "${GREEN}✓ Dependencies installed${NC}\n"

# Build runner for Hive
echo -e "${YELLOW}Building Hive adapters...${NC}"
flutter pub run build_runner build --delete-conflicting-outputs
echo -e "${GREEN}✓ Hive adapters built${NC}\n"

# Create assets directories if they don't exist
echo -e "${YELLOW}Creating asset directories...${NC}"
mkdir -p assets/models
mkdir -p assets/icons
echo -e "${GREEN}✓ Asset directories ready${NC}\n"

echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}================================================${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo "  flutter run -d android   # Run on Android"
echo "  flutter run -d ios        # Run on iOS"
echo "  flutter run -d web        # Run on Web"
echo -e ""
