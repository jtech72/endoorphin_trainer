import 'package:endoorphin_trainer/utils/exports.dart';
import '../controllers/bio_controller.dart';
class BioBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BioController());
  }

}