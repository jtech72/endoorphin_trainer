
import 'dart:developer';
import 'package:endoorphin_trainer/controllers/registration_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/exports.dart';
class RegistrationUi extends StatelessWidget {
  const  RegistrationUi({super.key});
  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.put(RegistrationController());

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
       appBar: AppBar(
         toolbarHeight: 50,
         leadingWidth: Get.width * 0.14,
         centerTitle: false,
         leading: GestureDetector(
             onTap: (){
               Get.offAllNamed(AppRoutes.signinoption);
             },
             child: const Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.white,size: 18,)),

         title: Row(
           children: [
             GestureDetector(
               onTap: () {
                 Get.toNamed(AppRoutes.signinoption);
               },
               child: Transform.translate(
                 offset: const Offset(-25,0),
                 child: Text(
                   "Welcome to ",
                   style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                 ),
               ),
             ),
             Transform.translate(
               offset: const Offset(-25,-2),
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
                  )
              ),
              child: ListView(
                children: [
                  SizedBox(height: Get.height*0.01,),
                  Text("Please enter your details to create an account.",style: Theme.of(context).textTheme.displayLarge,).paddingOnly(bottom: Get.height*0.01,),
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
                      Obx(
                        ()=> Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.impgrey),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            onChanged: (v) {
                              // Print the current value of isValidVisible
                              log("${controller.isValidVisible.value}");
                              // Update isValidVisible based on whether the input is non-empty
                              controller.isValidVisible.value = v.isNotEmpty;
                            },
                            controller: controller.passwordController,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(64),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            obscureText: controller.obscureText.value,
                            obscuringCharacter: '*',
                            enableInteractiveSelection: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            cursorColor: AppColors.grey,
                            cursorHeight: 18,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(highlightColor: Colors.transparent,
                                icon: Icon(
                                  controller.obscureText.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                onPressed: () {
                                  controller.toggleObscureText();
                                },),
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
                      ),
                      Obx(
                          ()=> Visibility(
                            visible: controller.isValidVisible.value,
                            child: Text("Your password must contain at least one uppercase letter, one number, and one special character",style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.red),).paddingOnly(top: 5)),
                      ),
                      Row(
                        children: [
                          Text("Confirm Password",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                          Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                        ],
                      ),
                      Obx(
                        ()=> Container(
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
                            obscureText: controller.obscureText1.value,
                            obscuringCharacter: '*',
                            enableInteractiveSelection: true,
                            style: Theme.of(context).textTheme.labelMedium,
                            cursorColor: AppColors.grey,
                            cursorHeight: 18,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(highlightColor: Colors.transparent,
                                icon: Icon(
                                  controller.obscureText1.value ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                onPressed: () {
                                  controller.toggleObscureText1();
                                },),
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
                      ),
                      Row(
                        children: [
                          Text("Gender",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
                          Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                        ],
                      ),
                      Obx(
                    () => PopupMenuButton<String>(
                  offset: const Offset(1, 45),
                  color: Colors.white,
                  onSelected: (selectedValue) {
                    controller.selectedOption1.value = selectedValue;
                    log(controller.selectedOption1.value);
                  },
                  itemBuilder: (BuildContext context) {
                    return controller.items2.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: AppColors.lightGrey),
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
                          offset: const Offset(5, 0),
                          child: Text(
                            controller.selectedOption1.value.isEmpty
                                ? "Select Gender" // Default text when nothing is selected
                                : controller.selectedOption1.value,
                            style: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 32, color: AppColors.grey4),
                      ],
                    ).paddingOnly(left: Get.width * 0.035, right: Get.width * 0.030),
                  ),
                ),
              ),
                      Row(
                        children: [
                          Text(
                            "Categories",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),
                          ).paddingOnly(top: 15, bottom: 8),
                          Text(
                            " *",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14, color: Colors.red),
                          ).paddingOnly(top: 15, bottom: 8),
                        ],
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.yellowishWhite,
                          border: Border.all(color: AppColors.impgrey),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FutureBuilder(
                          future: CallAPI.getCategory(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                            List<DropdownMenuItem<String>> dropdownItems = snapshot.data.result.map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem<String>(
                                value: item.id.toString(),
                                child: Text(item.name.toString(), style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w400, color: Colors.black)),
                              );
                            }).toList();

                            return Padding(
                              padding: EdgeInsets.zero,
                              child: DropdownButton<String>(
                                value: selectedItem,
                                hint: Text("Select a category"),
                                icon: Icon(Icons.arrow_drop_down),
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedItem = newValue;
                                  });
                                },
                                items: dropdownItems,
                              ).paddingOnly(left: 8, right: 8),
                            );
                          },
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 0,bottom: Get.height*0.01),
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

