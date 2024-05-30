import 'dart:developer';
import 'dart:ffi';
import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/network_services/api_call.dart';
class RegistrationController extends GetxController{
  final items2 = ['Male','Female',];
  RxList<int> selectedOne2 = <int>[].obs;
  RxList<bool> checkedList = <bool>[].obs;
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
    }
    if (passwordController.text != confirmPasswordController.text) {
      showSnackBar("Password and confirm password do not match");
      return; // Exit early as we don't need to proceed further
    }
    if (selectedOne2.isEmpty) {
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
            dismissLoader();
            storage.write("userId", value.userId.toString());

            log("Success");
            Get.toNamed(AppRoutes.moreaboutyou ,arguments: value.userId.toString());
          } else {
            dismissLoader();
            log("failed");
            showSnackBar(value.message);
          }
          //
        });
      } on Exception catch (e,st) {
        log(e.toString());
        log(st.toString());
        dismissLoader();
      }


    }


  }


}
