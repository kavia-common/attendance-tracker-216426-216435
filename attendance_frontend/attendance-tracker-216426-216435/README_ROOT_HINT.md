If your CI reports "Could not determine project root directory for Flutter project", point the analyzer or build step to this directory:

  attendance-tracker-216426-216435/attendance_frontend

Examples:
- flutter analyze attendance-tracker-216426-216435/attendance_frontend
- cd attendance-tracker-216426-216435/attendance_frontend && flutter analyze

This workspace is multi-container. Some CI environments need an explicit path to the Flutter app.
