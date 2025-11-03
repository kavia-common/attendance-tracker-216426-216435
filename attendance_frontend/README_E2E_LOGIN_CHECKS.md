# E2E Login Checklist (Frontend + Backend)

Frontend (.env):
- MOCK_MODE=false
- API_BASE_URL=http://<host>:<port>
- REALTIME_URL=ws://<host>:<port>/ws
- EVENTS_URL=http://<host>:<port>/events

What the app does:
- ApiClient logs POST /auth/login and response status/body preview in debug.
- AuthProvider accepts token keys: token, access_token, accessToken, jwt, id_token; also in data.*, auth.*, meta.*.
- If login contains no user, calls GET /users/me (fallback /auth/me).
- Token persisted in SharedPreferences; session restored on app restart via loadSession().
- RealtimeService connects to REALTIME_URL with Authorization: Bearer <token>. SSE fallback to EVENTS_URL.

Backend prerequisites:
- .env has JWT_SECRET and REFRESH_SECRET, DATABASE_URL set; Postgres reachable.
- Ensure CORS allows the app origin (Android emulator uses 10.0.2.2).
- POST /auth/login validates bcrypt and returns a JSON including a token (any key above is accepted). If you already return accessToken keep it.
- GET /users/me returns authenticated user when Authorization: Bearer <token> is provided.
- Seed a test user with bcrypt password matching your test creds, example:
  email: teacher@example.com
  password: password

Troubleshooting:
- Watch Flutter debug console for lines starting with: "POST ...", "RESPONSE ...", "ERROR ...", and "AuthProvider.login".
- If 401 on /users/me after login, ensure the token is valid and Authorization header is accepted by backend.
- If websocket fails, RealtimeService falls back to SSE; verify /events supports text/event-stream with JWT.
