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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 50,
          leadingWidth: Get.width * 0.17,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.black,
          automaticallyImplyLeading: false,
          elevation: 3,
          titleSpacing: 30,
          title: Text(
            "Bio",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
                    )
                ),
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
            controller.selectSource();
            },
              child: Obx(
                    () => CircleAvatar(
                      backgroundColor: AppColors.blackShade,
                  radius: 60,
                  backgroundImage: controller.profileImage.value == null
                      ? const AssetImage(ImagesPaths.profile) as ImageProvider<Object>?
                      : FileImage(controller.profileImage.value!) as ImageProvider<Object>?,
                ),
              )
                              ),

                              Positioned(
                                bottom: 5,
                                right: 15,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.find<BioController>().selectSource();
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.white,
                                    child: Image.asset(ImagesPaths.plus,color: Colors.black,scale: 4,),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: Get.height*0.02,),
                          Text("Uploading a clear image increases the chances of getting bookings.",style: Theme.of(context).textTheme.labelSmall,).paddingOnly(bottom: 15),
                        ],
                      ).paddingOnly(bottom: Get.height*0.02),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Nick Name",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.nicknameController ,
                              textCapitalization: TextCapitalization.none,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                NoLeadingSpaceFormatter(),
                                CapitalizeFirstLetterFormatter(),
                                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
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
                              Text("Years of Experience",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
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
                              controller: controller.experienceController,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                NoLeadingSpaceFormatter(),
                                LengthLimitingTextInputFormatter(2),
                                CapitalizeFirstLetterFormatter(),

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
                              Text("Areas of Expertise relevant for coaching",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
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
                              textCapitalization: TextCapitalization.none,
                              inputFormatters: [
                                NoLeadingSpaceFormatter(),
                                LengthLimitingTextInputFormatter(250),
                                CapitalizeFirstLetterFormatter(),
                                EmojiFilteringTextInputFormatter()

                              ],
                              controller: controller.expertiseController,
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

                                hintText: "Enter Your Expertise",
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
                              Text("Fun Fact/Professional Anecdote",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
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
                              textCapitalization: TextCapitalization.none,
                              controller: controller.funFactsController,
                              inputFormatters: [
                                NoLeadingSpaceFormatter(),
                                CapitalizeFirstLetterFormatter(),
                                EmojiFilteringTextInputFormatter()
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

                                hintText: "Enter Fun Fact/Professional Anecdote",
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
                              Text("Motivational Quote",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,fontWeight: FontWeight.w500),).paddingOnly(top: 15,bottom: 8),
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
                              textCapitalization: TextCapitalization.none,
                              controller: controller.motivationalQuoteController,
                              inputFormatters: [
                                NoLeadingSpaceFormatter(),
                                CapitalizeFirstLetterFormatter(),
                                EmojiFilteringTextInputFormatter()
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
                               Text(
                                'Mention Bio',
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w500,),
                              ).paddingOnly(top: 15,bottom: 8),
                              Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),
                            ],
                          ).paddingOnly(),
                          Container(
                            height: Get.height * 0.15,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColors.yellowishWhite,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              maxLength: 250,
                              textCapitalization: TextCapitalization.none,
                              controller: controller.bioController,
                              inputFormatters: [
                                NoLeadingSpaceFormatter(),
                                LengthLimitingTextInputFormatter(250),
                                CapitalizeFirstLetterFormatter(),
                                EmojiFilteringTextInputFormatter()// Add the custom formatter here
                              ],
                              buildCounter: (
                                  BuildContext context, {
                                    required int currentLength,
                                    required bool isFocused,
                                    required int? maxLength,
                                  }) {
                                return Text(
                                  '$currentLength/$maxLength',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12,color: AppColors.grey), // Adjust the font size here
                                );
                              },
                              keyboardType: TextInputType.text,
                              minLines: 4,
                              maxLines: 10,
                              style: Theme.of(context).textTheme.labelMedium,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 3, left: 15, right: 15,top: 10),
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
                          )

                        ],
                      ),
                    ],
                  ),
                  inkButton(
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

