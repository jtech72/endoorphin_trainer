import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class EarningBinding implements Bindings {  @override
  void dependencies() {
  Get.put(EarningController());
  }
}
