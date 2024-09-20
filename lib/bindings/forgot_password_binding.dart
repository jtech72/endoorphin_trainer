import 'package:endoorphin_trainer/utils/exports.dart';
class ForgotPasswordBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(ForgotPasswordController());
  }
}