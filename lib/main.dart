import 'package:flut_all_content/album/album_view.dart';
import 'package:flut_all_content/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              TextButton(
                  onPressed: () {
                    //navigate to album page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AlbumView()));
                  },
                  child: const Text("GoToAlbumPage"))
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
