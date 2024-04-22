import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TrainerPassportController extends GetxController{
  int?  documentIndex ;
  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (kDebugMode) {
        print('Picked file path: ${pickedFile.path}');
      }
    } else {
      print('User canceled');
    }
  }
  @override
  void onInit() {
    documentIndex = Get.arguments;
    print(documentIndex.toString());
    super.onInit();
  }
}