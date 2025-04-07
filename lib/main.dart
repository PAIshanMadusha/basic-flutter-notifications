import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:basic_flutter_notifications/pages/home_page.dart';
import 'package:flutter/material.dart';

//NavigatorKey
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize the Notification Service
  await LocalNotificationsService.init();
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
