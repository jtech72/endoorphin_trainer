import 'package:endoorphin_trainer/controllers/home_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class HomeBindings implements Bindings {  @override
  void dependencies() {
  Get.put(HomeController());
  }
}
