If your CI reports "Could not determine project root directory for Flutter project", point the analyzer or build step to this directory:

  attendance-tracker-216426-216435/attendance_frontend

Examples:
- flutter analyze attendance-tracker-216426-216435/attendance_frontend
- cd attendance-tracker-216426-216435/attendance_frontend && flutter analyze

This repo is a multi-container workspace; ensure your tooling runs in the container root above.
