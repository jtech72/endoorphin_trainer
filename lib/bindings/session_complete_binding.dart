import 'package:endoorphin_trainer/utils/exports.dart';
class SessionCompleteBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SessionCompleteController());
  }
}