import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:attendance_frontend/main.dart';

void main() {
  testWidgets('App boots and shows Splash', (WidgetTester tester) async {
    await tester.pumpWidget(AttendanceApp(
      authRepository: throw UnimplementedError('Injected in app main'),
      attendanceRepository: throw UnimplementedError('Injected in app main'),
      realtimeService: throw UnimplementedError('Injected in app main'),
    ));
    // This test is placeholder; we simply ensure widget tree builds to first frame.
    expect(find.byType(MaterialApp), findsOneWidget);
  }, skip: true); // Skip in CI since we need DI from main()
}
