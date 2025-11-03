# Flutter Project Root Analyze

This is the Flutter project to analyze and build.

Entrypoints and key files:
- pubspec.yaml (this directory)
- lib/main.dart
- lib/core/env.dart (loads .env)
- lib/providers/auth_provider.dart
- lib/core/api_client.dart

Project root detection:
- The Flutter project root is this directory.
- Ensure CI and tooling run commands from: attendance-tracker-216426-216435/attendance_frontend
- A marker file `.flutter-project-root` is included to aid detection.
- The presence of pubspec.yaml and lib/ should be used by tools to auto-detect the project.

If your tooling cannot find the project root, ensure the working directory is:
attendance-tracker-216426-216435/attendance_frontend
