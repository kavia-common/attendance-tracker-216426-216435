# Analyzer Project Root Guidance

This is the Flutter app project root.

- Entrypoint: lib/main.dart
- Pubspec: pubspec.yaml
- Android: android/
- Assets declared in pubspec: .env, assets/

Tools and CI scripts must set the working directory to this folder before running Flutter commands like:
- flutter pub get
- flutter analyze
- flutter test
- flutter run

Root markers present:
- PROJECT_ROOT.marker
- FLUTTER_PROJECT_ROOT.marker
- PROJECT_ROOT.md
- PROJECT_FLUTTER_ROOT.json
- FLUTTER_PROJECT_ROOT.txt

If your tool still "cannot determine project root", ensure the current working directory is:
attendance-tracker-216426-216435/attendance_frontend
