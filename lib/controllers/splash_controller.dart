import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      if(storage.read('token')==null){
        Get.offAllNamed(AppRoutes.signinoption);
      }else{
        Get.offAllNamed(AppRoutes.bottomNavigation);
      }
    });
  }
}
