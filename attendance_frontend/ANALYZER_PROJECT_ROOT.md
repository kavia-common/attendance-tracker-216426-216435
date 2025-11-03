This file helps CI and tooling detect the Flutter project root.

- Project root: this directory (contains pubspec.yaml).
- Entry point: lib/main.dart
- Android: android/
- iOS: ios/ (if present)
- Web: web/ (if present)
- Assets: assets/, .env

Tools should run from this directory:
- flutter pub get
- flutter analyze
- flutter test
