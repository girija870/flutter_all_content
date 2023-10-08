import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flut_all_content/services/local_notification_services.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    LocalNotificationService.initialize(context);

    //gives you message on which user taps it open  from the terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromNotification = message.data["route"];
        Navigator.pushNamed(context, routeFromNotification);
      }
    });

    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        log(message.notification!.title!);
        log(message.notification!.body!);
      }
      LocalNotificationService.display(message);
    });

    //when the app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromNotification = message.data["route"];
      Navigator.pushNamed(context, routeFromNotification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Dashboard Screen"),
      ),
    );
  }
}
