import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';

class VerifyPhoneNumberUI extends StatelessWidget {
  const VerifyPhoneNumberUI({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.put(OtpController());
    return Scaffold(
      appBar: myAppBar(
        title: Text('Verify your Phone Number',style: Theme.of(context).textTheme.bodyMedium,),
        context: context,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.04,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.blackShade,
                  radius: 90,
                  child: Image.asset(ImagesPaths.phone,scale: 4,),
                ),
              ),
              SizedBox(
                height: Get.height*0.05,
              ),
              Center(child: Text(
                'Please Enter The 6 Digit Code Sent to\nyour phone number',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
              SizedBox(
                height: Get.height*0.07,
              ),

              SizedBox(
                height: Get.height * 0.01,
              ),
              PinCodeTextField(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 30),
                  animationCurve: Curves.easeInCubic,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveColor: AppColors.lightGrey,
                      selectedColor: AppColors.yellow,
                      activeColor: AppColors.yellow,
                      inactiveBorderWidth: 1,
                      selectedBorderWidth: 1,
                      activeBorderWidth: 1

                  ),
                  autoDisposeControllers: true,
                  enablePinAutofill: true,
                  appContext: context,
                  hintStyle: const TextStyle(color: AppColors.grey,fontSize: 22),
                  hintCharacter: '●',
                  blinkWhenObscuring: true,
                  cursorColor: AppColors.yellow,
                  keyboardType: TextInputType.number,
                  backgroundColor: AppColors.backgroundBlack,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 6),
              SizedBox(
                height: Get.height*0.2,
              ),
              Center(
                  child: InkButton(
                      child: Text('Verify',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                      onTap: (){
                        Get.toNamed(AppRoutes.createNewPassword);
                      }))
            ],
          ).paddingOnly(left: Get.width*0.055,right: Get.width*0.055),
        ),
      ),
    );
  }
}
