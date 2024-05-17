
import 'dart:developer';

import 'package:endoorphin_trainer/controllers/registration_controller.dart';
import 'package:flutter/material.dart';

import '../utils/exports.dart';

class RegistrationUi extends StatelessWidget {

    RegistrationUi({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: Get.height*0.06,),
                Row(
                  children: [
                    Text("Welcome to ", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
                    Transform.translate(
                      offset: const Offset(0, -2),
                      child: Image.asset(ImagesPaths.logoimg,scale: 4.2,),
                    ),

                  ],
                ).paddingOnly(bottom: Get.height*0.03,left: Get.width*0.04,right: Get.width*0.04),
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                         Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: Theme.of(context).textTheme.displayLarge,).paddingOnly(bottom: Get.height*0.025),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  keyboardType: TextInputType.text,
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
                    
                                    hintText: "Enter First Name",
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
                                  keyboardType: TextInputType.text,
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
                    
                                    hintText: "Enter Last Name",
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
                                  keyboardType: TextInputType.emailAddress,
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
                    
                                    hintText: "Enter Email Address",
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
                                  Text("Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                  ],
                                  obscureText: true,
                                  obscuringCharacter: '*',
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
                    
                                    hintText: "Enter Password",
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
                                    ),// Cen/ Center the hintText
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Confirm Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                                  keyboardType: TextInputType.text,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(64),
                                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                  ],
                                  obscureText: true,
                                  obscuringCharacter: '*',
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
                    
                                    hintText: "Enter Confirm Password",
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
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Gender",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                                  Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                                ],
                              ),
                      Obx(
                            () => PopupMenuButton<String>(
                          offset: Offset(20, 45),color: Colors.white,
                          onSelected: (selectedValue) {
                            controller.selectedOption1.value = selectedValue;
                          },
                          itemBuilder: (BuildContext context) {
                            return controller.items2.map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(color: AppColors.lightGrey),),
                              );
                            }).toList();
                          },
                          child: Container(
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.impgrey),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Transform.translate(
                                  offset: Offset(5,0),
                                  child: Text(
                                    controller.selectedOption1.value,
                                    style: TextStyle(
                                      color: AppColors.lightGrey,
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down, size: 32, color: AppColors.grey4),
                              ],
                            ).paddingOnly(left: Get.width*0.035, right: Get.width*0.030),
                          ),
                        ),
                      ),
                              Row(
                                children: [
                                  Text("Categories",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                                  Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                                ],),
                              Container(
                                height: 263,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: AppColors.yellowishWhite,
                                  border: Border.all(color: AppColors.impgrey),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: controller.dataList.length,
                                    itemBuilder: (context, index) {
                                      final item = controller.dataList[index];
                                      return Obx(
                                            () => Row(
                                          children: [
                                            Checkbox(
                                              activeColor: AppColors.yellow,
                                              checkColor: AppColors.black,
                                              value: controller.checkedList.length > index ? controller.checkedList[index] : false, // Use checkedList to determine checkbox state
                                              onChanged: (value) {
                                                controller.toggleItem(item, index);
                                                // Check if the checkbox is checked
                                                if (value ?? false) {
                                                  // Add the item to selectedOne2 list
                                                  controller.selectedOne2.add(item);
                                                  log("Added value ==>${controller.selectedOne2.toString()}");
                                                } else {
                                                  // Remove the item from selectedOne2 list
                                                  controller.selectedOne2.remove(item);
                                                  log("Added value ==>${controller.selectedOne2.toString()}");
                                                }
                                              },
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                contentPadding: EdgeInsets.zero, // Remove ListTile padding
                                                title: Text(item),
                                                onTap: () {
                                                  controller.toggleItem(item, index); // Toggle item selection
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                    
                    
                    
                    
                    
                    
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkButton(
                                      child: Text("Continue",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black,),),
                                      onTap: (){Get.toNamed(AppRoutes.moreaboutyou ,arguments: controller.selectedOne2);}),
                                ],
                              ).paddingOnly(top: 30,bottom: 30),
                    
                            ],
                          ),
                        ).paddingOnly(top: 15),
                        SizedBox(height: Get.height*0.1,)
                      ],
                    ).paddingOnly(left: 18,right: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

