
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/splash_controller.dart';
class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}