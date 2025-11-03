#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="attendance-tracker-216426-216435/attendance_frontend"

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Error: project directory not found: $PROJECT_DIR"
  exit 1
fi

cd "$PROJECT_DIR"

cmd="${1:-help}"
shift || true

case "$cmd" in
  get)
    flutter pub get
    ;;
  analyze)
    flutter analyze
    ;;
  test)
    CI=true flutter test --coverage
    ;;
  run)
    flutter run "$@"
    ;;
  clean)
    flutter clean
    ;;
  *)
    echo "Usage: $0 {get|analyze|test|run [args]|clean}"
    exit 2
    ;;
esac
