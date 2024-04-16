import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_Widgets/common_widgets.dart';
import '../utils/exports.dart';

class RegistrationUi extends StatelessWidget {
  const RegistrationUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("Welcome to ", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                Transform.translate(
                  offset: Offset(0, -2),
                  child: Image.asset(ImagesPaths.logoimg,scale: 4.2,),
                ),
        
              ],
            ),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("User Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
                        const EdgeInsets.only(bottom: 3, left: 15),
        
                        hintText: "Enter user name",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("Email",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
                        const EdgeInsets.only(bottom: 3, left: 15),
        
                        hintText: "Enter email address",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  Text("Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
                        const EdgeInsets.only(bottom: 3, left: 15),
        
                        hintText: "Enter password",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  Text("Confirm Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
                        const EdgeInsets.only(bottom: 3, left: 15),
        
                        hintText: "Enter Confirm password",
                        alignLabelWithHint: true, // Center the hintText
                      ),
                    ),
                  ),
                  Text("Image Upload",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.yellowishWhite,
                        border: Border.all(color: AppColors.impgrey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Image',style: Theme.of(context).textTheme.labelMedium,),
                          GestureDetector(
                              onTap: (){},
                              child: Image.asset(ImagesPaths.upload,scale: 5,))
                        ],
                      ).paddingOnly(left:15,right: 15 ),
                    ),
                  ),
                  Text("Gender",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.impgrey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
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
                        const EdgeInsets.only(bottom: 3, left: 15,top: 10),
        
                        hintText: "Select",
                        alignLabelWithHint: true, // Center the hintText
                        suffixIcon: Transform.translate(
                            offset: Offset(17,0),
                            child: Image.asset(ImagesPaths.dropdown,scale: 5,)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkButton(
                          child: Text("Continue",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black),), onTap: (){Get.toNamed(AppRoutes.moreaboutyou);}),
                    ],
                  ).paddingOnly(top: 30,bottom: 30),
                  
                ],
              ),
            ).paddingOnly(top: 15)
          ],
        ).paddingOnly(left: 18,right: 18),
      ),

    );
  }
}
