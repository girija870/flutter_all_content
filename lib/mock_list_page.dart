import 'package:flutter/material.dart';

class MockListPage extends StatefulWidget {
  const MockListPage({Key? key}) : super(key: key);

  @override
  State<MockListPage> createState() => _MockListPageState();
}

class _MockListPageState extends State<MockListPage> {
  late final List<String> items;

  @override
  void initState() {
    items = List<String>.generate(10000, (index) => "Item $index");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // Add a key to the ListView. This makes it possible to
          // find the list and scroll through it in the tests.
          key: const Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                // Add a key to the Text widget for each item. This makes
                // it possible to look for a particular item in the list
                // and verify that the text is correct
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}
