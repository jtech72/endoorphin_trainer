import 'package:endoorphin_trainer/utils/exports.dart';
import '../controllers/login_controller.dart';
class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}