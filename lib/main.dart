import 'package:flut_all_content/app/app.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //generally prevent null exception so make sure that neccessary widget is binding.
  await initAppModule();
  runApp(MyApp());
}
