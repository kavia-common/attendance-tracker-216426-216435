/*
PUBLIC_INTERFACE
print_flutter_root.dart

This utility prints the absolute path to the Flutter project root so CI/tools
can cd into the correct directory before running flutter commands.

Usage:
  dart run tools/print_flutter_root.dart
or:
  flutter pub get && dart run tools/print_flutter_root.dart
*/
import 'dart:io';

/// PUBLIC_INTERFACE
/// Entry point that prints the discovered Flutter root path to stdout.
void main(List<String> args) {
  // Heuristic: we are expected to run from project root, but if not,
  // search upwards for a pubspec.yaml and lib/main.dart combo.
  final cwd = Directory.current;
  final root = _findFlutterRoot(cwd);
  stdout.writeln(root.path);
}

/// PUBLIC_INTERFACE
/// Returns the nearest ancestor directory that looks like a Flutter project
/// (contains pubspec.yaml and lib/main.dart).
Directory _findFlutterRoot(Directory start) {
  Directory dir = start.absolute;
  while (true) {
    final pubspec = File('${dir.path}${Platform.pathSeparator}pubspec.yaml');
    final mainDart = File('${dir.path}${Platform.pathSeparator}lib${Platform.pathSeparator}main.dart');
    if (pubspec.existsSync() && mainDart.existsSync()) {
      return dir;
    }
    final parent = dir.parent;
    if (parent.path == dir.path) {
      // Reached FS root; fallback to current
      return start.absolute;
    }
    dir = parent;
  }
}
