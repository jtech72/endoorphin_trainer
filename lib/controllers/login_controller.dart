import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/network_services/api_call.dart';
import '../services/network_services/notification_servies.dart';
class LoginController extends GetxController{
  NotificationServices notificationServices=NotificationServices();

  RxBool obscureText = true.obs;
  void toggleObscureText() {
    obscureText.toggle();
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
    String phoneNumber = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    if (phoneNumber.isEmpty || password.isEmpty) {
      dismissLoader();
      if (phoneNumber.isEmpty && password.isEmpty) {
        showSnackBar("Please enter your phone number and password");
      } else if (phoneNumber.isEmpty) {
        showSnackBar("Please enter your phone number");
      } else if (password.isEmpty) {
        showSnackBar("Please enter your password");
      }
      return;
    }
    Map<String, dynamic> request = {
      "loginData": "$countryCode$phoneNumber",
      "password": password,
      "deviceId": notificationServices.deviceToken ?? ""
    };

    try {
      var value = await CallAPI.login(request: request);
      if (value.status == 200) {
        if (value.result?.objectData == true) {
          storage.write("phoneNumber", "$countryCode$phoneNumber");
          storage.write("password", password);
          storage.write("userName", value.result?.userName ?? "");
          storage.write("userId", value.result?.id ?? "");
          Get.offAllNamed(AppRoutes.bio);
        } else {
          storage.write("token", value.result?.accessToken ?? "");
          storage.write("userName", value.result?.userName ?? "");
          storage.write("userId", value.result?.id ?? "");
          log("token==>${value.result?.accessToken}");
          log("UserId==>${value.result?.id}");
          Get.offAllNamed(AppRoutes.bottomNavigation);
        }
      } else {
        dismissLoader();
        showSnackBar(value.message ?? "Please enter valid credentials");
        printResult(screenName: "LOGIN CONTROLLER", msg: value.message ?? "");
      }
    } catch (e, st) {
      dismissLoader();
      showSnackBar("An error occurred during login");
      printResult(screenName: "LOGIN CONTROLLER", error: e.toString(), stackTrace: st);
    }
  }

}