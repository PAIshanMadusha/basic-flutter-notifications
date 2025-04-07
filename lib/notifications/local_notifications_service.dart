import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  //Create an Instance for the Flutter Local Notification
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {}

  //Initialize the Notification
  static Future<void> init() async {
    //Initialize for Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    //Initialize for IOS
    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    //Combine the Android and IOS
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iosInitializationSettings,
        );

    //Initialize the Plugin
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );

    //Permission to Show Notification
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()?.requestNotificationsPermission();
  }
}
