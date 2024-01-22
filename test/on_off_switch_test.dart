import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:on_off_switch/on_off_switch.dart';

void main() {
  testWidgets('OnOffSwitch should toggle its state',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    bool switchValue = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: OnOffSwitch(
            value: switchValue,
            onChanged: (newValue) {
              switchValue = newValue;
            },
          ),
        ),
      ),
    );

    // Verify that the initial state is as expected.
    expect(find.byType(OnOffSwitch), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);

    // Tap the switch and trigger a frame.
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Verify that the switch state has changed.
    expect(switchValue, isTrue);


  });
}
