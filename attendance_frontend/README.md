# attendance_frontend

Flutter mobile frontend for the Attendance application.

Project root
- This directory is the Flutter project root.
- Entrypoint: lib/main.dart
- Pubspec: pubspec.yaml
- Run all Flutter commands from this directory.

Environment configuration
Create a `.env` file here (or copy from `.env.example`) and set the backend endpoints.
- For desktop:
  API_BASE_URL=http://localhost:8000
  REALTIME_URL=ws://localhost:8000/ws
  EVENTS_URL=http://localhost:8000/events
- For Android emulator:
  API_BASE_URL=http://10.0.2.2:8000
  REALTIME_URL=ws://10.0.2.2:8000/ws
  EVENTS_URL=http://10.0.2.2:8000/events
- Common:
  MOCK_MODE=false
- Optional overrides:
  AUTH_LOGIN_PATH=/auth/login
  AUTH_ME_PATHS=/users/me,/auth/me,/me,/users/profile

Auth flow compatibility
- Login POST: AUTH_LOGIN_PATH (default /auth/login) with JSON { "email": "...", "password": "..." }
- Supported token fields (top-level or nested under data.*, auth.*, meta.*):
  token, access_token, accessToken, jwt, id_token, idToken, session_token, sessionToken, bearer, bearer_token, api_token, auth_token
- If the login response includes no user, the app calls GET on the first working path from AUTH_ME_PATHS (default: /users/me, /auth/me, /me, /users/profile).
- ApiClient auto-attaches Authorization: Bearer <token> for subsequent calls.

Realtime
- WebSocket connects to REALTIME_URL with Authorization: Bearer <token>.
- SSE fallback uses EVENTS_URL with the same header.

Run locally
1) Copy the env example and adjust host:
   cp .env.example .env
2) Install deps and run:
   flutter pub get
   flutter run -d emulator

Diagnostics during login (debug builds)
- ApiClient prints request/response previews.
- AuthProvider logs token resolution and follow-up GET /users/me.
- If you get 401 on /users/me after a 200 login, verify Authorization: Bearer <token> is accepted by the backend.

Quick backend verification (curl)
curl -i -X POST "$API_BASE_URL/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"teacher@example.com","password":"password"}'

# After copying token:
curl -i "$API_BASE_URL/users/me" -H "Authorization: Bearer <TOKEN>"
# or fallback:
curl -i "$API_BASE_URL/auth/me" -H "Authorization: Bearer <TOKEN>"

References and Guides
- DEVELOPMENT_RUN_GUIDE.md: avoid project root detection errors; correct run steps
- BACKEND_LOGIN_CHECKLIST.md: align backend with frontend token/user shape and CORS
- README_E2E_LOGIN_CHECKS.md: end-to-end login checks
- README_AUTH_DEBUG.md: what debug logs to expect during auth

CI and tooling notes
- Ensure CI working directory is attendance-tracker-216426-216435/attendance_frontend.
- Root markers provided: PROJECT_ROOT.marker, FLUTTER_PROJECT_ROOT.marker, PROJECT_ROOT.md, PROJECT_FLUTTER_ROOT.json, FLUTTER_PROJECT_ROOT.txt, FLUTTER_ROOT.marker.
- Use the helper script from repo root if desired: ./run_flutter.sh get|analyze|test
