/// PUBLIC_INTERFACE
/// Prints the Flutter project root and entrypoint for CI/analyzers.
/// This lets pipeline steps discover where to run flutter commands.
///
/// Usage:
///   dart tools/flutter_root_info.dart
///
/// Output (lines):
/// ROOT=attendance-tracker-216426-216435/attendance_frontend
/// ENTRY=lib/main.dart
/// PUBSPEC=pubspec.yaml
void main() {
  const root = 'attendance-tracker-216426-216435/attendance_frontend';
  const entry = 'lib/main.dart';
  const pubspec = 'pubspec.yaml';
  print('ROOT=$root');
  print('ENTRY=$entry');
  print('PUBSPEC=$pubspec');
}
