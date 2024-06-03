
import 'dart:developer';

import 'package:endoorphin_trainer/controllers/notification_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/network_services/notification_servies.dart';

class BottomNavigationBarController extends GetxController{
  NotificationServices notificationServices = Get.put(NotificationServices());
@override
  void onInit()  {
  Future.microtask(() async {
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    notificationServices.setInteractMessage();
    notificationServices.foregroundMessage();
    notificationServices.isDeviceTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      log(value.toString());
    });});
    super.onInit();
  }
}