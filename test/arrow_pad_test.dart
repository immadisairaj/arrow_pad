import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('arrow pad layout', () {
    testWidgets('arrow pad widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ArrowPad(),
          ),
        ),
      );
      // check if the widget is building
      expect(find.byType(ArrowPad), findsOneWidget);
    });
    testWidgets('arrow pad size with default padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ArrowPad(
              height: 60,
              width: 60,
            ),
          ),
        ),
      );
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      // check for the size with default padding
      expect(widgetSize, equals(const Size(76, 76)));
    });
    testWidgets('arrow pad size with zero padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ArrowPad(
              height: 60,
              width: 60,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      );
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      // check if the size is correct without padding
      expect(widgetSize, equals(const Size(60, 60)));
    });
    testWidgets('arrow pad size inside sized box square',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 60,
              width: 60,
              child: ArrowPad(
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      );
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      // check if the widget takes parent size which is square
      expect(widgetSize, equals(const Size(60, 60)));
    });
    testWidgets('arrow pad size inside sized box rectangle',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 60,
              width: 80,
              child: ArrowPad(
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      );
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      // check if the widget takes parent size which is rectangle
      expect(widgetSize, equals(const Size(80, 60)));
    });
    testWidgets('arrow pad default size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ArrowPad(),
          ),
        ),
      );
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      final scaffoldSize = tester.getSize(find.byType(Scaffold));
      // check if widget takes parent size when no box size is provided
      expect(widgetSize, scaffoldSize);
    });
  });

  group('arrow pad press', () {
    testWidgets('arrow pad press', (WidgetTester tester) async {
      var pressedValue = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ArrowPad(
              height: 100,
              width: 100,
              onPressed: (direction) {
                pressedValue = switch (direction) {
                  PressDirection.up => 1,
                  PressDirection.down => 2,
                  PressDirection.left => 3,
                  PressDirection.right => 4,
                };
              },
            ),
          ),
        ),
      );
      // when no press happens
      expect(pressedValue, 0);
      await tester.pumpAndSettle();
      final widgetSize = tester.getSize(find.byType(ArrowPad));
      // when press up arrow
      await tester.tapAt(Offset(widgetSize.width / 2, widgetSize.height / 4));
      expect(pressedValue, 1);
      // when press down arrow
      await tester
          .tapAt(Offset(widgetSize.width / 2, 3 * widgetSize.height / 4));
      expect(pressedValue, 2);
      // when press left arrow
      await tester.tapAt(Offset(widgetSize.width / 4, widgetSize.height / 2));
      expect(pressedValue, 3);
      // when press right arrow
      await tester
          .tapAt(Offset(3 * widgetSize.width / 4, widgetSize.height / 2));
      expect(pressedValue, 4);
    });
  });
}
