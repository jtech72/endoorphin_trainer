import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../services/models/request_models/category_document_model.dart';
class UploadImagesController extends GetxController {
  RxInt selectedoption = 0.obs;
  Map<String, dynamic>? certificationDetails;
  Rx<File?> fontImagePicked = Rx<File?>(null);
  Rx<File?> backImagePicked = Rx<File?>(null);
  var defaultImage = File("path_to_your_default_image");
  Future<void> openCameraOrGallery(bool isFrontImage, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      if (isFrontImage) {
        fontImagePicked.value = File(image.path);
        log("font Image ${fontImagePicked.value}");
      } else {
        backImagePicked.value = File(image.path);
        log("back Image ${backImagePicked.value}");
      }
    } else {
      print('User canceled');
    }
  }
  Future<void> selectSource(bool isFrontImage) async {
    Get.dialog(
        AlertDialog(
          title: const Text("Add Your Documents"),
          actions: <Widget>[
            TextButton(
              child: Text("Camera"),
              onPressed: () {
                 Get.back();
                openCameraOrGallery(isFrontImage, ImageSource.camera);
              },
            ),
            TextButton(
              child: Text("Gallery"),
              onPressed: () {
                Get.back();
                openCameraOrGallery(isFrontImage, ImageSource.gallery);
              },
            ),
          ],
        )

    );
  }
  Future<void> onPassport() async {
    log("message");
    showLoader();
    Map<String, String> fields = {
      'userId': certificationDetails!["userId"], // example field
      'passportName':certificationDetails!["certificateName"] , // example field
      'passportNumber':certificationDetails!["certificateNumber"] , // example field
    };
    Map<String, File> files = {
      'passportfrontImg': fontImagePicked!.value!,
      'passportbackImg': backImagePicked!.value!,
    };
    log("fields = $fields , files = $files ");
    try {
      DocumentModel result = await CallAPI.uploadPassportAndEmirates(
        fields: fields,
        files: files,
      );
      if(result.status == 200){
        dismissLoader();
        storage.write("Passport","true");
        log("Successfully uploaded");
        log("dsfghfdd${uploadImage}");

        uploadImage == UploadImage.byProfile?
        Get.offAllNamed(AppRoutes.bottomNavigation):
        Get.offAllNamed(AppRoutes.moreaboutyou);
        showSnackBar(result.message.toString());

      }else{
        dismissLoader();
        showSnackBar(result.message.toString());
        log("Failed to upload");
      }
    } catch (e,st) {
      dismissLoader();
      log('Error uploading certificate: $e');
      log('Error uploading certificate: $st');
    }
  }
  Future<void> onEmirates() async {
    log("message");
    showLoader();
    Map<String, String> fields = {
      'userId': certificationDetails!["userId"], // example field
      'emiratesName':certificationDetails!["certificateName"] , // example field
      'emiratesNumber':certificationDetails!["certificateNumber"] , // example field
    };
    Map<String, File> files = {
      'emiratesfrontImg': fontImagePicked!.value!,
      'emiratesbackImg': backImagePicked!.value!,
    };
    log("fields = $fields , files = $files ");
    try {
      DocumentModel result = await CallAPI.uploadPassportAndEmirates(
        fields: fields,
        files: files,
      );
      if(result.status == 200){
        dismissLoader();
        storage.write("Emirates ID","true");
        log("Successfully uploaded");
        log("dsfghfdd${uploadImage}");
        uploadImage == UploadImage.byProfile?
        Get.offAllNamed(AppRoutes.bottomNavigation):
        Get.offAllNamed(AppRoutes.moreaboutyou);
        showSnackBar(result.message.toString());

      }else{
        dismissLoader();
        showSnackBar(result.message.toString());
        log("Failed to upload");
      }
    } catch (e,st) {
      dismissLoader();
      log('Error uploading certificate: $e');
      log('Error uploading certificate: $st');
    }
  }
  Future<void> onCertification() async {
    showLoader();
    Map<String, String> fields = {
      'userId': certificationDetails!["userId"].toString(), // example field
      'categoryId':certificationDetails!["categoryId"].toString() ,
      'categoryName':certificationDetails!["certificateName"] , // example field
      'categoryNumber':certificationDetails!["certificateNumber"] , // example field
    };
    Map<String, File> files = {
      'documentFrontImg': fontImagePicked!.value!,
      'documentBackImg': backImagePicked!.value!,
    };
    log("fields = $fields , files = $files ");
    try {
      DocumentModel result = await CallAPI.uploadCertificate(
        fields: fields,
        files: files,
      );
      if(result.status == 200){
        dismissLoader();
        log("Successfully uploaded");
        log("sadfgg${uploadImage}");
        uploadImage == UploadImage.byProfile?
            Get.offAllNamed(AppRoutes.bottomNavigation):
        Get.offAllNamed(AppRoutes.moreaboutyou);
        showSnackBar(result.message.toString());


      }else{
        dismissLoader();
        showSnackBar(result.message.toString());
        log("Failed to upload");
      }
    } catch (e) {
      dismissLoader();
      log('Error uploading certificate: $e');
    }
  }
  void onSaveButton() {
    if (certificationDetails!["categoryName"] == "") {
      log("sadfghgfds");
      onCertification();
    } else if(certificationDetails!["categoryName"] == "Passport") {
      onPassport();
    }else{
      onEmirates();
    }
  }
  void removeImage(BuildContext context,bool isFrontImage) {
    if (isFrontImage) {
      fontImagePicked.value = null;
      log("Front image cleared");
      selectSource(true);
    } else {
      backImagePicked.value = null;
      selectSource(false);
      log("Back image cleared");
    }
  }
  @override
  void onInit() {
    certificationDetails = Get.arguments ?? "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      selectSource(true);

    });
    log("${certificationDetails}");
    super.onInit();
  }
}
