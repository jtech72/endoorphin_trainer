import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class TrainerPassportUI extends StatelessWidget {
  const TrainerPassportUI({super.key});

  @override
  Widget build(BuildContext context) {
    TrainerPassportController controller = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppBar(
            title: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                controller.certificationDetails!["categoryName"] == "emirates"
                    ? "Emirates ID"
                    : controller.certificationDetails!["categoryName"] ==
                            "passport"
                        ? 'Passport'
                        : controller.certificationDetails!["name"].toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            context: context),
        body: SingleChildScrollView(
          child: Container(
            height:(MediaQuery.of(context).viewInsets.bottom == 0) ? Get.height*.7 : Get.height,

            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImagesPaths.bgBlackShade,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The following information will be collected as a part of the onboarding process, so please ensure that you provide correct details.',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ).paddingOnly(bottom: Get.height * 0.035),
                Container(
                  height: 1,
                  width: Get.width,
                  color: AppColors.grey3,
                ),
                Row(
                  children: [
                    Text(
                      controller.certificationDetails!["categoryName"] ==
                              "emirates"
                          ? "Name on the Emirates ID "
                          : controller.certificationDetails!["categoryName"] ==
                                  "passport"
                              ? 'Name on the Passport '
                              : "Name of the Certification ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ).paddingOnly(
                        bottom: Get.height * .008, top: Get.height * .04),
                    Text(
                      "* ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 14, color: Colors.red),
                    ).paddingOnly(top: Get.height * .03, bottom: 0),
                  ],
                ).paddingOnly(top: Get.height * 0.02),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightWhite),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: controller.certificateName,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      NoLeadingSpaceFormatter()
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
          
                      hintText: controller
                                  .certificationDetails!["categoryName"] ==
                              "emirates"
                          ? " Enter Name on the Emirates ID"
                          : controller.certificationDetails!["categoryName"] ==
                                  "passport"
                              ? 'Enter Name on the Passport'
                              : "Enter Certification Name",
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
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      controller.certificationDetails!["categoryName"] ==
                              "emirates"
                          ? "Emirates ID Number"
                          : controller.certificationDetails!["categoryName"] ==
                                  "passport"
                              ? 'Passport Number'
                              : "Certification Number",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ).paddingOnly(
                        bottom: Get.height * .008, top: Get.height * .02),
                    Text(
                      " *",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 14, color: Colors.red),
                    ).paddingOnly(top: 15, bottom: 8),
                  ],
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightWhite),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    onTap: (){
                      if(controller.certificationDetails!["categoryName"] == "emirates"){
                        if (!controller.certificateNumber.text.startsWith('784-')) {
                          controller.certificateNumber.text = '784-';
                        }
                      }
                      },
                    keyboardType: controller.certificationDetails!["categoryName"] == "emirates"
                        ? TextInputType.number
                        : controller.certificationDetails!["categoryName"] == "passport"
                        ? TextInputType.text
                        : TextInputType.text,
                    controller: controller.certificateNumber,
                    inputFormatters: [
                      if (controller.certificationDetails!["categoryName"] == "emirates") ...[
                    FilteringTextInputFormatter.digitsOnly,
                        CertificateNumberFormatter(15),NoLeadingSpaceFormatter(),
                      ] else if(controller.certificationDetails!["categoryName"]=="passport") ...[
                        NoLeadingSpaceFormatter(),LengthLimitingTextInputFormatter(9),
                        EmojiFilteringTextInputFormatter()
                      ]else ...[
                      FilteringTextInputFormatter.deny(RegExp(r'\s')), LengthLimitingTextInputFormatter(25),
                        EmojiFilteringTextInputFormatter()
                      ]
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
                      contentPadding: const EdgeInsets.only(bottom: 3, left: 15),
                      hintText: controller.certificationDetails!["categoryName"] == "emirates"
                          ? " Enter Emirates ID Number"
                          : controller.certificationDetails!["categoryName"] == "passport"
                          ? 'Enter Passport Number'
                          : "Enter Certification Number",
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
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      controller.certificationDetails!["categoryName"] ==
                              "emirates"
                          ? " Upload Emirates ID Photo"
                          : controller.certificationDetails!["categoryName"] ==
                                  "passport"
                              ? 'Upload Passport Photo'
                              : "Upload Certification Photo",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ).paddingOnly(
                        bottom: Get.height * .008, top: Get.height * .02),
                    Text(
                      "* ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 14, color: Colors.red),
                    ).paddingOnly(top: Get.height * .01, bottom: 0),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    controller.onFileUpload();
                  },
                  child: Container(
                    height: 45,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.yellowishWhite,
                      border: Border.all(color: AppColors.lightWhite),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagesPaths.upload,
                          scale: 5,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add a File',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ).paddingOnly(
                left: Get.width * 0.03,
                right: Get.width * 0.03,
                top: Get.height * .02),
          ),
        ),
      ),
    );
  }
}

