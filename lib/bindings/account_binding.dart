import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/account_controller.dart';

class AccountBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(AccountController());
  }

}