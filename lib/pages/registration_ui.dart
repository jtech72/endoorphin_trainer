
import 'dart:developer';

import 'package:endoorphin_trainer/controllers/registration_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:flutter/material.dart';

import '../utils/exports.dart';

class RegistrationUi extends StatelessWidget {

  const  RegistrationUi({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.put(RegistrationController());
    return Scaffold(
     appBar: AppBar(
       toolbarHeight: 50,
       leadingWidth: Get.width * 0.14,
       centerTitle: false,
       leading: GestureDetector(
           onTap: (){
             Get.offAllNamed(AppRoutes.signinoption);
           },
           child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.white,size: 18,)),

       title: Row(
         children: [
           GestureDetector(
             onTap: () {
               Get.toNamed(AppRoutes.signinoption);
             },
             child: Transform.translate(
               offset: Offset(-25,0),
               child: Text(
                 "Welcome to ",
                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
               ),
             ),
           ),
           Transform.translate(
             offset: Offset(-25,-2),
             child: Image.asset(
               ImagesPaths.logoimg,
               scale: 4.2,
             ),
           ),
         ],
       ),
     ),

      body:
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height*0.03,),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: Theme.of(context).textTheme.displayLarge,).paddingOnly(bottom: Get.height*0.025,),
                  Column(
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
                          controller: controller.firstNameController,
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

                            hintText: "Enter your First Name",
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
                          controller: controller.lastNameController,
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

                            hintText: "Enter your Last Name",
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
                          controller: controller.emailController,
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

                            hintText: "Enter your Email",
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
                          controller: controller.passwordController,
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

                            hintText: "Enter your Password",
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
                          controller: controller.confirmPasswordController,
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

                            hintText: "Enter your Confirm Password",
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
                  offset: Offset(1, 45),
                  color: Colors.white,
                  onSelected: (selectedValue) {
                    controller.selectedOption1.value = selectedValue;
                  },
                  itemBuilder: (BuildContext context) {
                    return controller.items2.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: AppColors.lightGrey),
                        ),
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
                          offset: Offset(5, 0),
                          child: Text(
                            controller.selectedOption1.value.isEmpty
                                ? "Select Gender" // Default text when nothing is selected
                                : controller.selectedOption1.value,
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 32, color: AppColors.grey4),
                      ],
                    ).paddingOnly(left: Get.width * 0.035, right: Get.width * 0.030),
                  ),
                ),
              ),
                      Row(
                        children: [
                          Text("Categories",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                          Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                        ],),
                     Container(padding: EdgeInsets.zero,
                          height: 263,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.yellowishWhite,
                            border: Border.all(color: AppColors.impgrey),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:                     FutureBuilder(
                            future: CallAPI.getCategory(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                ).paddingOnly(top: 20);
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              }
                              return
                                Padding(
                                padding: EdgeInsets.zero,
                                child: RawScrollbar(padding: EdgeInsets.zero,
                                  trackVisibility: true,
                                  trackRadius: Radius.circular(50),thickness: 5,
                                  interactive: true,
                                  thumbColor: AppColors.grey4,timeToFade: Duration(seconds: 2),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.result!.length,
                                    itemBuilder: (context, index) {
                                      final item = snapshot.data!.result![index].id;
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
                                                    controller.selectedOne2.add(item!);
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
                                                  title: Text(snapshot.data!.result![index].name.toString(),style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400,color: Colors.black),),
                                                  onTap: () {
                                                    controller.toggleItem(item, index); // Toggle item selection
                                                  },
                                                ),
                                              ),
                                            ]
                                        ).paddingZero,
                                      );
                                    },
                                  ),
                                ),
                              );

                            },
                          ),

                     ),
                    ],
                  ).paddingOnly(top: 15,bottom: Get.height*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkButton(
                          child: Text("Continue",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black,fontSize: 18,
                              fontFamily: 'Montserrat'),),
                          onTap: (){
                            controller.onContinueButton();
                          }),
                    ],
                  ).paddingOnly(top: 30,bottom: 30),
                ],
              ).paddingOnly(left: 18,right: 18),
            ),
          ),


    );
  }
}

