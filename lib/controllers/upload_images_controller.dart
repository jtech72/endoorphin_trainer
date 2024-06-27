import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../services/models/request_models/category_document_model.dart';
import 'package:open_file_manager/open_file_manager.dart';

class UploadImagesController extends GetxController {
  RxInt selectedoption = 0.obs;
  Map<String, dynamic>? certificationDetails;
  Rx<File?> fontImagePicked = Rx<File?>(null);
  Rx<File?> backImagePicked = Rx<File?>(null);
  var defaultImage = File("path_to_your_default_image");

  Future<void> openFilePicker(bool isFrontImage) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile pickedFile = result.files.first; // Get the first file

        if (pickedFile.path != null) {
          File image = File(pickedFile.path!);
          if (isFrontImage) {
            fontImagePicked.value = image;
            log("font Image ${fontImagePicked.value}");
          } else {
            backImagePicked.value = image;
            log("back Image ${backImagePicked.value}");
          }
        } else {
          print('File path is null');
        }
      } else {
        selectSource(isFrontImage);
        print('User canceled');
      }
    } catch (e) {
      selectSource(isFrontImage);
      print('Permission denied: $e');
    }
  }

  Future<void> openCameraOrGallery(bool isFrontImage, ImageSource source) async {
    final picker = ImagePicker();
    try {
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
        selectSource(isFrontImage);
        print('User canceled');
      }
    } catch (e) {
      print('Permission denied: $e');
    }
  }
  Future<void> selectSource(bool isFrontImage) async {
    log("message");
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
                openCameraOrGallery(isFrontImage, ImageSource.camera);
              },
            ),
            buildOption(
              Icons.photo_library,
              'Gallery',
                  () {
                print('Gallery opened');
                Get.back();
                openCameraOrGallery(isFrontImage, ImageSource.gallery);
              },
            ),
            buildOption(
              Icons.folder,
              'Files',
                  () {
                print('Files opened');
                Get.back();
                openFilePicker(isFrontImage);
              },
            ),
          ],
        ),
      ),
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
    );
  }
  Future<void> onPassport() async {
    showLoader();
    Map<String, String> fields = {
      'passportName':certificationDetails!["certificateName"] , // example field
      'passportNumber':certificationDetails!["certificateNumber"] ,
      "id":  certificationDetails!["id"]
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
        uploadImage == UploadImage.byProfile?
        Get.offAllNamed(AppRoutes.document):
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
    showLoader();
    Map<String, String> fields = {
      // 'userId': certificationDetails!["userId"].toString(), // example field
      'emiratesName':certificationDetails!["certificateName"] , // example field
      'emiratesNumber':certificationDetails!["certificateNumber"] ,
      "id":  certificationDetails!["id"]
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
        uploadImage == UploadImage.byProfile?
        Get.offAllNamed(AppRoutes.document):
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
        uploadImage == UploadImage.byProfile?
            Get.offAllNamed(AppRoutes.document):
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
    if (certificationDetails!["categoryId"].toString() != "") {
      onCertification();
    } else if(certificationDetails!["categoryName"] == "passport") {
      onPassport();
    }else{
      onEmirates();
    }
  }
  void removeImage(BuildContext context,bool isFrontImage) {
    if (isFrontImage) {
      fontImagePicked.value = null;
      log("Front image cleared");
    } else {
      backImagePicked.value = null;
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
Widget buildOption(IconData icon, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.yellow, // assuming AppColors.Yellow is defined somewhere
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.Black3),
          ).paddingOnly(bottom: 5),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
