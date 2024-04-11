import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/verify_phone_number_controller.dart';

class VerifyPhoneNumberBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(VerifyPhoneNumberController());
  }

}