import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:playground/main.dart';

void main() {
  testWidgets('playground shows the arrow pad', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(ArrowPad), findsOneWidget);
    expect(find.text('Not clicked yet'), findsOneWidget);
  });
}
