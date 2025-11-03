import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_frontend/main.dart';

void main() {
  // Ensure test bindings are initialized
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('AuthGate shows initializing state first', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());

    // Initial frame before providers finish loadSession
    expect(find.text('Initializing...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('MaterialApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
