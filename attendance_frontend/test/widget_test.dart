import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_frontend/main.dart';

void main() {
  testWidgets('Placeholder shell shows initializing state', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());

    expect(find.text('Attendance app is initializing...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('App bar has correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const AttendanceApp());

    expect(find.text('Attendance'), findsOneWidget);
  });
}
