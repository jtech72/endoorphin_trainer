import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      // if(storage.read('token')==null){
        Get.offAllNamed(AppRoutes.login);

      // }else{
      //   // Get.offAllNamed(AppRoutes.bottomNavigation);
      //
      // }
    });
  }
}
