import 'package:endoorphin_trainer/utils/exports.dart';
class TrainerPassportBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(TrainerPassportController());
  }
}