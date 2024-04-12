import 'package:endoorphin_trainer/utils/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/select_category_controller.dart';
import '../custom_Widgets/common_widgets.dart';
import '../utils/exports.dart';

class SelectCategoryUI extends StatelessWidget {
  const SelectCategoryUI({super.key});

  @override
  Widget build(BuildContext context) {
    SelectCategoryController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: Theme.of(context).textTheme.headlineLarge,
        ).paddingOnly(left: 15),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.",style: Theme.of(context).textTheme.displayLarge,)],
            ).paddingOnly(bottom: 15),
            ListView.builder(
                itemCount: controller.cancelReasons.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Obx(
                        () => Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            checkColor: Colors.black,
                            hoverColor: Colors.yellow,
                            value: controller.selectedReason.value ==
                                index, // Compare with index
                            onChanged: (value) {
                              controller.selectedReason.value = index;
                            },
                          ),
                        ),
                      ),
                      Text(
                        controller.cancelReasons[index],
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ).paddingOnly(left: 10),
                    ],
                  );
                }),
            SizedBox(
              height: Get.height * 0.014,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.029,
                ),
                Text(
                  'Upload Personal training certification',
                  style: Theme.of(context).textTheme.displayLarge,
                ).paddingOnly(bottom: 0,),
                SizedBox(
                  height: Get.height * 0.014,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white),
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
                      contentPadding:
                      const EdgeInsets.only(bottom: 3, left: 15,top: 10),

                      hintText: "Select document",
                      alignLabelWithHint: true, // Center the hintText
                      suffixIcon: Image.asset(ImagesPaths.upload,scale: 5,).paddingOnly(right: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.029,
                ),

                SizedBox(
                  height: Get.height * 0.10,
                ),
              ],
            ),

            SizedBox(
                height: 35,
                width: 195,
                child: InkButton(
                    child: Text(
                      'Continue',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.black),
                    ),
                    onTap: () {
                      print("object");
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       backgroundColor: AppColors.white,
                      //       title: Column(
                      //         children: [
                      //           SizedBox(
                      //             height: Get.height * 0.03,
                      //           ),
                      //           Image.asset(
                      //             ImagesPaths.cooltick,
                      //             scale: 4,
                      //           ),
                      //           SizedBox(
                      //             height: Get.height * 0.02,
                      //           ),
                      //           Text(
                      //             'Cancellation Successful',
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .headlineSmall!
                      //                 .copyWith(color: AppColors.black),
                      //           )
                      //         ],
                      //       ),
                      //       content: SizedBox(
                      //           width: Get
                      //               .width, // Set width as per your requirement
                      //           height: Get.height *
                      //               0.07, // Set height as per your requirement
                      //           child: Text(
                      //             'Lorem Ipsum is simply dummy text\nof the printing and typesetting industry.',
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .labelMedium!
                      //                 .copyWith(color: AppColors.black),
                      //             textAlign: TextAlign.center,
                      //           )),
                      //       actions: [
                      //         Center(
                      //           child: InkButton(
                      //               child: Text(
                      //                 'OK',
                      //                 style: Theme.of(context)
                      //                     .textTheme
                      //                     .headlineSmall!
                      //                     .copyWith(color: AppColors.black),
                      //               ),
                      //               onTap: () {
                      //                 // Get.offAllNamed(AppRoutes.bottomNavigation);
                      //               },
                      //               height: 35,
                      //               width: 95),
                      //         ),
                      //       ],
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //     );
                      //   },
                      // )
                      Get.toNamed(AppRoutes.bio);
                    })).paddingOnly(bottom: 30)
          ],
        ).paddingOnly(
            left: Get.width * 0.07,
            right: Get.width * 0.07,
            top: Get.height * 0.01),
      ),
    );
  }
}
