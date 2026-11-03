import 'package:campus_companion/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget app(Size size) => MediaQuery(
        data: MediaQueryData(size: size),
        child: const MaterialApp(home: Scaffold(body: ProfileScreen())),
      );

  testWidgets('shows name, stats and actions', (tester) async {
    await tester.pumpWidget(app(const Size(400, 800)));

    expect(find.text('Sara Bekele'), findsOneWidget);
    expect(find.text('Events'), findsOneWidget);
    expect(find.text('Edit profile'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets('reports portrait or landscape from MediaQuery',
      (tester) async {
    await tester.pumpWidget(app(const Size(400, 800)));
    expect(find.text('Orientation: portrait'), findsOneWidget);

    await tester.pumpWidget(app(const Size(800, 400)));
    expect(find.text('Orientation: landscape'), findsOneWidget);
  });

  testWidgets('does not overflow at 320 px and shows Posts inside width',
      (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(320, 640)),
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(width: 320, child: ProfileScreen()),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);

    final postsFinder = find.text('Posts');
    expect(postsFinder, findsOneWidget);
    expect(tester.getRect(postsFinder).right, lessThanOrEqualTo(320.0));
  });
}
