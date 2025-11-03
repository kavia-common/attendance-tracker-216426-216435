# attendance-tracker-216426-216435

This workspace contains the Flutter frontend for the real-time attendance application.

Containers:
- attendance_frontend (Flutter mobile app)

## Backend integration and environment

Configure the frontend environment in attendance_frontend/.env (use .env.example as a template):

- API_BASE_URL: Base URL of the backend REST API
  - Example: http://localhost:3010
- REALTIME_URL: WebSocket endpoint for realtime updates
  - Example: ws://localhost:3010/ws
- EVENTS_URL: Server-Sent Events (SSE) endpoint for realtime updates (fallback/parallel)
  - Example: http://localhost:3010/events
- MOCK_MODE: Set to false to use the live backend; true for local mock mode
  - Example: false

Example .env:
API_BASE_URL=http://localhost:3010
REALTIME_URL=ws://localhost:3010/ws
EVENTS_URL=http://localhost:3010/events
MOCK_MODE=false

The app loads Env before runApp (see attendance_frontend/lib/main.dart). ApiClient and RealtimeService read values from Env and attach the current auth token (Bearer) to HTTP requests and WS/SSE connections.

## Running the app

1) Ensure your backend is running and reachable at the URLs above.
2) Create attendance_frontend/.env from .env.example and adjust values as needed.
3) From attendance_frontend/, run:
   flutter pub get
   flutter run

Notes:
- For Android emulator, localhost is 10.0.2.2 by default. Adjust API_BASE_URL, REALTIME_URL, and EVENTS_URL accordingly if running locally.
- If the backend requires a different WS path or SSE endpoint, update the .env values without changing code.
