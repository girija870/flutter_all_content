import 'package:flut_all_content/widget_for_test_1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  //Define a test. The testWidgets function also provides a WidgetTester
  //to work with. The WidgetTester allows you to build and interact
  //with widgets in the test environment

  testWidgets('Widget for test 1 has title and message',
      (WidgetTester tester) async {
    //Create the widget by telling the tester to built it.
    await tester.pumpWidget(const WidgetForTest1(title: 'T', message: 'M'));

    //Create the finders
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    //Use the findsOneWidget matcher provided by the flutter_test to verify
    //that the text widgets appear exactly once in the widget tree

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  //widget test part 2
  testWidgets('finds a text widget', (WidgetTester tester) async {
    //Build  an app with a text widget that displays the letter 'T'
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('T'),
        ),
      ),
    ));

    //Find widget that display the letter T = title
    expect(find.text('T'), findsOneWidget);
  });

  testWidgets('finds widget using key', (WidgetTester tester) async {
    //Define the test key
    const testKey = Key('K');

    //Build the material app with the testKey
    await tester.pumpWidget(MaterialApp(
      key: testKey,
      home: Container(),
    ));

    //find the materialApp widget using testKey

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    //provide the child widget to the container
    await tester.pumpWidget(Container(
      child: childWidget,
    ));

    //Search for the child widget in the tree and verify it exists.

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
