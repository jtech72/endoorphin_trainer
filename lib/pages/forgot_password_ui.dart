import 'package:country_code_picker/country_code_picker.dart';
import 'package:endoorphin_trainer/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/countrycode_controller.dart';
import '../utils/exports.dart';

class ForgotPasswordUI extends StatelessWidget {
  const ForgotPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
          )
      ),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: myAppBar(
            title: GestureDetector(onTap: (){Get.back();},child: Text('Forgot Password',style: Theme.of(context).textTheme.headlineSmall,)),
            context: context,),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.greyButton,
                      radius: 90,
                      child: Image.asset(ImagesPaths.lock,scale: 4,),
                    ).paddingOnly(top: Get.height*0.04),
                  ),
                  Center(
                      child:
                      Text(
                    'Please Enter Your Email id to Receive\n a Password reset url.',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,
                      ).paddingOnly(top: Get.height*0.05),
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.labelLarge,
                  ).paddingOnly(top: Get.height*0.07),
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
                              controller: controller.emailController,
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
                  ).paddingOnly(top: Get.height*0.01),
                  Center(
                      child: InkButton(
                          child: Text('Send',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                          onTap: () {
                              controller.onSubmitButton(context);

                          }).paddingOnly(top: Get.height*0.2),
                  ),
                ],
              ).paddingOnly(left: Get.width*0.035,right: Get.width*0.035),
            ),
          ),
        ),
      ),
    );
  }
}//
