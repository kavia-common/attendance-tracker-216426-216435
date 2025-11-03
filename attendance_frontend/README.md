# attendance_frontend

A new Flutter project.

## Environment configuration

Create a `.env` file at the project root (attendance_frontend/.env) based on `.env.example`:

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

The app loads Env before runApp (see main.dart). ApiClient and RealtimeService read values from Env and attach the current AuthProvider token to HTTP requests and realtime connections.

## Running

1. Ensure your backend is running and accessible at API_BASE_URL.
2. Configure `.env` as described above.
3. Run the app:
   ```
   flutter pub get
   flutter run
   ```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
