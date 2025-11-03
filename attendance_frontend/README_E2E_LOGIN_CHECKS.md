# E2E Login Checks (Quick)

1) Ensure .env
- MOCK_MODE=false
- API_BASE_URL=http://10.0.2.2:8000 (Android) or http://localhost:8000 (desktop)
- REALTIME_URL=ws://10.0.2.2:8000/ws
- EVENTS_URL=http://10.0.2.2:8000/events
- Optional:
  - AUTH_LOGIN_PATH=/auth/login
  - AUTH_ME_PATHS=/users/me,/auth/me,/me,/users/profile

You can use the provided .env.example as a base:
- cp .env.example .env
- Adjust API_BASE_URL/REALTIME_URL/EVENTS_URL per your backend
- Keep MOCK_MODE=false for real backend testing

2) Run from project root
- cd attendance_frontend
- flutter pub get
- flutter run -d emulator

3) Observe debug logs (they already print in debug builds):
- "POST <API>/auth/login body=..." 
- "RESPONSE POST <API>/auth/login -> <status> headers=... body=..."
- "AuthProvider.login: resolved token length=<n>"
- Subsequent "GET /users/me" (or any AUTH_ME_PATHS) and its status

4) Backend verification checklist (if failures persist):
- Environment:
  - JWT_SECRET and REFRESH_SECRET set (non-empty)
  - DATABASE_URL configured and DB reachable
- CORS:
  - Access-Control-Allow-Headers includes Authorization, Content-Type, Accept
  - Access-Control-Allow-Origin includes your app origin (for web) 
- Authentication:
  - POST /auth/login returns JSON containing a token field named one of:
    token | access_token | accessToken | jwt | id_token | idToken | session_token
    (can also be nested under data./auth./meta.)
  - GET /users/me (or one of AUTH_ME_PATHS) with Authorization: Bearer <token>
    returns 200 and user object { id, name, email, role }
- Data:
  - A seeded user exists and the stored password uses bcrypt hash
  - Login with correct email/password

5) If your backend uses different field names/paths:
- Set AUTH_LOGIN_PATH and AUTH_ME_PATHS in .env accordingly.
- If token field is non-standard, the frontend attempts deep search for token.
  Consider also adding { token: "<value>" } in the backend response for maximum compatibility.

Troubleshooting common statuses:
- 401 at /users/me after login: Verify token persisted (SharedPreferences), token format, and Bearer header.
- 404 at /users/me: Add the correct path to AUTH_ME_PATHS.
- 500 on login: Check DB connectivity, user seed, and bcrypt hashing compatibility.
