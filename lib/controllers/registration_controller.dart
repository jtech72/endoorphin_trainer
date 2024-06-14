import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import '../services/network_services/api_call.dart';
import '../services/network_services/notification_servies.dart';
class RegistrationController extends GetxController{
  NotificationServices notificationServices=NotificationServices();

  RxBool obscureText = true.obs;
  RxBool obscureText1 = true.obs;
  void toggleObscureText() {
    obscureText.toggle(); // Toggle the RxBool value
  }
  void toggleObscureText1() {
    obscureText1.toggle(); // Toggle the RxBool value
  }
  final items2 = ['Male','Female',];
  var checkedList = <bool>[].obs;
  var selectedOne2 = <int>[].obs;
  final selectedOption1 = 'Select Gender'.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();


  void toggleItem(dynamic item, int index) {
    if (checkedList.length <= index) {
      // Expand the list to accommodate the new item's index
      checkedList.addAll(List.filled(index - checkedList.length + 1, false));
    }
    checkedList[index] = !checkedList[index]; // Toggle the checked state
  }

  /// ON CONTINUE BUTTON
  Future<void> onContinueButton()async {
    if (firstNameController.text.isEmpty || lastNameController.text.isEmpty || emailController.text.isEmpty  || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      showSnackBar("All fields must be filled to continue");
      return; // Exit early as we don't need to proceed further
    }else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.trim())) {
      showSnackBar("Please enter valid email");
    } else if (passwordController.text.trim().length < 8) {
      showSnackBar("Password should be at least 8 characters");
    } else if (passwordController.text != confirmPasswordController.text) {
      showSnackBar("Password and confirm password do not match");
      return; // Exit early as we don't need to proceed further
    } else if (selectedOne2.isEmpty) {
      showSnackBar("Please select at least one category to continue");
      return; // Exit early as we don't need to proceed further
    } else{
      Map<String, dynamic> request = {
      "userName" : firstNameController.text.trim(),
        "email" :  emailController.text.trim(),
        "phoneNumber": storage.read("phoneNumber"),
        "password": passwordController.text.trim(),
        "role": "trainer",
        "gender":selectedOption1.value.toString(),
        "lastName":lastNameController.text.trim(),
        "categoryId": selectedOne2.value
      };
      log("DATA FOR PROFILE INFO $request");
      try {
        showLoader();
        await CallAPI.uploadUserdata(request: request).then((value) {
          if (value.status == 200) {
            onLogin();
            dismissLoader();
            storage.write("userId", value.userId.toString());

            log("Success");
            Get.offAllNamed(AppRoutes.moreaboutyou ,arguments: value.userId.toString());
          } else {
            dismissLoader();
            log("failed");
            showSnackBar(value.message);
          }
        });
      } on Exception catch (e,st) {
        log(e.toString());
        log(st.toString());
        dismissLoader();
      }
    }
  }
  void onLogin() async {
      Map<String, dynamic> request = {
        "loginData": storage.read("phoneNumber"),
        "password": passwordController.text.trim(),
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

void onInit() {
  notificationServices.getDeviceToken();
  notificationServices.isDeviceTokenRefresh();
  super.onInit();
}
}
