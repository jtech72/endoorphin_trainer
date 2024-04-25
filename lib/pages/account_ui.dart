import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../controllers/account_controller.dart';

class AccountUI extends StatelessWidget {
  const AccountUI({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller =Get.find();
    return Scaffold(
      backgroundColor: AppColors.black,
     appBar: myAppBar(title:Text('Accounts',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightGrey1),), context: context, ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  // Profile Icon
                  GestureDetector(
                    onTap: (){
                      controller.openCamera();
                    },
                    child: const CircleAvatar(
                      radius: 42,
                      backgroundColor: AppColors.yellow,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(ImagesPaths.profilePic), // Your profile image
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
            Center(child: Text('John Doe',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.lightGrey1),)),
            SizedBox(
              height: Get.height*0.003,
            ),
            Center(child: Text('John.doe@gmail.com',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500,color: AppColors.lightGrey1))),
            SizedBox(
              height: Get.height*0.003,
            ),
            Center(child: Text('View Activity',style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.yellow))),
            SizedBox(
              height: Get.height*0.02,
            ),
            Text('First Name',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: AppColors.greyButton,
                  hintText: 'First Name',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
            Text('Last Name',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  filled: true,
                  fillColor: AppColors.greyButton,
                  hintText: 'Last Name',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
            Text('Email address',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),

                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  fillColor: AppColors.greyButton,
                  hintText: 'Enter Email',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
            Text('Password',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  fillColor: AppColors.greyButton,
                  hintText: 'Enter Password',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
                  // prefixIcon: const Icon(Icons.lock_outlined,color: AppColors.lightGrey1,).paddingOnly(left: 20,right: 20),
                ),
              ),
            ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Phone Number',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],maxLength: 10,
                keyboardType: TextInputType.phone,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  contentPadding: const EdgeInsets.only(top: 6,left: 20),

                  fillColor: AppColors.greyButton,
                  hintText: 'Enter Number',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
            Text('Gender',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Obx(() {
              return Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.greyButton,
                  border: Border.all(color: AppColors.greyButton),
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
                      icon: Icon(Icons.keyboard_arrow_down,size: 32,color: AppColors.impgrey,),


                      underline: const SizedBox(),
                      dropdownColor: AppColors.greyButton,
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
            SizedBox(
              height: Get.height*0.01,
            ),
            Text('Bio',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.lightGrey1),textAlign: TextAlign.start,),
            SizedBox(
              height: Get.height*0.011,
            ),
            Container(
              height: Get.height*0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.greyButton,
              ),

              child: TextField(
                inputFormatters: [
                  // LengthLimitingTextInputFormatter(64),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                maxLines:10 ,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),

                  fillColor: AppColors.greyButton,
                  hintText: 'Write about trainer',
                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey1),
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
                  child: Text('Update',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),),
                  onTap: (){}),
            ),
          ],
        ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05),
      ),
    );
  }
}
