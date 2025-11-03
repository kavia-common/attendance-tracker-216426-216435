# E2E Login Checks (Quick)

1) Ensure .env
- MOCK_MODE=false
- API_BASE_URL=http://10.0.2.2:8000 (Android) or http://localhost:8000 (desktop)
- REALTIME_URL=ws://10.0.2.2:8000/ws
- EVENTS_URL=http://10.0.2.2:8000/events
- Optional:
  - AUTH_LOGIN_PATH=/auth/login
  - AUTH_ME_PATHS=/users/me,/auth/me,/me

2) Run from project root
- cd attendance_frontend
- flutter pub get
- flutter run -d emulator

3) Observe debug logs for:
- POST <API>/auth/login -> status and response body preview
- resolved token length
- subsequent GET to /users/me or configured paths

If login continues failing with 401/404/500, check backend secrets (JWT_SECRET/REFRESH_SECRET), CORS (Authorization header), database connectivity, and that a seeded user exists with a bcrypt password hash.
