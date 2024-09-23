import 'package:endoorphin_trainer/utils/exports.dart';
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