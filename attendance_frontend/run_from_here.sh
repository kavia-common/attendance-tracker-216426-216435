#!/usr/bin/env bash
set -euo pipefail

# Ensure we are in the Flutter project root by checking for pubspec.yaml
if [[ ! -f "pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found. Please run this script from attendance_frontend directory."
  exit 1
fi

cmd="${1:-help}"

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
    shift || true
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
