import 'package:flut_all_content/routes/router_information_parser.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: RoutesInformationParser(), routerDelegate: RouterDelegate,
    );
  }
}
