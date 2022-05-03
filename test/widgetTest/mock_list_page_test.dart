//To perform an interaction with a widget in your test, use the widgetTester
//utility that flutter provides. for example, you can send tap and scroll gestures
//you can also use widgetTester to find childWidget in the widget tree.
//read text and verify that the values of widget properties  are correct
import 'package:flut_all_content/mock_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  testWidgets('counter increment smoke test', (WidgetTester tester) async {
    //Build our app and trigger  a frame
    await tester.pumpWidget(const MockListPage());

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    //scroll until the item to be found appears
    await tester.scrollUntilVisible(itemFinder, 50.0, scrollable: listFinder);

    //verify that the item contain the correct text
    expect(itemFinder, findsOneWidget);
  });
}
