import 'package:flutter/material.dart';

import '../custom_Widgets/common_widgets.dart';
import '../utils/exports.dart';

class BioUi extends StatelessWidget {
  const BioUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(ImagesPaths.profile,scale: 4,),
              Row(
                children: [
                  Text(
                    'Bio',
                    style: Theme.of(context).textTheme.displayLarge,
                  ).paddingOnly(bottom: 12,),
                ],
              ),
              Container(
                height: Get.height * 0.15,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.yellowishWhite,
                    borderRadius: BorderRadius.circular(7)),
                child: TextField(
                  minLines: 1,
                  maxLines: 8,
                  style: const TextStyle(color: AppColors.impgrey, fontSize: 10),
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    fillColor: AppColors.yellowishWhite,
                    hintText: 'Enter Your Reason',
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
          InkButton(
              child: Text(
                'Submit',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.black),
              ),
              onTap: () {

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
                  },
                );
                Get.toNamed(AppRoutes.bio);
              }).paddingOnly(bottom: 30)
        ],
      ).paddingOnly(left: 18,right: 18),

    );
  }
}
