# CI Run Notes

The Flutter project root is:
attendance-tracker-216426-216435/attendance_frontend

In CI jobs, ensure working_directory is set to this path before invoking flutter commands.

Examples:
- cd attendance-tracker-216426-216435/attendance_frontend
- flutter pub get
- flutter analyze
- flutter test
- flutter build apk --debug

If CI runs from repo root, explicitly set: --project-root attendance-tracker-216426-216435/attendance_frontend
