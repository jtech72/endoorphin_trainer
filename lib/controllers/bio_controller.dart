import 'dart:developer';
import 'dart:io';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/models/request_models/category_document_model.dart';
import '../services/network_services/api_call.dart';
import '../services/network_services/notification_servies.dart';

class BioController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  NotificationServices notificationServices=NotificationServices();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController professionalTitleController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController expertiseController = TextEditingController();
  TextEditingController funFactsController = TextEditingController();
  TextEditingController motivationalQuoteController = TextEditingController();
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
  Future<void> onSubmitButton(BuildContext context) async {
    if (profileImage.value == null) {
      showSnackBar("Please select a profile image");
    } else if (nicknameController.text.isEmpty ||
        professionalTitleController.text.isEmpty ||
        experienceController.text.isEmpty) {
      showSnackBar("Please fill all the mandatory fields");
    } else {
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
          onLogin();
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
  void onLogin() async {
    Map<String, dynamic> request = {
      "loginData": storage.read("phoneNumber"),
      "password":storage.read("password") ,
      "deviceId": notificationServices.deviceToken ??""
    };
    try {
      await CallAPI.login(request: request).then((value) {
        if (value.status == 200) {
          storage.write("token", value.result!.accessToken);
          storage.write("userName", value.result!.userName);
          storage.write("userId", value.result!.id);
          log("token==>${value.result!.accessToken}");
          log("UserId==>${value.result!.id}");
        } else {
          printResult(screenName: "LOGIN CONTROLLER", msg: value.message ?? "");
        }
      });
    } catch (e, st) {
      printResult(
          screenName: "LOGIN CONTROLLER",
          error: e.toString(),
          stackTrace: st);
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
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Image.asset(
                  ImagesPaths.cooltick,
                  scale: 4,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ],
            ),
            content: SizedBox(
                width: Get.width, // Set width as per your requirement
                height: Get.height * 0.07, // Set height as per your requirement
                child: Text(
                  'Your onboarding process has been\nsuccessfully completed. You will be\nnotified for further action.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                )),
            actions: [
              Center(
                child: InkButton(
                    child: Text(
                      'OK',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: AppColors.black,
                              fontSize: 18,
                              fontFamily: 'Montserrat'),
                    ),
                    onTap: () {
                      Get.offAllNamed(AppRoutes.bottomNavigation);
                    },
                    height: 35,
                    width: 95),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }

  @override
  void onInit() {
    notificationServices.getDeviceToken();
    notificationServices.isDeviceTokenRefresh();
    super.onInit();
  }
}
