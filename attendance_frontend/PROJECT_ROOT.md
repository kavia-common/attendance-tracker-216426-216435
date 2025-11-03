This folder is the Flutter project root for the attendance_frontend app.

Important:
- Entry point: lib/main.dart
- Pubspec: pubspec.yaml (this directory)
- Android: android/
- iOS: ios/ (if present)
- Web: web/ (if present)

Environment:
- The app uses flutter_dotenv to load .env at startup (see lib/core/env.dart).
- Provide a .env file in this directory (see .env.example for keys and defaults).

Common CI hint:
If tooling cannot detect project root, ensure the working directory is:
attendance-tracker-216426-216435/attendance_frontend

Commands (run inside this directory):
- flutter pub get
- flutter analyze
- flutter test
- flutter run
