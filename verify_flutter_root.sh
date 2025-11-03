#!/usr/bin/env bash
set -euo pipefail

APP_DIR="attendance-tracker-216426-216435/attendance_frontend"
if [[ ! -f "$APP_DIR/pubspec.yaml" ]]; then
  echo "ERROR: Could not find Flutter pubspec at $APP_DIR/pubspec.yaml"
  exit 1
fi

echo "Flutter project root detected at: $APP_DIR"
echo "Entrypoint: $APP_DIR/lib/main.dart"
exit 0
