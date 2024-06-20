
import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/registration_controller.dart';


class RegistrationBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegistrationController());
  }

}