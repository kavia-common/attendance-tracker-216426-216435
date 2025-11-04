import 'package:attendance_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Ensure test bindings are initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Root shows progress while initializing', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());

    // Initial frame before providers finish loadSession
    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });

  testWidgets('MaterialApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
