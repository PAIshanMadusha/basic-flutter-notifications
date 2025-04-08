import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsService {
  //Create an Instance of the Firebase Messaging
  static final _firebaseMessaging = FirebaseMessaging.instance;

  //Initialize the Firebase Messaging
  static Future<void> init() async {
    //Request Permission for Notifications
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );
    //Check If the Permission is Granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("Permission Granted!");
    } else {
      debugPrint("Permission Denied or has not Accepted!");
      return;
    }
    //Get the FCM(Firebase Colud Messaging) Token
    String? token = await _firebaseMessaging.getToken();
    debugPrint("FCM Token: $token");
  }

  //Listen for Incoming Notifications in Background Status
  static Future<void> onBackgroundNotification(RemoteMessage message) async {
    if (message.notification != null) {
      debugPrint("Background Message: ${message.notification!.title}");
    }
  }

  //Pass the Payload Data to the Notification Page
  static Future<void> onBackgroundNotificationTap(
    RemoteMessage message,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    navigatorKey.currentState!.pushNamed(
      "/notification-details-page",
      arguments: message,
    );
  }
}
