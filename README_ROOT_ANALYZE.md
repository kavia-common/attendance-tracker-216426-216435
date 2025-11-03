Analyzer Guidance

Flutter app location:
- Path: attendance-tracker-216426-216435/attendance_frontend
- Entrypoint: lib/main.dart
- Pubspec: pubspec.yaml

Detection options:
1) Use markers:
   - attendance-tracker-216426-216435/attendance_frontend/FLUTTER_PROJECT_ROOT.txt
   - attendance-tracker-216426-216435/attendance_frontend/ENTRYPOINT_PATH
   - attendance-tracker-216426-216435/attendance_frontend/ENTRYPOINT_MARKER
   - attendance-tracker-216426-216435/attendance_frontend/PROJECT_ROOT.marker
   - attendance-tracker-216426-216435/attendance_frontend/CI_PROJECT_ROOT_HINT.md
   - attendance-tracker-216426-216435/attendance_frontend/ANALYZER_PROJECT_ROOT.md
   - attendance-tracker-216426-216435/PROJECT_FLUTTER_ROOT.json
   - FLUTTER_WORKSPACE_ROOT.marker

2) Programmatic:
   - Run: dart tools/flutter_root_info.dart
   - Parse stdout lines: ROOT=..., ENTRY=..., PUBSPEC=...

3) Shell helper:
   - Run: ./verify_flutter_root.sh (bash)

Always run Flutter commands from the attendance_frontend directory.
