import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class SupportUI extends StatelessWidget {
  const SupportUI({super.key});

  @override
  Widget build(BuildContext context) {
    SupportController controller =Get.put(SupportController());
    return Scaffold(
        appBar: myAppBar(
          title: Text(
            'Support',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white),
          ),
          context: context,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesPaths.bgBlackShade),
              fit: BoxFit.cover,
            ),),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Your Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                  ],
                ).paddingOnly(bottom: Get.height*0.01),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey3),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller:controller.nameController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      NoLeadingSpaceFormatter(),
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))                      ],
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 6, left: 20),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Enter Your Name',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.white),
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
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("E-mail",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                  ],
                ).paddingOnly(bottom: Get.height*0.01),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey3),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      NoLeadingSpaceFormatter(),
                      EmojiFilteringTextInputFormatter()
                    ],
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 6, left: 20),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Enter E-mail',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.white),
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
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Phone Number",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
                  ],
                ).paddingOnly(bottom: Get.height*0.01),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey3),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      NoLeadingSpaceFormatter(),
                    ],
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0, left: 20,bottom: 0),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Enter Phone Number',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.white),
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
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Problem Description',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.white),
                      textAlign: TextAlign.start,
                    ).paddingOnly(top: 15,bottom: 8),
                  ],
                ).paddingOnly(bottom: Get.height*0.01),
                Container(
                  height: Get.height * 0.16,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey3),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: controller.descriptionController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      NoLeadingSpaceFormatter(),
                      EmojiFilteringTextInputFormatter()
                    ],
                    maxLines: 10,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),

                      fillColor: Colors.transparent,

                      hintText: 'Tell us about your problem',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.white),
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
                ).paddingOnly(bottom: Get.height*0.13),
                InkButton(child: Text('Send',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Montserrat'),), onTap: (){
                  controller.onSendButton();
                },),
                SizedBox(height: Get.height*0.05,)

              ],
            ).paddingOnly(left: Get.width*0.05,right: Get.width*0.05),
          ),
        ));
  }
}
//
String formatTime(int seconds) {
  final minutes = seconds ~/ 60;
  final remainingSeconds = seconds % 60;
  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}