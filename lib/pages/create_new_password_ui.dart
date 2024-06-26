import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/exports.dart';

class CreateNewPasswordUI extends StatelessWidget {
  const CreateNewPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPaths.bgBlackShade),
              fit: BoxFit.cover
          )
      ),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: myAppBar(
            title: GestureDetector(onTap: (){Get.back();},child: Text('Create New Password',style: Theme.of(context).textTheme.headlineSmall,)),
            context: context,),
          body: Container(
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height*0.04,
                  ),
                  Center(
                      child: CircleAvatar(
                        backgroundColor: AppColors.greyButton,
                        radius: 90,
                        child: Stack(
                          children: [
                            Image.asset(ImagesPaths.newLock,scale: 4,),
                            Positioned(
                                bottom: 12,
                                right: 10,
                                child: Image.asset(ImagesPaths.tick,scale: 4,)),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    height: Get.height*0.05,
                  ),
                  Center(child: Text(
                    'Your new Password Must be Different\nfrom Previously Used Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                  SizedBox(
                    height: Get.height*0.07,
                  ),
                  Text('New Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white,fontSize: 14),textAlign: TextAlign.start,),

                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightWhite),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(64),
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],

                      enableInteractiveSelection: true,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.black),
                      cursorColor: AppColors.grey,
                      cursorHeight: 18,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.yellowishWhite,
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lightGrey),
                        contentPadding:
                        const EdgeInsets.only(bottom: 3, left: 25),

                        hintText: "Enter New password",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text('Confirm Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white,fontSize: 14),textAlign: TextAlign.start,),

                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightWhite),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(64),
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],

                      enableInteractiveSelection: true,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.black),
                      cursorColor: AppColors.grey,
                      cursorHeight: 18,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.yellowishWhite,
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.lightGrey),
                        contentPadding:
                        const EdgeInsets.only(bottom: 3, left: 25),

                        hintText: "Enter Confirm password",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height*0.13,
                  ),
                  Center(
                      child: InkButton(
                          child: Text('Submit',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                                fontFamily: 'Montserrat'),),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(

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
                                      child: InkButton(
                                          child: Text('Continue to login',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,
                                              fontFamily: 'Montserrat',fontSize: 12),), onTap: (){
                                        Get.offAllNamed(AppRoutes.login);
                                      },height: 35,width: 150),
                                    ),
                                  ],shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),);
                              },
                            );
                          })
                  )
                ],
              ).paddingOnly(left: Get.width*0.055,right: Get.width*0.055),
            ),
          ),
        ),
      ),
    );
  }
}
