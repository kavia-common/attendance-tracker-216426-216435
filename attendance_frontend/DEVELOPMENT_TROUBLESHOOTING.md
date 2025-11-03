# Development Troubleshooting Guide

This document helps resolve common setup issues and validate the login flow end-to-end.

## 1) Project root detection error
Error: "Could not determine project root directory for Flutter project"

Ensure you run Flutter commands from the Flutter app root:
- Correct directory: attendance-tracker-216426-216435/attendance_frontend
- Validate that this directory contains:
  - pubspec.yaml
  - lib/, android/, ios/ etc.

Example:
  cd attendance-tracker-216426-216435/attendance_frontend
  flutter clean
  flutter pub get
  flutter run

If using CI tooling or scripts, ensure working_directory is set to the app root above.

## 2) Environment (.env) and backend URLs
Copy .env.example to .env and customize if needed:
  cp .env.example .env

Ensure:
- MOCK_MODE=false for real backend testing
- API_BASE_URL points to your backend (for Android emulator localhost use 10.0.2.2)
- REALTIME_URL and EVENTS_URL point to your backend’s WebSocket and SSE endpoints

## 3) Backend expectations for auth
- POST /auth/login accepts JSON:
  { "email": "teacher@example.com", "password": "password" }
- Returns either:
  { "token": "<JWT>", "user": { ... } } 
  OR at minimum:
  { "token": "<JWT>" } and app will call GET /users/me (fallback /auth/me)
- GET /users/me (or /auth/me) returns the current user
- CORS: Allow the app origin
- JWT secret configured; bcrypt hashes verified
- Seed a test user: teacher@example.com / password

## 4) Quick HTTP verification (curl)
Set BASE export for convenience:
  export BASE="http://localhost:8000"

Login:
  curl -i -X POST "$BASE/auth/login" \
    -H "Content-Type: application/json" \
    -d '{"email":"teacher@example.com","password":"password"}'

Test user with token:
  curl -i "$BASE/users/me" -H "Authorization: Bearer <TOKEN>"
Fallback:
  curl -i "$BASE/auth/me" -H "Authorization: Bearer <TOKEN>"

## 5) App verification checklist
- Launch the Flutter app from attendance_frontend folder.
- Check the login screen shows (not MOCK MODE alert).
- Enter credentials and sign in.
- On success:
  - Token stored in SharedPreferences
  - App shows authenticated shell
  - Realtime connects (check backend logs for WebSocket/SSE Authorization header)

## 6) Debugging tips
- ApiClient prints GET/POST URLs in debug mode.
- If login fails, status codes are included in the error (HTTP 401/403/5xx).
- If /users/me 404s but /auth/me exists, the app automatically tries both.
- Android emulator: 10.0.2.2 is host machine localhost; iOS simulator: http://localhost is OK.

