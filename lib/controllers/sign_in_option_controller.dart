
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/app_routes.dart';

class SignInOptionController extends GetxController{
  RxBool isLoginOptionsVisible = false.obs;
  void onCreateAccount(){
    Get.toNamed(AppRoutes.countrycode);
  }

  void onSignIn(){
    Get.toNamed(AppRoutes.login);
    // isLoginOptionsVisible.value = true;
  }
  void onOtp(){
    Get.toNamed(AppRoutes.login,arguments: "Otp");
  }
  void onPassword(){
    Get.toNamed(AppRoutes.login,arguments: "Password");
  }

}