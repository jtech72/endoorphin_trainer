import 'dart:developer';
import 'dart:io';

import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagesController extends GetxController{
RxInt selectedoption = 0.obs;
int?  documentIndex ;
Rx<File?> fontImagePicked = Rx<File?>(null);
Rx<File?> backImagePicked = Rx<File?>(null);
Future<void> openCamera(bool isFrontImage) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  if (pickedFile != null) {
    File image = File(pickedFile.path);
    if (isFrontImage) {
      fontImagePicked.value = File(image.path);
      log("font Image${fontImagePicked!}");
    } else {
      backImagePicked.value = File(image.path);
      log("back Image${backImagePicked!}");

    }
  } else {
    print('User canceled');
  }
}
void removeImage(bool isFrontImage) {
  if (isFrontImage) {
    fontImagePicked.value = null;
    log("Front image cleared");
    openCamera(true);
  } else {
    backImagePicked.value = null;
    openCamera(false);
    log("Back image cleared");
  }
}

@override
  void onInit() {
  openCamera(true);
  documentIndex = Get.arguments;
  print(documentIndex.toString());
    super.onInit();
  }
}