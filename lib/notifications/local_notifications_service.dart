import 'package:basic_flutter_notifications/notifications/functions/util_functions.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

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
        >()
        ?.requestNotificationsPermission();
  }

  //Show a Instant Notification
  static Future<void> showInstantNotification({
    required String title,
    required String body,
  }) async {
    //Define the Notification Details
    const NotificationDetails platformChannelSpecifications =
        NotificationDetails(
          //For Android
          android: AndroidNotificationDetails(
            "channel_id",
            "channel_name",
            importance: Importance.max,
            priority: Priority.high,
          ),

          //For IOS
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        );
    //Show the Notification
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifications,
    );
  }

  //Schedule a Notification
  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduleDate,
  }) async {
    //Define the Notification Details
    const NotificationDetails platformChannelSpecifications =
        NotificationDetails(
          //For Android
          android: AndroidNotificationDetails(
            "channel_id",
            "channel_name",
            importance: Importance.max,
            priority: Priority.high,
          ),

          //For IOS
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        );
    //Show the Notification
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      platformChannelSpecifications,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  //Recurring Notifications
  static Future<void> showRecurringNotification({
    required String title,
    required String body,
    required DateTime time,
    required Day day,
  }) async {
    //Define the NOtification Details
    const NotificationDetails platformChannelSpecifications =
        NotificationDetails(
          //For Android
          android: AndroidNotificationDetails(
            "channel_id",
            "channel_name",
            importance: Importance.max,
            priority: Priority.high,
          ),
          //For IOS
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        );
    //Schedule the Notification
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      UtilFunctions().nextOfTime(time, day),
      platformChannelSpecifications,
      androidScheduleMode: AndroidScheduleMode.exact,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  //Big Picture Notification
  static Future<void> showBigPictureNotification({
    required String title,
    required String body,
    required String imageUrl,
  }) async {
    //Generate the Big Picture Notification Details
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
          DrawableResourceAndroidBitmap(imageUrl),
          largeIcon: DrawableResourceAndroidBitmap(imageUrl),
          contentTitle: title,
          summaryText: body,
          htmlFormatContent: true,
          htmlFormatContentTitle: true,
        );

    NotificationDetails platformChannelSpecifications = NotificationDetails(
      //For Android
      android: AndroidNotificationDetails(
        "channel_id",
        "channel_name",
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: bigPictureStyleInformation,
      ),
      //For IOS
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        attachments: [DarwinNotificationAttachment(imageUrl)],
      ),
    );

    //Show the Notification
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifications,
    );
  }
}
