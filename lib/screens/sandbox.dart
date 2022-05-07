import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key? key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: _width,
        color: _color,
        margin: EdgeInsets.all(_margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () =>
                    setState(() => _margin = _margin == 0 ? 50 : 0),
                child: const Text('animate margin')),
            ElevatedButton(
                onPressed: () => setState(() => _color =
                    _color == Colors.blue ? Colors.green : Colors.blue),
                child: const Text('animate color')),
            ElevatedButton(
                onPressed: () =>
                    setState(() => _width = _width == 200 ? 400 : 200),
                child: const Text('animate width')),
            ElevatedButton(
                onPressed: () =>
                    setState(() => _opacity = _opacity == 1 ? 0 : 1),
                child: const Text('animate opacity')),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Hide Me',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
