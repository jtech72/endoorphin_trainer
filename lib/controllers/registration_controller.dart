import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import '../services/models/response_models/get_category_model.dart';
import '../services/network_services/api_call.dart';
import '../services/network_services/notification_servies.dart';
class RegistrationController extends GetxController{
  // NotificationServices notificationServices=NotificationServices();
 RxBool isValidVisible = false.obs;
  RxBool obscureText = true.obs;
  RxBool obscureText1 = true.obs;
  var categories = <dynamic>[].obs;
  var selectedItems = <String>[].obs;
  var selectedItemsName = <String>[].obs;
  var isOptionsVisible = false.obs;
  var isCategoriesVisible = false.obs;
 final items2 = ['Male','Female',];
 final selectedOption1 = 'Select Gender'.obs;
 TextEditingController firstNameController = TextEditingController();
 TextEditingController lastNameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController confirmPasswordController = TextEditingController();
 TextEditingController genderController = TextEditingController();
  void toggleOptionsVisibility() {
    isOptionsVisible.value = !isOptionsVisible.value;
  }
  void toggleObscureText() {
    obscureText.toggle(); // Toggle the RxBool value
  }
  void toggleObscureText1() {
    obscureText1.toggle(); // Toggle the RxBool value
  }
  void toggleSelection(String id,String name) {
    if (selectedItems.contains(id)||selectedItemsName.contains(name)) {
      selectedItems.remove(id);
      selectedItemsName.remove(name);
    } else {
      selectedItems.add(id);
      selectedItemsName.add(name);
    }
  }
  void toggleVisibility() {
    isCategoriesVisible.value = !isCategoriesVisible.value;
  }
  /// ON CONTINUE BUTTON
  Future<void> onContinueButton() async {
    if (firstNameController.text.isEmpty) {
      showSnackBar("Please enter first name");
    } else if (lastNameController.text.isEmpty) {
      showSnackBar("Please enter last name");
    } else if (emailController.text.isEmpty) {
      showSnackBar("Please enter email");
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.trim())) {
      showSnackBar("Please enter valid email");
    } else if (passwordController.text.isEmpty) {
      showSnackBar("Please enter password");
    } else if (passwordController.text.trim().length < 8) {
      showSnackBar("Password should be at least 8 characters");
    } else if (confirmPasswordController.text.isEmpty) {
      showSnackBar("Please enter confirm password");
    } else if (passwordController.text != confirmPasswordController.text) {
      showSnackBar("Password and confirm password do not match");
    } else if (selectedOption1.value == 'Select Gender') {
      showSnackBar("Please select gender");
    } else if (selectedItems == null) {
      showSnackBar("Please select at least one category");
    } else {
      // All fields are filled and validated, proceed with API call
      Map<String, dynamic> request = {
        "userName": firstNameController.text.trim(),
        "email": emailController.text.trim(),
        "phoneNumber": storage.read("phoneNumber"),
        "password": passwordController.text.trim(),
        "role": "trainer",
        "gender": selectedOption1.value.toString(),
        "lastName": lastNameController.text.trim(),
        "categoryId": selectedItems.value
      };

      log("DATA FOR PROFILE INFO $request");

      try {
        showLoader();
        await CallAPI.uploadUserdata(request: request).then((value) {
          if (value.status == 200) {
            // onLogin();
            dismissLoader();
            storage.write("userId", value.userId.toString());
            storage.write("password", passwordController.text.trim());
            log("Success");
            Get.offAllNamed(AppRoutes.moreaboutyou, arguments: value.userId.toString());
          } else {
            dismissLoader();
            log("Failed");
            showSnackBar(value.message);
          }
        });
      } catch (e, st) {
        log(e.toString());
        log(st.toString());
        dismissLoader();
      }
    }
  }
  void onInit() {
  // notificationServices.getDeviceToken();
  // notificationServices.isDeviceTokenRefresh();
  fetchCategories();

  super.onInit();
}
  void fetchCategories() async {
    try {
      GetCategoryModel result = await CallAPI.getCategory();
      categories.value = result.result ?? [];
    } catch (error) {
      // Handle error appropriately
      print("Error fetching categories: $error");
      categories.value = [];
    }
  }
// void toggleItem(dynamic item, int index) {
//   if (checkedList.length <= index) {
//     // Expand the list to accommodate the new item's index
//     checkedList.addAll(List.filled(index - checkedList.length + 1, false));
//   }
//   checkedList[index] = !checkedList[index]; // Toggle the checked state
// }
// void onLogin() async {
//     Map<String, dynamic> request = {
//       "loginData": storage.read("phoneNumber"),
//       "password": passwordController.text.trim(),
//       "deviceId": notificationServices.deviceToken ??""
//     };
//     try {
//       await CallAPI.login(request: request).then((value) {
//         if (value.status == 200) {
//           storage.write("token", value.result!.accessToken);
//           storage.write("userName", value.result!.userName);
//           storage.write("userId", value.result!.id);
//           log("token==>${value.result!.accessToken}");
//           log("UserId==>${value.result!.id}");
//         } else {
//           printResult(screenName: "LOGIN CONTROLLER", msg: value.message ?? "");
//         }
//       });
//     } catch (e, st) {
//       printResult(
//           screenName: "LOGIN CONTROLLER",
//           error: e.toString(),
//           stackTrace: st);
//     }
//   }
}
