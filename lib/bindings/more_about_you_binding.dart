import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/more_about_you_controller.dart';
class MoreAboutYouBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MoreAboutYouController());
  }

}