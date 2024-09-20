import 'package:endoorphin_trainer/utils/exports.dart';
class SupportBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SupportController());
  }
}