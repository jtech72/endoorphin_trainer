import 'package:flutter/material.dart';
import '../utils/exports.dart';

class MoreAboutYouUi extends StatelessWidget {
  const MoreAboutYouUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 16),
        ).paddingOnly(left: 15),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: Theme.of(context).textTheme.displayLarge,
            ).paddingOnly(top: Get.height*.02),
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyButton,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1.",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ).paddingOnly(right: 10),
                      Expanded(
                        child: Text(
                          "Clear Images: Ensure documents are clear, not blurry.",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 10,right: 10,top: 10,bottom: 10),
                  Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,bottom: 15,left: 20,right: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2.",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ).paddingOnly(right: 10),
                      Expanded(
                        child: Text(
                          "Correct Naming: Upload each document with its respective name.",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 10,right: 10,top: 10,bottom: 10),
                  Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,bottom: 15,left: 20,right: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "3.",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ).paddingOnly(right: 10),
                      Expanded(
                        child: Text(
                          "Alignment: Properly align the camera for accurate capture.",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 10,right: 10,top: 10,bottom: 10),
                  Container(height: 1,width: Get.width,color: AppColors.grey,).paddingOnly(top: 15,bottom: 15,left: 20,right: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4.",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      ).paddingOnly(right: 10),
                      Expanded(
                        child: Text(
                          "Review & Submit: Double-check all documents before submitting.",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 10,right: 10,top: 10,bottom: 10),
                ],
              ).paddingOnly(top: 15,bottom: 15),
            ).paddingOnly(top: Get.height*.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkButton(
                    child: Text("Continue",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black),), onTap: (){Get.toNamed(AppRoutes.letverified);}),
              ],
            ).paddingOnly(top: Get.height*.09),          ],
        ),
      ),
    );
  }
}
