import 'package:endoorphin_trainer/utils/exports.dart';
class OtpBinding implements Bindings{
  @override
  void dependencies() {
      Get.put(OtpController());
  }
}