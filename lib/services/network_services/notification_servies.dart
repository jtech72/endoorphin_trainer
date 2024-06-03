import 'dart:developer';
import 'dart:io';

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

    log("FIREBASE MESSAGE ${message.notification!.title.toString()}");log("FIREBASE BODY ${message.notification!.body.toString()}");
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
    AndroidNotificationChannel channel=const AndroidNotificationChannel( "high_importance_channel", "high_importance_channel",importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        channel.id.toString(), channel.name.toString(),
        channelDescription: "Description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker"
    );
    DarwinNotificationDetails darwinNotificationDetails=const DarwinNotificationDetails(presentAlert: true,
        presentBadge: true,presentSound: true);
    NotificationDetails notificationDetails=NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );
    Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin
          .show(0, message.notification!.title.toString(), message.notification!.body.toString(), notificationDetails);
    });
  }
  void handleNotification(RemoteMessage message){
    log("NOTIFICATION DATA: ${message.data.toString()}");

  }
  Future foregroundMessage()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
  }
}