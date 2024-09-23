import 'package:endoorphin_trainer/utils/exports.dart';
class CreateNewPasswordBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CreateNewPasswordController());
  }
}