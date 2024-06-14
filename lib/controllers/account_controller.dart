import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:image_picker/image_picker.dart';

import '../services/models/request_models/category_document_model.dart';
import '../services/network_services/api_call.dart';
class AccountController extends GetxController {
  final selectedOption1 = 'Select'.obs;
  final items2 = ['Male','Female',];
  Rx<File?> profileImage = Rx<File?>(null);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      profileImage.value = File(image.path);
      log("font Image${profileImage!}");
    } else {
      print('User canceled');
    }
  }

  Future<void> onUpdateButton() async {
    showLoader();
    Map<String, String> fields = {
      "id":storage.read("userId").toString(),
      "userName": firstNameController.text.trim(),
      "email": emailController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "phoneNumber": phoneNumberController.text.trim(),
      "bio": bioController.text.trim(),
      "gender": selectedOption1.value.toString(),
    };
    Map<String, File> files = {};
    if (profileImage?.value != null) {
      files['profileImg'] = profileImage!.value!;
    }    log("fields = $fields , files = $files ");
    try {
      DocumentModel result = await CallAPI.uploadProfileDetails(
        fields: fields,
        files: files,
      );
      if (result.status == 200) {
        dismissLoader();
        Get.back();
        showSnackBar(result.message.toString());
        log("Successfully uploaded");
      } else {
        dismissLoader();
        showSnackBar(result.message.toString());
        log("Failed to upload");
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }

  }

}
