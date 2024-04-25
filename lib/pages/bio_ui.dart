import 'package:flutter/material.dart';

import '../utils/exports.dart';

class BioUi extends StatelessWidget {
  const BioUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  myAppBar(
          title: Text('Bio',
            style: Theme.of(context).textTheme.headlineSmall,),
          context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
        
                Column(
                  children: [
                    Image.asset(ImagesPaths.profile,scale: 4,),
                    Transform.translate(
                        offset: Offset(0, -10),
                        child: Text("Uploading clear image increases the chances of getting bookings",style: Theme.of(context).textTheme.labelSmall,).paddingOnly(bottom: 15)),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("First Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
        
                          hintText: "Enter first name",
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),// Center the hintText
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Last Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
        
                          hintText: "Enter last name",
                          alignLabelWithHint: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),// Cen// Center the hintText
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Bio',
                          // style: Theme.of(context).textTheme.displayLarge,
                        ).paddingOnly(bottom: 12,),
                      ],
                    ).paddingOnly(top: 20),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.yellowishWhite,
                          borderRadius: BorderRadius.circular(7)),
                      child: TextField(
                        minLines: 1,
                        maxLines: 8,
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          fillColor: AppColors.yellowishWhite,
                          hintText: 'Tell us something about yourself ',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.yellowishWhite,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkButton(
                child: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.black),
                ),
                onTap: () {
        
                  Get.toNamed(AppRoutes.login);
                }).paddingOnly(top: 30)
          ],
        ).paddingOnly(left: 18,right: 18),
      ),

    );
  }
}
