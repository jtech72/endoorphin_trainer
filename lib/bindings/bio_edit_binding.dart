import 'package:endoorphin_trainer/utils/exports.dart';
class BioEditBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BioEditController());
  }

}