import 'package:flut_all_content/album/album_view.dart';
import 'package:flut_all_content/counter/counter.dart';
import 'package:flut_all_content/mock_list_page.dart';
import 'package:flutter/material.dart';

import '../todo_list_page.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPage> {
  late final Counter _counter;

  @override
  void initState() {
    _counter = Counter();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementedCounter() {
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${_counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        //navigate to album page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AlbumView()));
                      },
                      child: const Text("GoToAlbumPage")),
                  TextButton(
                      onPressed: () {
                        //navigate to album page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MockListPage()));
                      },
                      child: const Text("GoToMockListPage")),
                  TextButton(
                      onPressed: () {
                        //navigate to album page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TodoListPage()));
                      },
                      child: const Text("GoToToDoListPage"))
                ],
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _decrementedCounter,
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
