import 'package:endoorphin_trainer/controllers/upload_images_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
class UploadImagesBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UploadImagesController());
  }
}