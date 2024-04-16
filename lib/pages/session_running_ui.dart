import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/session_running_controller.dart';
import '../utils/exports.dart';

class SessionRunningUi extends StatelessWidget {
  const SessionRunningUi({super.key});
  @override
  Widget build(BuildContext context) {
    SessionRunningController controller = Get.find();
    return Scaffold(
        body: SlidingUpPanel(
     controller: controller.panelController,
      maxHeight: Get.height,
      color: Colors.transparent,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    Image.asset(
                      ImagesPaths.sessionType,
                      height: Get.height,
                      width: Get.width,
                    ).paddingOnly(bottom: 50),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.impgrey,
                              size: 18,
                            )),
                        Text(
                          "Boxing",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).paddingOnly(left: 20)
                      ],
                    ).paddingOnly(top: Get.height * .06, left: Get.width * .06),
                  ],
                ),
              ),
              Container(
                height: Get.height * .3,
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.6),
                  AppColors.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: GestureDetector(
                  onHorizontalDragStart: (v) {
                    log("$v");
                    // Get.toNamed(AppRoutes.sessionDetails);
                  },
                  child: Obx(
                    () => Column(
                      children: [
                        Text(
                          controller.time.value.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontSize: 55, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: Column(
                                children: [
                                  Text("Time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: AppColors.impgrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                  Text("60 Min",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: AppColors.impgrey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                ],
                              ).paddingOnly(top: 9),
                            ),
                            InkWell(
                                onTap: () {
                                  print(controller.isPaused.value
                                      .toString()); // Logging the current state of the timer
                                  if (controller.isPaused.value == true) {
                                    controller.resumeTimer();
                                  } else {
                                    controller.pauseTimer();
                                  }
                                },
                                child: Icon(
                                  controller.isPaused.value == true
                                      ? Icons.stop_circle_sharp
                                      : Icons.pause_circle,
                                  color: AppColors.yellow,
                                  size: 75,
                                )),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: Text("Boxing",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: AppColors.impgrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ).paddingOnly(left: 10, right: 10),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],),
      collapsed: Container(
        color: AppColors.black,
        height: Get.height * .11,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
                offset: const Offset(0, 21),
                child: const Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 30,
                )),
            const Icon(
              Icons.keyboard_arrow_up_outlined,
              size: 30,
            ).paddingOnly(bottom: 0),
            Text(
              "Swipe up for Details",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.lightGrey1),
            )
          ],
        ).paddingOnly(bottom: 20),
      ),
      panelBuilder: (c) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.greyButton.withOpacity(0.7),
            AppColors.greyButton,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: Get.height * .44,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        image: AssetImage(ImagesPaths.sessionType),
                      )),
                  child: InkWell(
                    onTap: (){
                      log("message");
                      controller.panelController.close();
            
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.impgrey),
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: AppColors.black,
                        )).paddingOnly(top: Get.height * .05, left: 10),
                  ),
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 43,
                      //
                      //
                      width: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.greyButton),
                      child: Text(
                        "00:28 | 01:00",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.yellow),
                      ),
                    ),
                  ),
                ),
                Text("Boxing", style: Theme.of(context).textTheme.headlineLarge),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.w300),
                ).paddingOnly(top: 10, bottom: Get.height * .03),
                Text(
                  "Trainer Details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.yellow),
                ).paddingOnly(bottom: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.black,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: AppColors.black,
                        backgroundImage: AssetImage(ImagesPaths.profilePic),
                      ).paddingOnly(
                          left: Get.height * .02, right: Get.width * .08),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Max',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.impgrey,
                                    fontSize: 16,
                                  ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\nmax123@gmail.com',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.impgrey),
                                ),
                                const TextSpan(
                                  text: '\n1234567895',
                                  style: TextStyle(
                                      color: AppColors.impgrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                      color: AppColors.impgrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.yellow,
                                size: 18,
                              ),
                              Text(
                                "4.86 (49)",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: AppColors.yellow),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 10, bottom: 10),
                ),
                Text(
                  "Session Details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.yellow),
                ).paddingOnly(bottom: 12, top: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.black,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Booked on:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                              .paddingOnly(right: Get.width * .146),
                          Text("26 March 2024 at 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 13, right: 10),
                      Row(
                        children: [
                          Text("Session Duration:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                              .paddingOnly(right: Get.width * .04),
                          Text("60 Mins",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 13, right: 10),
                      Row(
                        children: [
                          Text("Booking Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                              .paddingOnly(right: Get.width * .1),
                          Text("26 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 13, right: 10),
                      Row(
                        children: [
                          Text("Session Start time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                              .paddingOnly(right: Get.width * .02),
                          Text("26 March 2024 at 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 13, right: 10),
                      Row(
                        children: [
                          Text("Session End time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                              .paddingOnly(right: Get.width * .04),
                          Text("26 March",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 13, right: 10),
                    ],
                  ).paddingOnly(top: 10, bottom: 10),
                )
              ],
            ).paddingOnly(left: 18, right: 18),
          ),
        );
      },
    ));
  }
}