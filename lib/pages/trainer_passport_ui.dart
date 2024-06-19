import 'package:endoorphin_trainer/controllers/trainer_passport_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

class TrainerPassportUI extends StatelessWidget {

    const TrainerPassportUI({super.key});

  @override
  Widget build(BuildContext context) {
    TrainerPassportController controller = Get.find();
    String? username;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppBar(
            title: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Text(
                controller.certificationDetails!["categoryName"] == "Emirates ID"? "Emirates ID":controller.certificationDetails!["categoryName"] == "Passport"?'Passport':"Certification",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            context: context),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            child:
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
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
                        controller.certificationDetails!["categoryName"] == "Emirates ID"? "Emirates ID Name":controller.certificationDetails!["categoryName"] == "Passport"?'Passport Name':"Certification Name",

                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ).paddingOnly(bottom: Get.height * .008, top: Get.height * .04),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: Get.height * .03,bottom: 0),

                    ],
                  ).paddingOnly(top:Get.height*0.02),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightWhite),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(

                      controller: controller.certificateName,
                      // inputFormatters: [
                      //   LengthLimitingTextInputFormatter(64),
                      //   FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      // ],
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

                        hintText: controller.certificationDetails!["categoryName"] == "Emirates ID"? " Enter Emirates ID name":controller.certificationDetails!["categoryName"] == "Passport"?'Enter Passport name':"Enter Certification Name",
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
                        ),/// Center the hintText
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        controller.certificationDetails!["categoryName"] == "Emirates ID"? "Emirates ID Number":controller.certificationDetails!["categoryName"] == "Passport"?'Passport Number':"Certification Number",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ).paddingOnly(bottom: Get.height * .008, top: Get.height * .02),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: 15,bottom: 8),

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
                      keyboardType: TextInputType.number,
                      controller: controller.certificateNumber,
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
                        contentPadding: const EdgeInsets.only(bottom: 3, left: 15),

                        hintText: controller.certificationDetails!["categoryName"] == "Emirates ID"? " Enter Emirates ID Number":controller.certificationDetails!["categoryName"] == "Passport"?'Enter Passport Number':"Enter Certification Number",
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
                        ),/// Center the hintText
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        controller.certificationDetails!["categoryName"] == "Emirates ID"? " Upload Emirates ID Photo":controller.certificationDetails!["categoryName"] == "Passport"?'Upload Passport Photo':"Upload Certification Photo",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ).paddingOnly(bottom: Get.height * .008, top: Get.height * .02),
                      Text(" *",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14,color: Colors.red),).paddingOnly(top: Get.height * .01,bottom: 0),

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
//
