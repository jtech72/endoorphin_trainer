import 'package:endoorphin_trainer/utils/exports.dart';
class SessionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SessionDetailsController());
  }
}
