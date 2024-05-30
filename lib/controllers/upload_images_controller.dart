import 'dart:developer';
import 'dart:io';

import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/models/request_models/category_document_model.dart';

class UploadImagesController extends GetxController {
  RxInt selectedoption = 0.obs;
  Map<String, dynamic>? certificationDetails;
  Rx<File?> fontImagePicked = Rx<File?>(null);
  Rx<File?> backImagePicked = Rx<File?>(null);
  var defaultImage = File("path_to_your_default_image");

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
        Get.offAllNamed(AppRoutes.moreaboutyou);
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
        Get.offAllNamed(AppRoutes.moreaboutyou);
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
      'categoryId':certificationDetails!["categoryId"].toString() , // example field
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
        Get.offAllNamed(AppRoutes.moreaboutyou);
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
      onCertification();
    } else if(certificationDetails!["categoryName"] == "Passport") {
      onPassport();
    }else{
      onEmirates();
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
    certificationDetails = Get.arguments ?? "";
    log("${certificationDetails}");
    super.onInit();
  }
}
