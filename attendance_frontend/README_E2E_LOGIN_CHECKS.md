# E2E Login Checks

This guide helps you diagnose and validate the login flow end-to-end (frontend + backend).

Prerequisites:
- Backend running and reachable from the emulator/device.
- A seeded test user with a bcrypt-hashed password.
- Backend implements POST /auth/login and GET /users/me (or compatible endpoints).

Environment (.env in attendance_frontend):
# Desktop
# API_BASE_URL=http://localhost:3010
# REALTIME_URL=ws://localhost:3010/ws
# EVENTS_URL=http://localhost:3010/events

# Android emulator
API_BASE_URL=http://10.0.2.2:3010
REALTIME_URL=ws://10.0.2.2:3010/ws
EVENTS_URL=http://10.0.2.2:3010/events

MOCK_MODE=false
# Optional overrides when backend differs:
# AUTH_LOGIN_PATH=/auth/login
# AUTH_ME_PATHS=/users/me,/auth/me,/me,/users/profile

How to run (from attendance_frontend directory):
- flutter pub get
- flutter run -d emulator

What to capture in logs:
- From ApiClient:
  - "POST <API_BASE_URL>/auth/login body=<preview>"
  - "RESPONSE POST <url> -> <status> headers={...} body=<preview>"
- From AuthProvider:
  - "AuthProvider.login -> POST /auth/login email=<email>"
  - "AuthProvider.login <- response type=<runtimeType>"
  - "AuthProvider.login: resolved token length=<N>"
  - If user not in login response:
    - "AuthProvider.login -> GET /users/me"
    - "AuthProvider.login <- GET /users/me succeeded with user payload"
- On app relaunch (session restore):
  - "AuthProvider.loadSession -> GET <one-of AUTH_ME_PATHS>"
  - "AuthProvider.loadSession <- GET <path> succeeded"

Token field variants accepted by frontend:
- Top-level or nested (data.*, auth.*, meta.*): token, access_token, accessToken, jwt, id_token, idToken, session_token, sessionToken, bearer, bearer_token, api_token

Verification checklist:
1) POST /auth/login returns 200 with one of the supported token fields (possibly nested).
2) Frontend persists token to SharedPreferences (confirmed by logs and auto-login on relaunch).
3) GET /users/me (or any path in AUTH_ME_PATHS) with Authorization: Bearer <token> returns user JSON (id, name, email, role).
4) Realtime:
   - WebSocket at REALTIME_URL accepts Authorization header; if not, SSE at EVENTS_URL should work.
5) Backend:
   - JWT secret consistent; /auth/login and /users/me verify the same secret.
   - CORS configured if testing over web; not generally required for mobile.
   - Bcrypt seeding for the test user.

Troubleshooting:
- 401 on /auth/login:
  - Check user credentials and bcrypt hashing; verify backend logs.
- 200 on /auth/login but no token detected:
  - Inspect response body; add your token field to AUTH_* or ensure it matches one of the supported names.
- 200 with token but /users/me returns 401:
  - Confirm Authorization header "Bearer <token>" is used on backend.
  - Verify token format (JWT vs opaque) and backend validator.
- Network errors:
  - For Android emulators use 10.0.2.2 to reach host machine services.
  - Ensure API_BASE_URL is correct and reachable.

Notes:
- Login/debug prints are enabled only in debug builds.
- You can override login/me paths via AUTH_LOGIN_PATH and AUTH_ME_PATHS in .env.
