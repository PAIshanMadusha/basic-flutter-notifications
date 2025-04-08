import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    //Payload Data from the Notification
    Map<String, dynamic> payload = {};

    //Get the Payload Data Form the Notification
    final data = ModalRoute.of(context)!.settings.arguments;

    if (data is RemoteMessage) {
      payload = data.data;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${payload["name"]}"),
            Text("Age: ${payload["age"]}"),
          ],
        ),
      ),
    );
  }
}
