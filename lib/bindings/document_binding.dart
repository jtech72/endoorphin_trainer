import 'package:endoorphin_trainer/controllers/document_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

class DocumentBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DocumentController());
  }

}