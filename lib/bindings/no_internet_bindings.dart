import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/no_internet_controller.dart';
class NoInternetBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(NoInternetController());
  }

}