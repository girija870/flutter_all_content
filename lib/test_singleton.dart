import 'dart:math';

import 'package:flut_all_content/app/app.dart';
import 'package:flutter/material.dart';

class TestSingleTon extends StatelessWidget {
  const TestSingleTon({Key? key}) : super(key: key);

  void updateAppState() {
    MyApp.instance.appState = 10;
  }

  void appAppState() {
    log(MyApp.instance.appState); // output - 10
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
