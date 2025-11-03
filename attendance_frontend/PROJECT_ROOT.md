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

Environment variables used:
- API_BASE_URL: Base URL for REST API (e.g., http://10.0.2.2:8000)
- REALTIME_URL: WebSocket endpoint (e.g., ws://10.0.2.2:8000/ws)
- EVENTS_URL: SSE fallback endpoint (e.g., http://10.0.2.2:8000/events)
- MOCK_MODE: Set to false to use real backend; true to simulate data and auth

Notes:
- On Android emulator, 10.0.2.2 points to host machine's localhost.
- Update these URLs if your backend runs elsewhere (e.g., LAN IP).
- Ensure backend CORS allows the app and includes Authorization header.
- After login, the app persists the JWT and uses it for:
  - GET /auth/me to fetch the current user
  - Subsequent requests via Authorization: Bearer <token>
  - WS/SSE connections via Authorization header

Troubleshooting:
- If login fails with network errors, verify the backend is reachable from the emulator/device.
- Confirm /auth/login accepts JSON { "email": "...", "password": "..." } and returns:
  - token field: token/access_token/jwt/id_token
  - user object: user or data.user
- Ensure REALTIME_URL supports Authorization: Bearer <token>.
- If WebSocket connection fails, the app will fall back to SSE using EVENTS_URL.

Common CI hint:
If tooling cannot detect project root, ensure the working directory is:
attendance-tracker-216426-216435/attendance_frontend

Commands (run inside this directory):
- flutter pub get
- flutter analyze
- flutter test
- flutter run
