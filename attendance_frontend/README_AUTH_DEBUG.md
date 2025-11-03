# Auth & Environment Setup Notes

1. Copy `.env.example` to `.env` and set values for your environment:
   - API_BASE_URL (e.g., http://localhost:8000)
   - REALTIME_URL (e.g., ws://localhost:8000/ws)
   - EVENTS_URL (e.g., http://localhost:8000/events)
   - MOCK_MODE=false

2. Ensure the backend exposes:
   - POST /auth/login -> returns a token as one of: token, access_token, accessToken, jwt, id_token, or nested in data.token
   - GET /users/me (preferred) or GET /auth/me -> returns the authenticated user

3. The frontend now:
   - Logs request/response status and a safe body preview for easier debugging (debug builds only).
   - Accepts multiple token key variants and falls back to `/users/me` if login response lacks user.
   - On app start, first tries `/users/me` to populate the session.

If login still fails:
- Check CORS on backend for POST /auth/login and /users/me.
- Verify JWT secret and bcrypt configuration; ensure stored hashes match.
- Inspect Flutter debug console for detailed ApiClient logs.
