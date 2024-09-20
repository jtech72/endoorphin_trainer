import 'dart:developer';
import 'package:get/get.dart';
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