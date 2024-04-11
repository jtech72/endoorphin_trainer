import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/create_new_password_controller.dart';


class CreateNewPasswordBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CreateNewPasswordController());
  }

}