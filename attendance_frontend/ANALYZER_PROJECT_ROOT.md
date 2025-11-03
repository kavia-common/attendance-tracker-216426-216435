This file helps CI/mobile analyzers detect the Flutter project root.

Project root: .
Entrypoint: lib/main.dart
Pubspec: pubspec.yaml

Notes:
- Ensure .env exists at project root (copy from .env.example) with MOCK_MODE=false and appropriate API_BASE_URL/REALTIME_URL/EVENTS_URL for E2E.
- Assets include .env so Flutter can load it at runtime.
