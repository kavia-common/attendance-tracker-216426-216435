# attendance_frontend

Attendance Frontend (Flutter)

## Environment configuration
Create a `.env` file in this directory or use the provided `.env.example`:
```
API_BASE_URL=http://10.0.2.2:8000
REALTIME_URL=ws://10.0.2.2:8000/ws
EVENTS_URL=http://10.0.2.2:8000/events
MOCK_MODE=false
```

- Set `MOCK_MODE=false` to use the real backend.
- Ensure the URLs point to the running backend. On Android emulators, use `10.0.2.2` to reach the host machine.

## Auth flow compatibility
- Login POST: `/auth/login` with JSON `{ "email": "...", "password": "..." }`
- Expected token fields supported: `token`, `access_token`, `jwt`, `id_token`.
- Expected user field in response: `user` (or `data.user`).
- If the login response returns only a token, the app will fetch the user from `/users/me` (and falls back to `/auth/me`).

## Realtime
- WebSocket connects to `REALTIME_URL` with `Authorization: Bearer <token>`.
- SSE fallback uses `EVENTS_URL` with the same Authorization header.

## Running in CI or locally with helper script
From the repository root, you can use the helper script to ensure the correct working directory:
```
./run_flutter.sh get
./run_flutter.sh analyze
./run_flutter.sh test
```

## Quick backend verification (curl)
```
curl -i -X POST "$API_BASE_URL/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"teacher@example.com","password":"password"}'

# After copying token:
curl -i "$API_BASE_URL/users/me" -H "Authorization: Bearer <TOKEN>"
# or fallback:
curl -i "$API_BASE_URL/auth/me" -H "Authorization: Bearer <TOKEN>"
```

If you receive 401 on `/users/me` but `/auth/me` works (or vice versa), the app will handle the fallback automatically.

## Environment configuration

Create a `.env` file at the project root (attendance_frontend/.env). These keys are required:

- API_BASE_URL: Base URL of the backend API (e.g., http://localhost:3010)
- REALTIME_URL: WebSocket URL for realtime updates (e.g., ws://localhost:3010/ws)
- EVENTS_URL: Server-Sent Events URL if your backend exposes it (e.g., http://localhost:3010/events)
- MOCK_MODE: Set to `false` to use the live backend, or `true` to use local mock data

Example `.env`:
```
API_BASE_URL=http://localhost:3010
REALTIME_URL=ws://localhost:3010/ws
EVENTS_URL=http://localhost:3010/events
MOCK_MODE=false
```

Notes:
- Env.load is invoked before runApp in main.dart to ensure configuration is available.
- ApiClient automatically attaches the Authorization: Bearer <token> header using the token provided by AuthProvider via TokenStorage.
- RealtimeService uses the same token for both WebSocket headers and SSE Authorization headers.

## Running

1. Ensure your backend is running and accessible at API_BASE_URL (default: http://localhost:3010).
2. Create/update `.env` as described above.
3. Fetch dependencies and run the app:
   ```
   flutter pub get
   flutter run
   ```

Troubleshooting:
- Android emulator connecting to a host service at localhost should work with the provided URLs. If connecting to a different host/IP, update API_BASE_URL/REALTIME_URL/EVENTS_URL accordingly.
- If you change `.env`, do a full restart so flutter_dotenv reloads.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
