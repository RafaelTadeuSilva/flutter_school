import 'package:flutter/material.dart';
import 'package:flutter_school/src/features/patrimonio/pages/patrimonio_list_page.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestableWidget(Widget widget) {
  return MaterialApp(home: widget);
}

void main() {
  testWidgets('patrimonio list page ...', (tester) async {
    await tester.pumpWidget(makeTestableWidget(const PatrimonioListPage()));
    final patrimonioListFinder = find.byType(ListView);
    expect(patrimonioListFinder, findsOneWidget);
  });
}
