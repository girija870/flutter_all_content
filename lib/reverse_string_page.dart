import 'package:flutter/material.dart';

class ReverseStringPage extends StatefulWidget {
  const ReverseStringPage({Key? key}) : super(key: key);

  @override
  State<ReverseStringPage> createState() => _ReverseStringPageState();
}

class _ReverseStringPageState extends State<ReverseStringPage> {
  TextEditingController? _controller;
  String? _reversed;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Reversi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter string to reverse"),
            ),
            const SizedBox(height: 10.0),
            if (_reversed != null) ...[
              Text(
                _reversed!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
            ElevatedButton(
              child: const Text("Reverse"),
              onPressed: () {
                if (_controller!.text.isEmpty) return;
                setState(() {
                  _reversed = reverseString(_controller!.text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String reverseString(String reverseValue) {
  return reverseValue.split('').reversed.join();
}
