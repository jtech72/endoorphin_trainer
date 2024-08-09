import 'dart:convert';
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

  void firebaseInit() {FirebaseMessaging.onMessage.listen((message) {
    RemoteNotification? notification=message.notification;
    AndroidNotification? android=message.notification!.android;

    log("FIREBASE MESSAGE ${message.notification!.title.toString()}");
    log("FIREBASE BODY ${message.notification!.body..toString()}");
    log("FIREBASE DATA ${message.data.toString()}");
    if(Platform.isIOS) {
      foregroundMessage();
    }
    if(Platform.isAndroid){
      initLocationNotification(Get.context!, message);
      showNotification(message);
    }


  });}
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
      final address = data['Address'] ?? 'Unknown';

      // Show the notification with cleaned up data
      Future.delayed(Duration.zero, () {
        flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          "Name: $name, Address: $address",
          notificationDetails,
        );
      });
    } else {
      log("Notification body is null");
    }
  }
  void handleNotification(RemoteMessage message) {
    final notificationBody = message.notification?.body;

    if (notificationBody != null) {
      log("NOTIFICATION DATA: $notificationBody");

      try {
        // Splitting the notification body by commas to separate key-value pairs
        final keyValuePairs = notificationBody.split(',');

        // Initialize an empty map to hold the parsed key-value pairs
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

        final name = data['Name'] ?? '';
        final address = data['Address'] ?? '';
        final contact = data['Contact'] ?? '';
        final userId = data['userId'] ?? '';
        final userProfile = data['userProfile'] ?? '';
        final userLat = data['userLat'] ?? '';
        final userLong = data['userLong'] ?? '';
        final categoryLogo = data['categoryLogo'] ?? '';

        Get.toNamed(AppRoutes.bookingrequest, arguments: {
          "name": name,
          "address": address,
          "contact": contact,
          "userId": userId,
          "userProfile": userProfile,
          "userLat": userLat,
          "userLong": userLong,
          "categoryLogo": categoryLogo,
        });
      } catch (e) {
        log("Error parsing notification data: $e");
      }
    } else {
      log("Notification body is null");
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