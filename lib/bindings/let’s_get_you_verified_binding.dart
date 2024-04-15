import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/let’s_get_you_verified_controller.dart';
class LetGetYouVerifiedBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LetGetYouVerifiedController());
  }

}