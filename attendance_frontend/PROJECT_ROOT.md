# Project Root Hint for CI/Analyzer

This file helps CI tooling determine the Flutter project root.

- Flutter project root: .
- pubspec.yaml: ./pubspec.yaml
- App entrypoint: ./lib/main.dart
- Android: ./android
- iOS (if present): ./ios
- Web (if enabled): ./web

Tools should consider this directory as the Flutter project root when running `flutter analyze`, `flutter pub get`, or building.
