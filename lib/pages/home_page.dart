import 'package:basic_flutter_notifications/notifications/local_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sizedBoxValue = 15;
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_on,
                    color: Colors.greenAccent,
                    size: 150,
                  ),
                ),
                SizedBox(height: sizedBoxValue),
                Text(
                  "Local Notifications",
                  style: textStyle.copyWith(
                    fontSize: 28,
                    color: Colors.greenAccent,
                  ),
                ),
                SizedBox(height: sizedBoxValue),
                Text(
                  "Tap the button below to instantly get a notification on your phone",
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: sizedBoxValue),
                //Instant Notification
                customElevatedButton(
                  onPressed: () async {
                    await LocalNotificationsService.showInstantNotification(
                      title: "Testing Instant Notification 📧",
                      body: "This is a Test Notification By PAIshanMadusha🥰👻",
                    );
                  },
                  labelData: "Send a Instant Notification",
                  icon: Icons.notifications,
                ),
                SizedBox(height: sizedBoxValue),
                Text(
                  "Tap the button below to get a notification on your phone in 5 seconds",
                  style: textStyle,
                  textAlign: TextAlign.center,
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
                      title: "Testing Schedule Notification 📧",
                      body: "This is a Test Notification By PAIshanMadusha🥰👻",
                      scheduleDate: duration,
                    );
                  },
                  labelData: "Schedule a Notification",
                  icon: Icons.task,
                ),
                SizedBox(height: sizedBoxValue),
                Text(
                  "Tap the button below to get recurring notifications on your phone(Receive recurring notifications based on a schedule or at a time you selected.)",
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: sizedBoxValue),
                //Recurring Notifications
                customElevatedButton(
                  onPressed: () async {
                    await LocalNotificationsService.showRecurringNotification(
                      title: "Testing Recurring Notification 📧",
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
                Text(
                  "Tap the button below to instantly get a big picture notification on your phone",
                  style: textStyle,
                  textAlign: TextAlign.center,
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
                SizedBox(height: sizedBoxValue * 2),
                Text(
                  "Push Notifications",
                  style: textStyle.copyWith(
                    fontSize: 28,
                    color: Colors.greenAccent,
                  ),
                ),
                SizedBox(height: sizedBoxValue),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Using the Firebase Messaging Console, you can send both standard push notifications and notifications with custom payload data to your mobile.",
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customElevatedButton({
    required void Function()? onPressed,
    required String labelData,
    required IconData icon,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
        ),
        onPressed: onPressed,
        label: Text(
          labelData,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        icon: Icon(icon, size: 30, color: Colors.white),
      ),
    );
  }
}
