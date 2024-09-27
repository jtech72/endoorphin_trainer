import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class CreateNewPasswordController extends GetxController{
  RxBool isValidVisible = false.obs;
  bool isPasswordValid(String password) {
    // Define your password validation logic here
    RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegExp.hasMatch(password);
  }
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
String?phoneNumber;
RxBool obscureText = true.obs;
RxBool obscureText1 = true.obs;
void toggleObscureText() {
  obscureText.toggle(); // Toggle the RxBool value
}
void toggleObscureText1() {
  obscureText1.toggle(); // Toggle the RxBool value
}
Future<void> onSubmitButton(BuildContext context) async {
  String newPassword = newPasswordController.text;
  String confirmPassword = confirmPasswordController.text;


  if (newPassword.isEmpty) {
    showSnackBar("Please enter password");
    return;
  }if (newPassword.length < 8) {
    showSnackBar("Password must be at least 8 characters");
    return;
  }
  if (confirmPassword.isEmpty) {
    showSnackBar("Please enter confirm password");
    return;
  }
  if (newPassword != confirmPassword) {
    showSnackBar("Password and confirm password do not match");
    return;
  }
  showLoader();
  Map<String, dynamic> request = {
    "loginData": phoneNumber.toString(),
    "newPassword": newPassword.trim()
  };

  try {
    var value = await CallAPI.resetPassword(request: request);
    if (value.status == 200) {
      dismissLoader();
      onPasswordChanged(context);
    } else {
      dismissLoader();
      showSnackBar(value.message);
    }
  } catch (e, st) {
    log(e.toString());
    log(st.toString());
  }
}
onPasswordChanged(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          backgroundColor: AppColors.blackShade,
          title: Column(
            children: [
              SizedBox(height: Get.height*0.03,),
              Image.asset(ImagesPaths.cooltick,scale: 4,),
              SizedBox(
                height: Get.height*0.02,
              ),
              Text('Password Updated',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.yellow),)
            ],
          ),
          content: SizedBox(
              width: Get.width, // Set width as per your requirement
              height: Get.height*0.07, // Set height as per your requirement
              child: Text(
                'Your Password has been updated successfully.',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              )),
          actions: [
            Center(
              child: inkButton(
                  child: Text('Continue to login',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,
                      fontFamily: 'Montserrat',fontSize: 12),), onTap: (){
                Get.offAllNamed(AppRoutes.login);
              },height: 35,width: 150),
            ),
          ],shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),),
      );
    },
  );

}

@override
  void onInit() {
  phoneNumber = Get.arguments;
    super.onInit();
  }

}