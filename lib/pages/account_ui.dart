import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import '../controllers/account_controller.dart';
import '../services/network_services/api_call.dart';
class AccountUI extends StatelessWidget {
  const AccountUI({super.key});
  @override
  Widget build(BuildContext context) {
    AccountController controller =Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(title:GestureDetector(onTap: (){Get.back();},child: Text('Accounts',style: Theme.of(context).textTheme.headlineSmall,)), context: context, ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future:
            CallAPI.getProfileDetails(storage.read("userId").toString()),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: Get.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ).paddingOnly(top: 0),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (!snapshot.hasData || snapshot.data!.result == null) {
                return const Center(
                  child: Text('No data available'),
                );
              }
              controller.firstNameController.text = snapshot.data!.result!.userName!.toString();
              controller.lastNameController.text = snapshot.data!.result!.lastName!.toString();
              controller.emailController.text = snapshot.data!.result!.email!.toString();
              controller.phoneNumberController.text = snapshot.data!.result!.phoneNumber!.toString();
              controller.bioController.text =snapshot.data!.result!.bio == null?"": snapshot.data!.result!.bio!.toString();
              controller.selectedOption1.value = snapshot.data!.result!.gender!.toString();
              return
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          // Profile Icon
                          Obx(
                                ()=> GestureDetector(
                              onTap: (){
                                controller.openCamera();
                              },
                              child:
                              CircleAvatar(
                                radius: 42,
                                backgroundColor: AppColors.yellow,
                                child:
                                controller.profileImage.value != null?
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                  FileImage(controller.profileImage.value!), // Your profile image
                                ):
                                snapshot.data!.result!.profileImg == null?
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                  AssetImage(ImagesPaths.profilePic), // Your profile image
                                ):
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                  NetworkImage(snapshot.data!.result!.profileImg.toString()), // Your profile image
                                )
                                ,
                              ),
                            ),
                          ),
                          // Camera Button
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Get.find<AccountController>().openCamera();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 27,
                                width: 27,
                                decoration: BoxDecoration(
                                  color: AppColors.yellow,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(
                                  Icons.photo_camera_outlined,
                                  color: AppColors.black,
                                  size: 17,
                                ),
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.007,
                    ),
                    Center(child: Text("${snapshot.data!.result!.userName} ${snapshot.data!.result!.lastName} ",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.white),)),
                    SizedBox(
                      height: Get.height*0.003,
                    ),
                    Center(child: Text("${snapshot.data!.result!.email} ",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500,color: AppColors.white))),
                    SizedBox(
                      height: Get.height*0.003,
                    ),
                    Center(child: Text('View Activity',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.yellow))),
                    SizedBox(
                      height: Get.height*0.02,
                    ),
                    Text('First Name',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: controller.firstNameController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6,left: 20),

                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'First Name',
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          disabledBorder: InputBorder.none,
                          // prefixIcon: Image.asset(
                          //   ImagesPaths.person,
                          //   color: AppColors.lightGrey1,
                          //   scale: 4,
                          //   alignment: Alignment.center,).paddingOnly(left: 10,right: 10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Text('Last Name',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: controller.lastNameController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 6,left: 20),

                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Last Name',
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          disabledBorder: InputBorder.none,
                          // prefixIcon: Image.asset(
                          //   ImagesPaths.person,
                          //   color: AppColors.lightGrey1,
                          //   scale: 4,
                          //   alignment: Alignment.center,).paddingOnly(left: 10,right: 10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Text('Email address',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),

                        decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.only(top: 6,left: 20),

                          fillColor: Colors.transparent,
                          hintText: 'Enter Email',
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          disabledBorder: InputBorder.none,
                          // prefixIcon: const Icon(Icons.mail_outline_outlined,color: AppColors.lightGrey1,).paddingOnly(left: 20,right: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Text('Phone Number',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: controller.phoneNumberController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],maxLength: 10,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          contentPadding: const EdgeInsets.only(top: 6,left: 20),

                          fillColor: Colors.transparent,
                          hintText: 'Enter Number',
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          disabledBorder: InputBorder.none,
                          // prefixIcon: const Icon(Icons.call_outlined,color: AppColors.lightGrey1).paddingOnly(left: 20,right: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Text('Gender',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Obx(
                          () => PopupMenuButton<String>(
                        offset: Offset(1, 45),
                        color: AppColors.greyButton,
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
                                style: TextStyle(color: AppColors.white),
                              ),
                            );
                          }).toList();
                        },
                        child: Container(
                          height: 45,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: AppColors.grey3),
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
                                      ? "Select Gender"
                                      : controller.selectedOption1.value,
                                  style: TextStyle(
                                    color: AppColors.white,
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
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Text('Description',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.white),textAlign: TextAlign.start,),
                    SizedBox(
                      height: Get.height*0.011,
                    ),
                    Container(
                      height: Get.height*0.16,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey3),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: controller.bioController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(64),
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        maxLines:10,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),

                          fillColor: Colors.transparent,
                          hintText: 'Write something about yourself',
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          disabledBorder: InputBorder.none,
                          // suffixIcon: const Icon(Icons.keyboard_arrow_down,color: AppColors.lightGrey1).paddingOnly(left: 20,right: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.04,
                    ),
                    Center(
                      child: InkButton(
                          child: Text('Update',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                              fontFamily: 'Montserrat'),),
                          onTap: (){
                            controller.onUpdateButton();
                          }),
                    ),
                    SizedBox(height: Get.height*0.05,)
                  ],
                ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05);

            },
          ),

        ),
      ),
    );
  }
}
