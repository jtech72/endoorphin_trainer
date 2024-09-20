import 'package:endoorphin_trainer/utils/exports.dart';
class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}