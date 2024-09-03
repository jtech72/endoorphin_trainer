import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
class NotificationServices {
  String? deviceToken;
  static String notificationType="";
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      sound: true,
      provisional: false,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("PERMISSION GRANTED");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("PERMISSION GRANTED");
    } else {
      log("PERMISSION NOT GRANTED");
    }
  }

  Future<String?> getDeviceToken() async {
    String? token = await messaging.getToken();
    deviceToken=token;
    log("FIREBASE DEVICE TOKEN => $token");

    return token;
  }
  Future<String?> isDeviceTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      deviceToken=event;
      log("FIREBASE DEVICE TOKEN REFRESH $event");
    });
    return deviceToken;
  }
  void initLocationNotification(BuildContext context, RemoteMessage message) async {
    var androidInitializations =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializations = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitializations, iOS: iosInitializations);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          handleNotification(message);
        });
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      log("FIREBASE MESSAGE ${message.notification?.title}");
      log("FIREBASE BODY ${message.notification?.body}");
      log("FIREBASE DATA ${message.data}");

      if (Platform.isIOS) {
        foregroundMessage();
      }
      if (Platform.isAndroid) {
        initLocationNotification(Get.context!, message);
        showNotification(message);
      }
      if (message.data["status"] == "true") {
       Get.offAllNamed(AppRoutes.bottomNavigation);
      }
    });
  }
  void setInteractMessage()async{
    /// WHEN APPLICATION TERMINATED
    RemoteMessage? initialMessage=await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!=null){
      handleNotification(initialMessage);
    }
    /// WHEN APPLICATION IN BACKGROUND

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleNotification(message);
    });

  }
  void showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "high_importance_channel",
      "high_importance_channel",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Description",
      importance: Importance.max,
      priority: Priority.high,
      ticker: "ticker",
    );

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentBanner: true,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    final notificationBody = message.notification?.body;

    if (notificationBody != null) {
      log("NOTIFICATION DATA: $notificationBody");

      // Extract and clean up relevant data
      final keyValuePairs = notificationBody.split(',');
      final Map<String, String> data = {};
      for (var pair in keyValuePairs) {
        // Using a regular expression to split each pair only at the first colon
        final keyValue = pair.split(RegExp(r'(?<!http[s]?):'));
        if (keyValue.length == 2) {
          final key = keyValue[0].trim();
          final value = keyValue[1].trim();
          data[key] = value;
        }
      }

      // Extract specific information
      final name = data['Name'] ?? 'Unknown';
      final lastName = data['lastName'] ?? 'Unknown';
      final address = data['Address'] ?? 'Unknown';

      // Show the notification with cleaned up data
      Future.delayed(Duration.zero, () {
        flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
        );
      });
    } else {
      log("Notification body is null");
    }
  }

  void handleNotification(RemoteMessage message) {
    final Map<String, dynamic> data = message.data;

    if (data.isNotEmpty) {
      try {
        // Directly access the values from the data map
        final lastName = data['lastName'] ?? '';
        final phoneNumber = data['phoneNumber'] ?? '';
        final city = data['city'] ?? '';
        final addressType = data['addressType'] ?? '';
        final userName = data['userName'] ?? '';
        final type = data['type'] ?? '';
        final userId = data['userId'] ?? '';
        final userLong = data['userLong'] ?? '';
        final categoryLogo = data['categoryLogo'] ?? '';
        final userProfile = data['userProfile'] ?? '';
        final userLat = data['userLat'] ?? '';
        final status = data['status'] ?? '';

        // Construct address using city and addressType if needed
        final address = '$addressType, $city';

        // Navigating to the specified route with extracted data
        Get.toNamed(AppRoutes.bookingrequest, arguments: {
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "address": address,
          "userName": userName,
          "type": type,
          "userId": userId,
          "userLong": userLong,
          "categoryLogo": categoryLogo,
          "userProfile": userProfile,
          "userLat": userLat,
          "status": status,
        });
      } catch (e, st) {
        log("Error parsing notification data: $e");
        log("Stack trace: $st");
      }
    } else {
      log("Notification data is empty");
    }
  }

  Future foregroundMessage()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
  }
}