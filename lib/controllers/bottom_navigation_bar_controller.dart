import 'dart:developer';
import '../utils/exports.dart';
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