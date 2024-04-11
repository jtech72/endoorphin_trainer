import 'package:endoorphin_trainer/utils/exports.dart';
import '../controllers/otp_controller.dart';
class OtpBinding implements Bindings{
  @override
  void dependencies() {
      Get.put(OtpController());
  }

}