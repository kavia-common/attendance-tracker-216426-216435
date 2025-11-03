#!/usr/bin/env bash
# PUBLIC_INTERFACE
# Prints the Flutter project root directory for this app.
set -euo pipefail

# Prefer running from this directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/pubspec.yaml" && -f "$SCRIPT_DIR/lib/main.dart" ]]; then
  echo "$SCRIPT_DIR"
  exit 0
fi

# Fallback: run the Dart helper if invoked from elsewhere
pushd "$SCRIPT_DIR" >/dev/null
dart run tools/print_flutter_root.dart
popd >/dev/null
