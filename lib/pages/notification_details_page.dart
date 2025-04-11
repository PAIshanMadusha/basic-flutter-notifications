import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Payload Data from the Notification
    Map<String, dynamic> payload = {};

    //Get the Payload Data Form the Notification
    final data = ModalRoute.of(context)!.settings.arguments;

    bool isValidPayload = false;

    if (data is RemoteMessage) {
      payload = data.data;
      isValidPayload = payload.isNotEmpty;
    }

    if (data is NotificationResponse) {
      final payloadString = data.payload;
      if (payloadString != null && payloadString.trim().isNotEmpty) {
        try {
          payload = jsonDecode(payloadString);
          isValidPayload = payload.isNotEmpty;
        } catch (e) {
          debugPrint("JSON decode error: $e");
        }
      } else {
        debugPrint("Empty or null payload string");
      }
    }
    if (!isValidPayload) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payload Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_outlined, color: Colors.greenAccent, size: 150),
            SizedBox(height: 15),
            Text(
              "Name: ${payload["name"] ?? 'N/A'}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Age: ${payload["age"] ?? 'N/A'}",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
