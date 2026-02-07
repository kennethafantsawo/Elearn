# StudyForge - Makefile

.PHONY: help setup clean run test build

help:
	@echo "Available commands:"
	@echo "  make setup          - Setup the project"
	@echo "  make clean          - Clean build artifacts"
	@echo "  make run-android    - Run on Android"
	@echo "  make run-ios        - Run on iOS"
	@echo "  make run-web        - Run on Web"
	@echo "  make test           - Run tests"
	@echo "  make build-apk      - Build Android APK"
	@echo "  make build-ios      - Build iOS app"
	@echo "  make build-web      - Build Web app"

setup:
	@echo "Setting up StudyForge..."
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	mkdir -p assets/models assets/icons
	@echo "Setup complete!"

clean:
	@echo "Cleaning build artifacts..."
	flutter clean
	rm -rf build/
	rm -rf .dart_tool/
	@echo "Clean complete!"

run-android:
	@echo "Running on Android..."
	flutter run -d android

run-ios:
	@echo "Running on iOS..."
	flutter run -d ios

run-web:
	@echo "Running on Web..."
	flutter run -d web

test:
	@echo "Running tests..."
	flutter test

build-apk:
	@echo "Building Android APK..."
	flutter build apk --release

build-ios:
	@echo "Building iOS app..."
	flutter build ios --release

build-web:
	@echo "Building Web app..."
	flutter build web --release
