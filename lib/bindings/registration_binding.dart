import 'package:endoorphin_trainer/utils/exports.dart';
class RegistrationBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegistrationController());
  }
}