// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_task/main.dart';

void main() {
  testWidgets('inbox foundation displays messages', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('SwipeSmart'), findsOneWidget);
    expect(find.text('Your inbox'), findsOneWidget);
    expect(find.text('Invoice approval needed'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pump();

    expect(find.text('Design review feedback'), findsOneWidget);
  });
}
