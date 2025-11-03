#!/usr/bin/env bash
set -euo pipefail

APP_DIR="attendance-tracker-216426-216435/attendance_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "Error: Flutter pubspec.yaml not found in $APP_DIR"
  exit 1
fi

cd "$APP_DIR"

CMD="${1:-help}"

case "$CMD" in
  get)
    flutter pub get
    ;;
  analyze)
    flutter analyze
    ;;
  test)
    CI=true flutter test --concurrency=1
    ;;
  run)
    flutter run
    ;;
  clean)
    flutter clean
    ;;
  help|*)
    echo "Usage: $0 [get|analyze|test|run|clean]"
    ;;
esac
