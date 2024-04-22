
import 'package:endoorphin_trainer/controllers/registration_controller.dart';
import 'package:flutter/material.dart';

import '../utils/exports.dart';

class RegistrationUi extends StatelessWidget {
   const RegistrationUi({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,
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
                  offset: const Offset(0, -2),
                  child: Image.asset(ImagesPaths.logoimg,scale: 4.2,),
                ),

              ],
            ).paddingOnly(bottom: Get.height*0.01),
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
                      Text("Category",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                    ],
                  ),                  Obx(() {
                    return Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.yellowishWhite,
                        border: Border.all(color: AppColors.impgrey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedOption.value,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          DropdownButton<String>(
                            icon: const Icon(Icons.keyboard_arrow_down,size: 32,color: AppColors.black,),

                            underline: const SizedBox(),
                            dropdownColor: AppColors.yellowishWhite,
                            onChanged: (selectedValue) {
                              controller.selectedOption.value = selectedValue!;

                            },
                            items: controller.items.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ).paddingOnly(left: 15, right: 15),
                    );
                  }),
                  Row(
                    children: [
                      Text("Gender",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                    ],
                  ),                  Obx(() {
                    return Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.yellowishWhite,
                        border: Border.all(color: AppColors.impgrey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedOption1.value,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          DropdownButton<String>(
                             icon: Icon(Icons.keyboard_arrow_down,size: 32,color: AppColors.black,),


                            underline: const SizedBox(),
                            dropdownColor: AppColors.yellowishWhite,
                            onChanged: (selectedValue) {
                              controller.selectedOption1.value = selectedValue!;

                            },
                            items: controller.items2.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ).paddingOnly(left: 15, right: 15),
                    );
                  }),
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

void _showDropdown(BuildContext context) {
  RegistrationController controller =Get.find();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select an Option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: controller.dataList.map((String option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                // Update the selected option
                controller.selectedOption.value = option;
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
