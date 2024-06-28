import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/models/request_models/category_document_model.dart';
import '../services/network_services/api_call.dart';
class AccountController extends GetxController {
  var isOptionsVisible = false.obs;
  final selectedOption1 = 'Select'.obs;
  final items2 = ['Male','Female',];
  void toggleOptionsVisibility() {
    isOptionsVisible.value = !isOptionsVisible.value;
  }
  Rx<File?> profileImage = Rx<File?>(null);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Future<void> openCameraOrGallery(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      profileImage.value = File(image.path);
      log("font Image ${profileImage.value}");
    } else {
      print('User canceled');
    }
  }
  Future<void> selectSource() async {
    await Get.bottomSheet(
      Container(
        width: Get.width,
        height: Get.height*0.13,
        decoration: const BoxDecoration(
          color: AppColors.Black3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildOption(
              Icons.camera_alt,
              'Camera',
                  () {
                print('Camera opened');
                Get.back();
                openCameraOrGallery(ImageSource.camera);
              },
            ),
            buildOption(
              Icons.photo_library,
              'Gallery',
                  () {
                print('Gallery opened');
                Get.back();
                openCameraOrGallery(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),

      backgroundColor: Colors.white,
    );
  }

  Future<void> onUpdateButton() async {
    if (firstNameController.text.isEmpty) {
      showSnackBar("Please enter first name");
    }else if (firstNameController.text.length < 2) {
      showSnackBar("Please fill correct first name");
    } else if(lastNameController.text.isEmpty) {
      showSnackBar("Please enter last name");
    }else if (lastNameController.text.length < 2) {
      showSnackBar("Please fill correct last name");
    } else if(emailController.text.isEmpty) {
      showSnackBar("Please enter email");
    }else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.trim())) {
      showSnackBar("Please enter valid email");
    }
    else {
      // showLoader();

      Map<String, String> fields = {
        "id": storage.read("userId").toString(),
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
      }
      log("fields = $fields , files = $files ");
      try {
        DocumentModel result = await CallAPI.uploadProfileDetails(
          fields: fields,
          files: files,
        );
        if (result.status == 200) {
          dismissLoader();
          Get.offAllNamed(AppRoutes.profile);
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
}
