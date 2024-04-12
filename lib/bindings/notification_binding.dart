import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/notification_controller.dart';

class NotificationBinding implements Bindings {  @override
  void dependencies() {
  Get.put(NotificationController());
  }
}
