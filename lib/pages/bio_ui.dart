import 'package:endoorphin_trainer/controllers/bio_controller.dart';
import 'package:flutter/material.dart';

import '../utils/exports.dart';

class BioUi extends StatelessWidget {
  const BioUi({super.key});

  @override
  Widget build(BuildContext context) {
    BioController controller = Get.put(BioController());
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: myAppBar(title: GestureDetector(onTap: (){Get.back();},child: Text('Bio',style: Theme.of(context).textTheme.headlineSmall,)), context: context),
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
                  )
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: Get.height*0.02,),
                          Stack(
                            children: [
                              GestureDetector(
                              onTap: () {
            controller.openCamera();
            },
              child: Obx(
                    () => CircleAvatar(
                      backgroundColor: AppColors.blackShade,
                  radius: 60,
                  backgroundImage: controller.profileImage.value == null
                      ? AssetImage(ImagesPaths.profile) as ImageProvider<Object>?
                      : FileImage(controller.profileImage.value!) as ImageProvider<Object>?,
                ),
              )

                              ),

                              Positioned(
                                bottom: 0,
                                right: 10,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.find<BioController>().openCamera();
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.greyButton,
                                    child: Image.asset(ImagesPaths.plus,color: Colors.white,scale: 4,),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Text("Uploading clear image increases the chances of getting bookings",style: Theme.of(context).textTheme.labelSmall,).paddingOnly(bottom: 15),
                        ],
                      ).paddingOnly(bottom: Get.height*0.02),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Nick Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.nicknameController ,
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

                                hintText: "Enter Nick Name",
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
                              Text("Professional Title",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.professionalTitleController,
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

                                hintText: "Enter Professional Title",
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
                              Text("Years of Experience",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.experienceController,
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

                                hintText: "Enter Years of Experience",
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
                              Text("Areas of Expertise",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.expertiseController,
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

                                hintText: "Enter Areas of Expertise",
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
                              Text("Fun Fact/Personal Anecdote",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.funFactsController,
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

                                hintText: "Enter Fun Fact/Personal Anecdote",
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
                              Text("Motivational Quote",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.motivationalQuoteController,
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

                                hintText: "Enter Motivational Quote",
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
                              const Text(
                                'Mention Bio',
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
                              controller: controller.bioController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(400),
                              ],
                              keyboardType: TextInputType.text,
                              minLines: 1,
                              maxLines: 10,
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
                            .copyWith(color: AppColors.black,fontSize: 18,
                            fontFamily: 'Montserrat'),
                      ),
                      onTap: () {
                          controller.onSubmitButton(context);
                      }).paddingOnly(top: 30),
                  SizedBox(height: Get.height*0.05,)
                ],
              ).paddingOnly(left: 18,right: 18),
            ),
          ],
        ),

      ),
    );
  }
}
//