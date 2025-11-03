# Frontend auth diagnostic quick notes

This app already logs the following in debug mode (flutter run -d emulator):
- Env values printed on Login screen footer (API_BASE_URL, REALTIME_URL, EVENTS_URL, MOCK_MODE)
- ApiClient request lines:
  - "POST <url> body=<trimmed>"
- ApiClient response lines:
  - "RESPONSE <method> <url> -> <status> headers=<headers> body=<trimmed>"
  - For errors: "ERROR <method> <url> -> <status> body=<trimmed>"
- AuthProvider extras:
  - "AuthProvider.login -> POST /auth/login email=<email>"
  - "AuthProvider.login <- response type=<runtimeType>"
  - "AuthProvider.login: resolved token length=<len>"
  - Token keys accepted: token, access_token, accessToken, jwt, id_token, idToken, session_token, sessionToken (also nested under data.*, auth.*, meta.*)
  - If user is missing from login response, AuthProvider automatically calls GET /users/me then falls back to GET /auth/me.
  - Session restore:
    - "AuthProvider.loadSession: session user loaded from /users/me or /auth/me"
- RealtimeService:
  - "Connecting WebSocket to <url>"
  - "WebSocket done / error ... (then fallback to SSE)"
  - "Connecting SSE to <url>"

How to capture exact login response preview:
1. Ensure .env has MOCK_MODE=false and API_BASE_URL/REALTIME_URL/EVENTS_URL pointing to backend.
2. Run the app in debug mode.
3. Attempt login from the Login screen.
4. Copy logs from stdout around:
   - POST /auth/login
   - RESPONSE ... -> <status> headers=... body=...
   - AuthProvider.login: resolved token length=...
   - Any subsequent GET /users/me or /auth/me

If backend returns token under a different field, update AuthProvider token candidates accordingly.
If backend returns token but no user, the provider already fetches /users/me then falls back to /auth/me.

Checklist before testing:
- .env: MOCK_MODE=false, URLs correct.
- Optional auth path overrides:
  - AUTH_LOGIN_PATH=/auth/login
  - AUTH_ME_PATHS=/users/me,/auth/me,/me
- Backend responding:
  - POST /auth/login returns JSON with one of: token, access_token, accessToken, jwt, id_token, idToken, bearer, bearer_token, api_token (also nested under data.*, auth.*, meta.*).
  - GET /users/me (or fallback paths from AUTH_ME_PATHS) with Authorization: Bearer <token> returns user JSON: id, name, email, role.
  - WebSocket at REALTIME_URL accepts Authorization header. If not, SSE fallback at EVENTS_URL does.

Troubleshooting scenarios:
- 401 on /users/me after login:
  - Ensure token is persisted: see resolved token length and shared_preferences persistence.
  - Verify backend Authorization: Bearer <token> header requirement.
  - Confirm CORS preflight if testing on web; for mobile emulator, CORS generally not applicable.
- WebSocket closes immediately:
  - Check that the server accepts Authorization header for WS. If not supported, use SSE fallback by providing EVENTS_URL and enabling server's /events endpoint.

