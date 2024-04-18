import 'package:flutter/material.dart';

import '../controllers/select_category_controller.dart';
import '../utils/exports.dart';

class SelectCategoryUI extends StatelessWidget {
  const SelectCategoryUI({super.key});

  @override
  Widget build(BuildContext context) {
    SelectCategoryController controller = Get.find();
    return Scaffold(
     appBar: myAppBar(title: Text('Select Category',style: Theme.of(context).textTheme.headlineSmall,), context: context),
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
                    color: AppColors.yellowishWhite,
                    border: Border.all(color: AppColors.impgrey),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select',style: Theme.of(context).textTheme.labelMedium,),
                      Image.asset(ImagesPaths.upload,scale: 5,),

                    ],
                  ).paddingOnly(left:15,right: 15 ),
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          title: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Image.asset(
                                ImagesPaths.cooltick,
                                scale: 4,
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              // Text(
                              //   'Cancellation Successful',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .headlineSmall!
                              //       .copyWith(color: AppColors.black),
                              // )
                            ],
                          ),
                          content: SizedBox(
                              width: Get
                                  .width, // Set width as per your requirement
                              height: Get.height *
                                  0.07, // Set height as per your requirement
                              child: Text(
                                "Your onboarding process has been successfully completed. You’ll get notified for further action.",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: AppColors.black),
                                textAlign: TextAlign.center,
                              )),
                          actions: [
                            Center(
                              child: InkButton(
                                  child: Text(
                                    'OK',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: AppColors.black),
                                  ),
                                  onTap: () {
                                    Get.offAllNamed(AppRoutes.login);
                                  },
                                  height: 35,
                                  width: 95),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        );
                      });
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
