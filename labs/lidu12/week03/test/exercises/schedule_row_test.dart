import 'package:campus_companion/exercises/schedule_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('does not overflow on 320 px screen with long course name',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 320,
            child: ScheduleRow(
              time: '08:30',
              course: 'Mobile Applications Development',
              room: 'Lab 3',
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('08:30'), findsOneWidget);
    expect(find.text('Join'), findsOneWidget);
  });
}
