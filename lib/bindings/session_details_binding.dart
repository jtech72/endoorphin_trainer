import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/session_details_controller.dart';

class SessionDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SessionDetailsController());
  }
}
