import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
              onPressed: () async {
                await LocalNotificationsService.showInstantNotification(
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
              onPressed: () async {
                //5 Second from Current Time
                DateTime duration = DateTime.now().add(
                  const Duration(seconds: 5),
                );
                await LocalNotificationsService.scheduleNotification(
                  title: "Testing Schedule 📧",
                  body: "This is a Test Notification By PAIshanMadusha🥰👻",
                  scheduleDate: duration,
                );
              },
              labelData: "Schedule a Notification",
              icon: Icons.task,
            ),
            SizedBox(height: sizedBoxValue),
            //Recurring Notifications
            customElevatedButton(
              onPressed: () async {
                await LocalNotificationsService.showRecurringNotification(
                  title: "Testing Recurring",
                  body: "This is a Test Notification By PAIshanMadusha🥰👻",
                  time: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    17,
                    00,
                  ), //5.00 PM
                  day: Day.monday,
                );
              },
              labelData: "Recurring Notification",
              icon: Icons.notifications_active,
            ),
            SizedBox(height: sizedBoxValue),
            //Big Picture Notification
            customElevatedButton(
              onPressed: () async {
                await LocalNotificationsService.showBigPictureNotification(
                  title: "Testing Big Picture Notification 📧",
                  body: "This is a Test Notification By PAIshanMadusha🥰👻",
                  imageUrl: "@mipmap/ic_launcher",
                );
              },
              labelData: "Send a Big Picture Notification",
              icon: Icons.photo,
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
