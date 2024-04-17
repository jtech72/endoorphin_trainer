import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class CreateNewPasswordUI extends StatelessWidget {
  const CreateNewPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: Text('Create New Password',style: Theme.of(context).textTheme.bodyMedium,),
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
              Text('New Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),

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
                  style: Theme.of(context).textTheme.labelMedium,
                  cursorColor: AppColors.grey,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.yellowishWhite,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
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
              Text('Confirm Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),

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
                  style: Theme.of(context).textTheme.labelMedium,
                  cursorColor: AppColors.grey,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.yellowishWhite,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    contentPadding:
                    const EdgeInsets.only(bottom: 3, left: 25),

                    hintText: "Enter New password",
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
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                      onTap: (){
                        // Get.toNamed(AppRoutes.createNewPassword);
                      }))
            ],
          ).paddingOnly(left: Get.width*0.055,right: Get.width*0.055),
        ),
      ),
    );
  }
}
