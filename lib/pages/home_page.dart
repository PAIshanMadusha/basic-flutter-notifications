import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
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
            //Instant Notification
            customElevatedButton(
              onPressed: () {
                LocalNotificationsService.showInstantNotification(
                  title: "Testing Instant 📧",
                  body: "This is a Test Notification By PAIshanMadusha🥰👻",
                );
              },
              labelData: "Send a Instant Notification",
              icon: Icons.notifications,
            ),
            SizedBox(height: sizedBoxValue),
            //Schedule a Notification
            customElevatedButton(
              onPressed: () {
                //5 Second from Current Time
                DateTime duration = DateTime.now().add(
                  const Duration(seconds: 5),
                );
                LocalNotificationsService.scheduleNotification(
                  title: "Testing Schedule 📧",
                  body: "This is a Test Notification By PAIshanMadusha🥰👻",
                  scheduleDate: duration,
                );
              },
              labelData: "Schedule a Notification",
              icon: Icons.task,
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton customElevatedButton({
    required void Function()? onPressed,
    required String labelData,
    required IconData icon,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(labelData),
      icon: Icon(icon),
    );
  }
}
