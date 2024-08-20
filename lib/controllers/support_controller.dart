import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

class SupportController extends GetxController{
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
Future<void> onSendButton()async{
  if(nameController.text.isEmpty||emailController.text.isEmpty||phoneNumberController.text.isEmpty||descriptionController.text.isEmpty){
    showSnackBar("Please fill all the fields");
  }else{
    showLoader();
    try{
      var request = {
        "userId":"${storage.read("userId")}",
        "name":nameController.text.trim(),
        "email":emailController.text.trim(),
        "phoneNumber":phoneNumberController.text.trim(),
        "descripition":descriptionController.text.trim(),

      };
      final response = await CallAPI.supportRequest(request: request);
      if(response.status == 200){
        dismissLoader();
        Get.back();
        showSnackBar("Your problem will be resolved soon...");
      }else{
        dismissLoader();
        showSnackBar("Something went wrong");
      }

    }
    catch(e,st){
      dismissLoader();
      log(e.toString());
      log(st.toString());
        }
  }
}
}