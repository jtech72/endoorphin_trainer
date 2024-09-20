import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
class SupportController extends GetxController{
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
Future<void> onSendButton() async {
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp emailRegExp = RegExp(emailPattern);
  String phonePattern = r'^\d{9}$'; // Adjust the length as per your requirements
  RegExp phoneRegExp = RegExp(phonePattern);
  if (nameController.text.isEmpty ||
      emailController.text.isEmpty ||
      phoneNumberController.text.isEmpty ||
      descriptionController.text.isEmpty) {
    showSnackBar("Please fill all the fields");
  } else if (!emailRegExp.hasMatch(emailController.text.trim())) {
    showSnackBar("Please enter a valid email address");
  } else if (!phoneRegExp.hasMatch(phoneNumberController.text.trim())) {
    showSnackBar("Please enter a valid phone number");
  } else {
    showLoader();
    try {
      var request = {
        "userId": "${storage.read("userId")}",
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "phoneNumber": phoneNumberController.text.trim(),
        "descripition": descriptionController.text.trim(),
      };
      final response = await CallAPI.supportRequest(request: request);
      if (response.status == 200) {
        dismissLoader();
        Get.back();
        showSnackBar("Your problem will be resolved soon...");
      } else {
        dismissLoader();
        showSnackBar("Something went wrong");
      }
    } catch (e, st) {
      dismissLoader();
      log(e.toString());
      log(st.toString());
    }
  }
}
}