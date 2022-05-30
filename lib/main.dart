import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flut_all_content/dashboard_screen.dart';
import 'package:flut_all_content/home_screen.dart';
import 'package:flut_all_content/login_screen.dart';
import 'package:flutter/material.dart';

//receive message when  app is on background
Future<void> backgroundMessageHandler(RemoteMessage remoteMessage) async {
  log(remoteMessage.data.toString());
  log(remoteMessage.notification!.title!);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      routes: {
        "/login": (_) => const LoginScreen(),
        "/home": (_) => const HomeScreen(),
      },
    );
  }
}
