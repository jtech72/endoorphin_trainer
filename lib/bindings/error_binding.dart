import 'package:endoorphin_trainer/utils/exports.dart';
class ErrorBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ErrorController());
  }
}