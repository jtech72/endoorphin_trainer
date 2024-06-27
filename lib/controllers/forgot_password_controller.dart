import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class ForgotPasswordController extends GetxController{
  TextEditingController emailController = TextEditingController();
Future<void> onSubmitButton (BuildContext context)async{
  if(emailController.text.isEmpty){
    showSnackBar("Please enter your email");
  } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text.trim())) {
    showSnackBar("Please enter valid email");
  }else{
    onVerified(context);
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
                  otpVerified = OtpVerified.byMail;
                  Get.toNamed(AppRoutes.otp);
                },height: 35,width: Get.width*.35),
          ),
        ],shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),);
    },
  );
}
}