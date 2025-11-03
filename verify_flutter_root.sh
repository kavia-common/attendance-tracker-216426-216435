#!/usr/bin/env bash
set -euo pipefail

ROOT_HINT="attendance-tracker-216426-216435/attendance_frontend"

if [ ! -f "$ROOT_HINT/pubspec.yaml" ]; then
  echo "Flutter root not found at $ROOT_HINT"
  exit 1
fi

echo "Flutter root detected at: $ROOT_HINT"
echo "Pubspec: $ROOT_HINT/pubspec.yaml"
