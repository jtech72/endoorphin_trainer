import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
class BioController extends GetxController{
  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kDebugMode) {
        print('Picked file path: ${pickedFile.path}');
      }
    } else {
      print('User canceled');
    }
  }
}