import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/error_controller.dart';

class ErrorBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ErrorController());
  }

}