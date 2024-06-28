import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../services/network_services/api_call.dart';
class ForgotPasswordController extends GetxController{
  TextEditingController emailController = TextEditingController();
Future<void> onSubmitButton (BuildContext context)async{
  showLoader();
  if(emailController.text.isEmpty){
    dismissLoader();
    showSnackBar("Please enter your email");
  } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text.trim())) {
    dismissLoader();
    showSnackBar("Please enter valid email");
  }else{
    Map<String, dynamic> request = {
      "loginData": emailController.text.trim(),

    };

    try {var value = await CallAPI.forgetPassword(request: request);
      if (value.status == 200) {
      dismissLoader();
      otpVerified = OtpVerified.byMail;
      Get.toNamed(AppRoutes.otp,arguments:{
        "loginData": value.result!.phoneNumber.toString(),
        "otp": value.result!.otp.toString()
      });
      onVerified(context);
    } else {
      dismissLoader();
      showSnackBar(value.message ?? "Please enter valid credentials");
      printResult(screenName: "LOGIN CONTROLLER", msg: value.message ?? "");
    }
    } catch (e, st) {
      dismissLoader();
      showSnackBar("An error occurred during login");
      printResult(screenName: "LOGIN CONTROLLER", error: e.toString(), stackTrace: st);
    }
  }
}
onVerified(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        backgroundColor: AppColors.greyButton,
        title: Column(
          children: [
            SizedBox(height: Get.height*0.03,),
            Image.asset(ImagesPaths.cooltick,scale: 4,),
            SizedBox(
              height: Get.height*0.02,
            ),
            Text('Reset Password',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.yellow),)
          ],
        ),
        content: SizedBox(
            width: Get.width, // Set width as per your requirement
            height: Get.height*0.07, // Set height as per your requirement
            child: Text(
              'A Link has been sent to your email for\nresetting the password',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
              textAlign: TextAlign.center,
            )),
        actions: [
          Center(
            child: InkButton(
                child: Text('OK',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 14,
                  fontFamily: 'Montserrat',),),
                onTap: (){
                  Get.back();
                },height: 35,width: Get.width*.35),
          ),
        ],shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),);
    },
  );
}
}