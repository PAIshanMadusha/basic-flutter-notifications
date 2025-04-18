# 📲 Basic Flutter Notifications App

A simple and powerful **Basic Flutter Notifications App** built with **Firebase Messaging** and **Local Notifications**, demonstrating various types of notifications, including instant, scheduled, recurring, big picture, and push notifications. The app also handles payload data and notification behavior across different app states: foreground, background, and terminated.

## 🚀 Features:

### 🔔 Local Notifications:
- **Send Instant Notification**: Triggered immediately.
- **Schedule Notification**: Scheduled to trigger after 5 seconds.
- **Recurring Notification**: Repeats at a fixed interval.
- **Big Picture Notification**: Displays an image in the notification.

### 📬 Push Notifications (Firebase Cloud Messaging):
- **Receive Notifications** in:
- Foreground State
- Background State
- App Terminated State
- **Handle Payload Data**: When a user taps a notification, payload data is shown on a separate page.

## 🧪 How It Works:

| Notification Type        | Trigger Mechanism        | Description                                                                                             |
|--------------------------|--------------------------|---------------------------------------------------------------------------------------------------------|
| Instant Notification     | Button tap               | Sends a notification immediately using local notifications.                                             |
| Scheduled Notification   | Button tap               | Triggers a notification 5 seconds after the button is clicked.                                          |
| Recurring Notification   | Button tap               | Sends a recurring notification at regular intervals.                                                    |
| Big Picture Notification | Button tap               | Displays a notification with a large image using the big picture style.                                 |
| Push Notification        | Sent via Firebase        | Arrives whether app is foreground, background, or terminated.                                           |
| Payload Data             | Sent via Firebase        | When Notification is click Opens a separate screen displaying additional data passed via notification.  |

## 🛠️ Dependencies:
The following technologies are used in this project:

```yaml
flutter_local_notifications: ^19.0.0
timezone: ^0.10.0
firebase_core: ^3.13.0
firebase_messaging: ^15.2.5
```

## 🧰 Technologies Used:
The following technologies are used in this project:

- **Flutter**: Framework for building cross-platform apps.
- **Dart**: Programming language used with Flutter.
- **Firebase Core**: Core Firebase initialization and configuration.
- **Firebase Messaging**: For handling push notifications (background, foreground, terminated).
- **Flutter Local Notifications**: To display and manage local notifications.
- **Timezone**: For accurate time scheduling across different time zones.

## 🚀 How to Run the Project:
1. Clone the repository:

```sh
https://github.com/PAIshanMadusha/basic-flutter-notifications.git
```
2. Navigate to the project directory:

```sh
cd basic-flutter-notifications
```
3. Install dependencies:

```sh
flutter pub get
```
## 📥 Set up Firebase:
   
### 📝 To use Firebase services in this project, follow these steps:

- Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
- Before enabling Firebase Cloud Messaging, you need to connect your Flutter project to Firebase.
- For this project, I used the FlutterFire CLI to do that. You should follow the same process to avoid errors.
  
### ⚠️ Not familiar with the FlutterFire CLI?

- I’ve written a detailed [Medium](https://medium.com/@ishanmadusha) article explaining the step-by-step process to connect Firebase to Flutter using the CLI with screenshots to guide 
  you through it. **📖 Read my article on Medium here:** [Link](https://medium.com/@ishanmadusha/using-firebase-cli-to-easily-connect-firebase-with-your-flutter-app-927e0021bc44)
- So, follow the above steps and add Firebase to your Flutter project using the FlutterFire CLI.

### ✅ Now you can run the app. Make sure there are no errors:
   ```bash
   flutter run
   ```

- Next, in the Firebase Console's left sidebar under the Run section, you'll find Messaging.
- Click Create your first campaign, select Firebase Notification Messages, and proceed to create the campaign.
- In the Notification section, fill in the required details.
- Under Additional options, for the payload data, provide the key and value exactly as defined in "lib/pages/notification_details_page.dart". Then, click Review and Publish.

## 📸 System Screenshots:

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/3449fb64-a7c4-42f4-a018-6281f91e98e2" alt="Screenshot 1" width="175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/5bdf20d4-f1bd-4486-8eb9-059ee905b842" alt="Screenshot 2" width="175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/75612d0e-e59b-4e77-8940-abfbdfff078d" alt="Screenshot 3" width="175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/1432b605-54e7-404f-a7cd-6990befb8790" alt="Screenshot 3" width="175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>

---

## 👤 About This Project:

I created this project to improve my **Flutter** and **Firebase** knowledge, as well as to enhance my development skills. I'm excited to share it with you, and I hope you find it useful!

### 👨‍💻 Created by: 
**Ishan Madhusha**  
GitHub: [PAIshanMadusha](https://github.com/PAIshanMadusha)

Feel free to explore my work and get in touch if you'd like to collaborate! 🚀

---

## 📝 License:
This project is open-source and available under the MIT License.
