import 'package:endoorphin_trainer/utils/exports.dart';
class BioBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BioController());
  }

}