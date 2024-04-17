import 'package:endoorphin_trainer/controllers/trainer_passport_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

class TrainerPassportUI extends StatelessWidget {
  const TrainerPassportUI({super.key});

  @override
  Widget build(BuildContext context) {
    TrainerPassportController controller = Get.find();

    return Scaffold(
      appBar: myAppBar(
          title: Text(
            'Passport',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: Get.height * 0.02),
            Container(
              height: 1,
              width: Get.width,
              color: AppColors.grey3,
            ),
            Text(
              "Passport Name",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: Get.height * .008, top: Get.height * .04),
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightWhite),
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
                  contentPadding: const EdgeInsets.only(bottom: 3, left: 15),

                  hintText: "Enter Passport Name",
                  alignLabelWithHint: true, // Center the hintText
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              "Passport Number",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: Get.height * .008, top: Get.height * .02),
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightWhite),
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
                  contentPadding: const EdgeInsets.only(bottom: 3, left: 15),

                  hintText: "Enter Passport Number",
                  alignLabelWithHint: true, // Center the hintText
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              "Upload Passport Photo",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ).paddingOnly(bottom: Get.height * .008, top: Get.height * .02),
            GestureDetector(
              onTap: () {
                controller.openCamera();
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
            SizedBox(
              height: Get.height * .25,
            ),
            Center(
              child: SizedBox(
                height: 35,
                width: 201,
                child: InkButton(
                    child: Text(
                      'Submit for Review',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.black),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.selectcategory);
                    }),
              ),
            )
          ],
        ).paddingOnly(
            left: Get.width * 0.03,
            right: Get.width * 0.03,
            top: Get.height * .02),
      ),
    );
  }
}
//
