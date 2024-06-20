import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/models/request_models/category_document_model.dart';
import '../services/network_services/api_call.dart';

class BioController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  TextEditingController nicknameController = TextEditingController();
  TextEditingController professionalTitleController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  TextEditingController funFactsController = TextEditingController();
  TextEditingController motivationalQuoteController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      profileImage.value = File(image.path);
      log("font Image${profileImage!}");
    } else {
      log('User canceled');
    }
  }

  Future<void> onSubmitButton(BuildContext context) async {
    if (profileImage.value == null) {
      showSnackBar("Please select a profile image");
    }
    else if (nicknameController.text.isEmpty|| professionalTitleController.text.isEmpty || experienceController.text.isEmpty){
      showSnackBar("Please fill all the mandatory fields");

    }
    else {
      showLoader();
      Map<String, String> fields = {
        'id': storage.read("userId").toString(),
        'nickName': nicknameController.text.trim(),
        'professionalTitle': professionalTitleController.text.trim(),
        'yearExperience': experienceController.text.trim(),
        'areaExpertise': expertiseController.text.trim(),
        'funFact': funFactsController.text.trim(),
        'quote': motivationalQuoteController.text.trim(),
        'bio': bioController.text.trim(),
      };
      Map<String, File> files = {
        'profileImg': profileImage!.value!,
      };
      log("fields = $fields , files = $files ");
      try {
        DocumentModel result = await CallAPI.uploadProfileDetails(
          fields: fields,
          files: files,
        );
        if (result.status == 200) {
          dismissLoader();
          log("Successfully uploaded");
          showDialogBox(context);
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

  showDialogBox(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.bottomNavigation, (route) => false);
            return false;
          },
          child: AlertDialog(
            backgroundColor: AppColors.Black3,
            title: Column(
              children: [
                SizedBox(height: Get.height * 0.03,),
                Image.asset(ImagesPaths.cooltick, scale: 4,),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ],
            ),
            content: SizedBox(
                width: Get.width, // Set width as per your requirement
                height: Get.height * 0.07, // Set height as per your requirement
                child: Text(
                  'Your onboarding process has been\nsuccessfully completed. You’ll get\nnotified for further action.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                )),
            actions: [
              Center(
                child: InkButton(
                    child: Text('OK', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black, fontSize: 18,
                        fontFamily: 'Montserrat'),), onTap: () {
                  Get.offAllNamed(AppRoutes.bottomNavigation);
                }, height: 35, width: 95),
              ),
            ], shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),),
        );
      },
    );
  }
}
