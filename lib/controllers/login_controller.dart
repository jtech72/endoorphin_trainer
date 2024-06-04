import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/network_services/api_call.dart';
class LoginController extends GetxController{
  RxBool obscureText = true.obs;
  void toggleObscureText() {
    obscureText.toggle();
  }
  String countryCode = "+971";
  TextEditingController phoneNumberController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();

  void onLogin() async {
    showLoader();
    if (phoneNumberController.text.trim().isEmpty && passwordController.text.trim().isEmpty) {
      dismissLoader();
      showSnackBar("Please enter your phone number/password");
    } else if (passwordController.text.trim().isEmpty) {
      dismissLoader();
      showSnackBar("Please enter your password");
    }else if (phoneNumberController.text.trim().isEmpty) {
      dismissLoader();
      showSnackBar("Please enter your phone number");
    }
    else {
      Map<String, dynamic> request = {
        "loginData": phoneNumberController.text.trim(),
        "password": passwordController.text.trim()
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