import 'package:endoorphin_trainer/utils/exports.dart';
class AccountBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(AccountController());
  }

}