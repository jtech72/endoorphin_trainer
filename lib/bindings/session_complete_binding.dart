import 'package:endoorphin_trainer/controllers/session_complete_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class SessionCompleteBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SessionCompleteController());
  }

}