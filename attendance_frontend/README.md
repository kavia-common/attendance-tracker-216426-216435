# attendance_frontend

A new Flutter project.

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
