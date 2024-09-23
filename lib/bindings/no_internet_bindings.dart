import 'package:endoorphin_trainer/utils/exports.dart';
class NoInternetBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(NoInternetController());
  }
}