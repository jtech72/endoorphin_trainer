import 'package:endoorphin_trainer/utils/exports.dart';
class MoreAboutYouBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MoreAboutYouController());
  }
}