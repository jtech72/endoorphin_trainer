import 'package:endoorphin_trainer/controllers/bio_edit_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class BioEditBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BioEditController());
  }

}