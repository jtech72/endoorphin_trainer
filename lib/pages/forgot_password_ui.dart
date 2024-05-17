import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/countrycode_controller.dart';
import '../utils/exports.dart';

class ForgotPasswordUI extends StatelessWidget {
  const ForgotPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {

    CountryCodeController controller = Get.put(CountryCodeController());

    return Scaffold(
      appBar: myAppBar(
        title: Text('Forgot Password',style: Theme.of(context).textTheme.bodyMedium,),
        context: context,),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.04,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.greyButton,
                  radius: 90,
                  child: Image.asset(ImagesPaths.lock,scale: 4,),
                ),
              ),
              SizedBox(
                height: Get.height*0.05,
              ),
              Center(child: Text(
                'Please Enter Your Email id to Receive\n a Password reset url.',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
              SizedBox(
                height: Get.height*0.07,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.yellowishWhite,
                    borderRadius: BorderRadius.circular(5)),

                height: 50,
                width: Get.width,
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: Get.width *.9,
                      child: TextField(


                          inputFormatters: [
                            LengthLimitingTextInputFormatter(64),
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          controller: controller.phoneNumber,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.black),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 2,bottom: 7),
                              counterText: "",
                              hintText: 'Enter your Email',
                              hintStyle:
                              Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lightGrey),
                              border: InputBorder.none,
                              fillColor: AppColors.yellowishWhite)).paddingOnly(left: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height*0.2,
              ),
              Center(
                  child: InkButton(
                      child: Text('Send',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                      onTap: () {
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
                                      child: Text('OK',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                                      onTap: (){
                                        Get.toNamed(AppRoutes.createNewPassword);
                                      },height: 35,width: Get.width*.35),
                                ),
                              ],shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),);
                          },
                        );
                      })
              ),
            ],
          ).paddingOnly(left: Get.width*0.035,right: Get.width*0.035),
        ),
      ),
    );
  }
}//
