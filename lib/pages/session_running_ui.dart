import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/session_running_controller.dart';
import '../utils/exports.dart';
import 'bottom_navigation_bar_ui.dart';

class SessionRunningUi extends StatelessWidget {
  const SessionRunningUi({super.key});

  @override
  Widget build(BuildContext context) {
    SessionRunningController controller = Get.find();
    return Scaffold(
        body: FutureBuilder(
      future: CallAPI.getSessionDetails(
          id: controller.sessionIds!["id"].toString(),
          pinSession: controller.sessionIds!["pin"].toString()),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: Get.height,
            child: const Center(
                    child: CircularProgressIndicator(),
                    )
                .paddingOnly(top: 0),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData || snapshot.data!.result == null) {
          return const Center(
            child: Text('No data available'),
          );
        }

        return SlidingUpPanel(
          minHeight: 100,
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
                                  Get.offAllNamed(AppRoutes.bottomNavigation);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColors.impgrey,
                                  size: 18,
                                )),
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.bottomNavigation);
                              },
                              child: Text(
                                snapshot.data!.result!.categoryName.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ).paddingOnly(left: 20),
                            )
                          ],
                        ).paddingOnly(
                            top: Get.height * .06, left: Get.width * .06),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * .35,
                    width: Get.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.6),
                          AppColors.black,
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
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
                                      fontSize: 55,
                                      fontWeight: FontWeight.w700),
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
                                      Text("${snapshot.data!.result!.duration.toString()} min",
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
                                          : Icons.pause_circle_rounded,
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
                                  child: Text(snapshot.data!.result!.categoryName.toString(),
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
                  ).paddingOnly(bottom: 6)
                ],
              ),
            ],
          ),
          collapsed: Container(
            color: AppColors.black,
            height: Get.height * .15,
            width: Get.width,
            child: Column(
              children: [
                Transform.rotate(
                    angle: 11.0,
                    child: Image.asset(
                      "assets/images/giphy.gif",
                      scale: 16,
                    )).paddingOnly(bottom: 8),
                // Icon(
                //   Icons.keyboard_arrow_up_outlined,
                //   size: 30,
                // ),
                //  Icon(
                //   Icons.keyboard_arrow_up_outlined,
                //   size: 30,
                //              ),
                //  Icon(
                //   Icons.keyboard_arrow_up_outlined,
                //   size: 30,
                //              ),
                Text(
                  "Swipe up for Details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.white),
                )
              ],
            ).paddingOnly(bottom: 10),
          ),
          panelBuilder: (c) {
            return WillPopScope(
              onWillPop: () async {
                // Define the behavior here
                controller.panelController
                    .close(); // Assuming you want to close the panel
                return false; // Return false to prevent default back button behavior
              },
              child: Container(
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
                        // child:
                        // GestureDetector(
                        //   onTap: (){
                        //     log("message");
                        //     controller.panelController.close();
                        //
                        //   },
                        //   child: Container(
                        //       height: 30,
                        //       width: 30,
                        //       decoration: const BoxDecoration(
                        //           shape: BoxShape.circle, color: AppColors.impgrey),
                        //       child: const Icon(
                        //         Icons.arrow_back,
                        //         size: 25,
                        //         color: AppColors.black,
                        //       )).paddingOnly(top: Get.height * .05, left: 10),
                        // ),
                      ),
                      Center(
                        child: Transform.translate(
                          offset: const Offset(0, -20),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.yellow),
                            ),
                          ),
                        ),
                      ),
                      Text(snapshot.data!.result!.categoryName.toString(),
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(
                        "Experience the art of boxing firsthand. Train with expert coaches, sharpen your skills, and achieve your fitness goals in our dynamic boxing program.",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ).paddingOnly(top: 10, bottom: Get.height * .03),
                      Text(
                        "Customer Details",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.yellow),
                      ).paddingOnly(bottom: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.black,
                        ),
                        child: Row(
                          children: [
                             CircleAvatar(
                              maxRadius: 35,
                              backgroundColor: AppColors.black,
                              backgroundImage: CachedNetworkImageProvider(snapshot.data!.result!.customerProfileImg.toString()),
                            ).paddingOnly(
                                left: Get.height * .02, right: Get.width * .08),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: snapshot.data!.result!.customerName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.yellow,
                                          fontSize: 16,
                                        ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "\n${snapshot.data!.result!.customerEmail.toString()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.impgrey),
                                      ),
                                       TextSpan(
                                        text: "\n${snapshot.data!.result!.customerEmail.toString()}",
                                        style: TextStyle(
                                            color: AppColors.impgrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const TextSpan(
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
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                      size: 16,
                                    ),
                                    Text(
                                      " 4.86 (49)",
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
                          borderRadius: BorderRadius.circular(10),
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
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))
                                    .paddingOnly(right: Get.width * .146),
                                Text(snapshot.data!.result!.bookingDate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 13, right: 10),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.grey,
                            ).paddingOnly(left: 12, right: 5),
                            Row(
                              children: [
                                Text("Session Duration:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))
                                    .paddingOnly(right: Get.width * .04),
                                Text("${snapshot.data!.result!.duration.toString()} min",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 13, right: 10),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.grey,
                            ).paddingOnly(left: 12, right: 5),
                            Row(
                              children: [
                                Text("Booking Date:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))
                                    .paddingOnly(right: Get.width * .1),
                                Text(snapshot.data!.result!.bookingDate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 13, right: 10),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.grey,
                            ).paddingOnly(left: 12, right: 5),
                            Row(
                              children: [
                                Text("Session Start time:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))
                                    .paddingOnly(right: Get.width * .02),
                                Text(snapshot.data!.result!.startSession.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 13, right: 10),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.grey,
                            ).paddingOnly(left: 12, right: 5),
                            Row(
                              children: [
                                Text("Session End time:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500))
                                    .paddingOnly(right: Get.width * .04),
                                Text(snapshot.data!.result!.endSession.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 13, right: 10),
                          ],
                        ).paddingOnly(top: 10, bottom: 10),
                      )
                    ],
                  ).paddingOnly(left: 18, right: 18),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
