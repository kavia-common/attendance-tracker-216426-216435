# Development Run Guide (Flutter)

If you encounter: "Could not determine project root directory for Flutter project", ensure you are running commands from the Flutter project root.

Project root for this app:
attendance-tracker-216426-216435/attendance_frontend

Steps:
1) cd attendance-tracker-216426-216435/attendance_frontend
2) flutter pub get
3) Copy env template and edit endpoints for your backend:
   cp .env.example .env
   # edit .env to set API_BASE_URL, REALTIME_URL, EVENTS_URL, MOCK_MODE=false
4) Run the app:
   flutter run -d emulator
   # or: flutter run -d chrome (web), flutter run -d linux (desktop)

Troubleshooting:
- Ensure FLUTTER_PROJECT_ROOT.marker exists in this directory (it already does).
- Verify pubspec.yaml is present (it is).
- If running from parent dirs, use the --project-root flag or cd into this directory first.
- If Flutter cache causes issues, run:
  flutter clean && flutter pub get

Login E2E Quick Check:
- See README_E2E_LOGIN_CHECKS.md and README_AUTH_DEBUG.md for detailed steps and debug output expectations.
