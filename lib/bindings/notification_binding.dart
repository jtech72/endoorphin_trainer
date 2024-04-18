import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/notification_controller.dart';

class NotificationBinding implements Bindings {  @override
  void dependencies() {
  Get.put(NotificationController());
  }
}
