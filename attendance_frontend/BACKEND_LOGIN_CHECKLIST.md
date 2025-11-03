# Backend Login Checklist (align with frontend)

Environment:
- JWT_SECRET and REFRESH_SECRET set (non-empty)
- DATABASE_URL configured and reachable
- A seeded user exists; password stored with bcrypt

CORS:
- Access-Control-Allow-Headers includes: Authorization, Content-Type, Accept
- Access-Control-Allow-Origin includes your app origin (or * during dev)
- Allow methods: GET, POST, OPTIONS

Auth endpoints:
- POST AUTH_LOGIN_PATH (default /auth/login) returns JSON with token field:
  Prefer { "token": "<jwt>" }, but accepted keys include:
  token | access_token | accessToken | jwt | id_token | idToken | session_token | sessionToken | bearer | bearer_token | api_token | auth_token
  Token can be nested under data./auth./meta., the app will deep-search.

- GET /users/me (preferred) or any of AUTH_ME_PATHS returns 200 and a user object:
  {
    "id": "...",
    "name": "...",
    "email": "...",
    "role": "teacher|student|admin"
  }

Testing:
- Use curl to verify:
  curl -i -X POST "$API_BASE/auth/login" -H "Content-Type: application/json" -d '{"email":"teacher@example.com","password":"password"}'
  # Extract token from response and test:
  curl -i "$API_BASE/users/me" -H "Authorization: Bearer <token>"

Notes:
- If your token field name is different, consider including a "token" alias in the response to simplify clients.
- For WebSocket auth (REALTIME_URL), ensure Authorization header is forwarded; otherwise provide an SSE /events fallback.
