import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/network_services/api_call.dart';
import '../services/network_services/notification_servies.dart';
class LoginController extends GetxController{
  NotificationServices notificationServices=NotificationServices();

  RxBool obscureText = true.obs;
  void toggleObscureText() {
    obscureText.toggle(); // Toggle the RxBool value
  }
  String countryCode = "+971";
  TextEditingController phoneNumberController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  @override
  void onInit() {
    notificationServices.getDeviceToken();
    notificationServices.isDeviceTokenRefresh();
    super.onInit();
  }
  void onLogin() async {
    showLoader();
    if (phoneNumberController.text.trim().isEmpty) {
      dismissLoader();
      showSnackBar("Please enter your phone number/password");
    } else if (passwordController.text.trim().isEmpty) {
      dismissLoader();
      showSnackBar("Please enter your password");
    } else {
      Map<String, dynamic> request = {
        "loginData": phoneNumberController.text.trim(),
        "password": passwordController.text.trim(),
        "deviceId": notificationServices.deviceToken ??""
      };
      try {
        await CallAPI.login(request: request).then((value) {
          if (value.status == 200) {
            storage.write("token", value.result!.accessToken);
            storage.write("userName", value.result!.userName);
            storage.write("userId", value.result!.id);
            log("token==>${value.result!.accessToken}");
            log("UserId==>${value.result!.id}");
            Get.offAllNamed(AppRoutes.bottomNavigation);
          } else {
            dismissLoader();
            showSnackBar(value.message ?? "Please enter valid credentials");
            printResult(
                screenName: "LOGIN CONTROLLER", msg: value.message ?? "");
          }
        });
      } catch (e, st) {
        printResult(
            screenName: "LOGIN CONTROLLER",
            error: e.toString(),
            stackTrace: st);
      }
    }
  }

}