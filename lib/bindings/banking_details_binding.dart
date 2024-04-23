import 'package:endoorphin_trainer/controllers/banking_details_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class BankingDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BankingDetailsController());
  }

}