import 'package:endoorphin_trainer/controllers/withdraw_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class WithdrawBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(WithdrawController());
  }

}