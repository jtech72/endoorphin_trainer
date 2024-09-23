import 'package:endoorphin_trainer/utils/exports.dart';
class BottomNavigationBarBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
  }
}