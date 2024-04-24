import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  final selectedOption1 = 'Select'.obs;
  final items2 = ['Male','Female',];

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
}
