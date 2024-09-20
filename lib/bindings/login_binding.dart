import 'package:endoorphin_trainer/utils/exports.dart';
class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}