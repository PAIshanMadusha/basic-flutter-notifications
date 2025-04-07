import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Notifications",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                LocalNotificationsService.showInstantNotification(
                  title: "Text",
                  body: "Text Notification By PAIshanMadusha🥰",
                );
              },
              label: Text("Send a Notification"),
              icon: Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}
