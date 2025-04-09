import 'package:basic_flutter_notifications/firebase_options.dart';
import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:basic_flutter_notifications/notifications/push_notifications_service.dart';
import 'package:basic_flutter_notifications/pages/home_page.dart';
import 'package:basic_flutter_notifications/pages/notification_details_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

//NavigatorKey
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize the Notification Service
  await LocalNotificationsService.init();
  tz.initializeTimeZones();

  //Firebase Initialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Initialize the Push Notification Service
  await PushNotificationsService.init();

  //Listen for Incoming Notifications in Background Status
  FirebaseMessaging.onBackgroundMessage(
    PushNotificationsService.onBackgroundNotification,
  );

  //OnBackground Notification Tap
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    if (message.notification != null) {
      debugPrint("Notification Tapped");
      await PushNotificationsService.onBackgroundNotificationTap(
        message,
        navigatorKey,
      );
    }
  });

  //OnForeground Notification Tap
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (message.notification != null) {
      debugPrint("Notification Tapped");
      await PushNotificationsService.onForegroundNotificationTap(message);
    }
  });

  //Handling Notifications in Terminated Status
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    debugPrint("Launched from Terminated State");
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState!.pushNamed(
        "/notification-details-page",
        arguments: message,
      );
    });
  }
  
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
        "/notification-details-page": (context) => NotificationDetailsPage(),
      },
    );
  }
}
