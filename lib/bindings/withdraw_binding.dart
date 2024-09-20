import 'package:endoorphin_trainer/utils/exports.dart';
class WithdrawBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(WithdrawController());
  }
}