import '../controllers/session_running_controller.dart';
import '../utils/exports.dart';

class SessionRunningBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SessionRunningController());
  }

}
