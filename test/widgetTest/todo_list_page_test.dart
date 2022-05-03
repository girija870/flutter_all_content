import 'package:flut_all_content/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('Add  and remove the todo', (WidgetTester tester) async {
    //build the widget
    await tester.pumpWidget(const TodoListPage());

    //enter hello into the TextField
    await tester.enterText(find.byType(TextField), 'hello');

    //tap and add bottom
    await tester.tap(find.byType(FloatingActionButton));

    //rebid the widget after the state has changed
    await tester.pump();

    //Expect to find the item on  screen
    expect(find.text('hello'), findsOneWidget);

    //swipe the item to dismiss it
    await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

    //Build  the widget untill the dissmiss animation ends
    await tester.pumpAndSettle();

    //ensure that the item is no longer on screen
    expect(find.text('hello'), findsNothing);
  });
}
