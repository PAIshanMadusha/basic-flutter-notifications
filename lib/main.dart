import 'package:basic_flutter_notifications/firebase_options.dart';
import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:basic_flutter_notifications/notifications/push_notifications_service.dart';
import 'package:basic_flutter_notifications/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

//NavigatorKey
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize the Notification Service
  await LocalNotificationsService.init();
  tz.initializeTimeZones();

  //Firebase Initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  //Initialize the Push Notification Service
  await PushNotificationsService.init();

  //Listen for Incoming Notifications in Background Status
  FirebaseMessaging.onBackgroundMessage(PushNotificationsService.onBackgroundNotification);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Basic Flutter Notifications",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
      },
    );
  }
}
