import 'package:endoorphin_trainer/controllers/sign_in_option_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class SignInOptionBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SignInOptionController());
  }

}