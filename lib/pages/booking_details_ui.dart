import 'package:endoorphin_trainer/controllers/booking_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/exports.dart';

class BookingDetailsUi extends StatelessWidget {
  const BookingDetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    BookingDetailsController controller = Get.put(BookingDetailsController());
    return Scaffold(
      appBar: myAppBar(
          title: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Text("Booking Details",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          context: context),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagesPaths.bgBlackShade)
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.greyButton,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      maxRadius: 35,
                      backgroundColor: AppColors.black,
                      backgroundImage: AssetImage(ImagesPaths.profilePic),
                    ).paddingOnly(left: Get.height * .02, right: Get.width * .08),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Max',
                            style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.yellow,
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
                            Image.asset(ImagesPaths.star2,scale: 3.8,color: AppColors.white,).paddingOnly(right: Get.width*0.01),
                            Text(
                              "4.86 (49)",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.impgrey),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ).paddingOnly(top: 10, bottom: 10),
              ).paddingOnly(top: 15, bottom: 0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: Get.height * 0.025,
                        width: Get.width * 0.035,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.yellow),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.105,
                        width: 1,
                        color: AppColors.yellow,
                      ).paddingOnly(top: 3, bottom: 3),
                      Image.asset(ImagesPaths.location,scale: 5,)
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.014,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aryarup Comples",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.impgrey,
                              fontWeight: FontWeight.w600),
                        ).paddingOnly(bottom: 5),
                        SizedBox(
                            width: Get.width * .77,
                            child: Text(
                              "221b Baker St, Marylebone, Dubai NW! 6xE, United Arabia - 25m",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            )).paddingOnly(bottom: 5),
                        Text(
                          "9:54 AM",
                          style:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.yellow,
                          ),
                        ).paddingOnly(bottom: 8),
                        Container(
                          width: Get.width * .83,
                          height: 1,
                          color: AppColors.grey,
                        ).paddingOnly(top: 6, bottom: 12),
                        Text(
                          "Aryarup Comples",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.impgrey,
                              fontWeight: FontWeight.w600),
                        ).paddingOnly(bottom: 5),
                        SizedBox(
                            width: Get.width * .77,
                            child: Text(
                              "221b Baker St, Marylebone, Dubai NW! 6xE, United Arabia - 25m",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            )).paddingOnly(bottom: 5),
                        Text(
                          "9:54 AM",
                          style:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).paddingOnly(top: Get.height * 0.035, bottom: Get.height * 0.055),
              Text(
                "Session Details",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.yellow),
              ).paddingOnly(bottom: Get.height*0.015, top: 0),
              controller.bookingType.value=="Upcomming"?
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackShade,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booked on:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .150),
                            ),
                            Text("26 March 2024 at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Duration:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .045),
                            ),
                            Text("60 Mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booking Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .10),
                            ),
                            Text("26 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Start time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .016),
                            ),
                            Text("26 March at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session End time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .035),
                            ),
                            Text("26 March",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .23),
                            ),
                            Text("Upcoming",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                      ],
                    ).paddingOnly(top: 10, bottom: 10),
                  ).paddingOnly(bottom:Get.height*0.02),
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           controller.secondButtonSelected.value = !controller.secondButtonSelected.value;
                  //             if (controller.secondButtonSelected.value) controller.firstButtonSelected.value = false;
                  //         },
                  //         child: Container(
                  //           height:  50,
                  //           width:  300,
                  //           decoration: BoxDecoration(
                  //             border: Border.all(color: AppColors.yellow),
                  //             borderRadius: BorderRadius.circular(50),
                  //             color:controller.secondButtonSelected.value ? AppColors.yellow : Colors.transparent,
                  //           ),
                  //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //           child: Text(
                  //             "Reject",textAlign: TextAlign.center,
                  //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18,
                  //                 fontFamily: 'Montserrat',color:controller.secondButtonSelected.value ? AppColors.black : AppColors.yellow),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(height: 20),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Get.toNamed(AppRoutes.bookingrequest);
                  //            controller.firstButtonSelected.value = !controller.firstButtonSelected.value;
                  //             if (controller.firstButtonSelected.value) controller.secondButtonSelected.value = false;
                  //         },
                  //         child: Container(
                  //           height:  50,
                  //           width:  300,
                  //           decoration: BoxDecoration(
                  //             border: Border.all(color: AppColors.yellow),
                  //             borderRadius: BorderRadius.circular(50),
                  //             color:controller.firstButtonSelected.value ? AppColors.yellow: Colors.transparent,
                  //           ),
                  //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //           child: Text(
                  //             "Accept",textAlign: TextAlign.center,
                  //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18,
                  //                 fontFamily: 'Montserrat',color: controller.firstButtonSelected.value ? AppColors.black : AppColors.yellow),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ).paddingOnly(top: 30),
                  // ),
                ],
              ):
              controller.bookingType.value=="Completed"?
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackShade,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booked on:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .150),
                            ),
                            Text("26 March 2024 at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Duration:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .045),
                            ),
                            Text("60 Mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booking Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .10),
                            ),
                            Text("26 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Start time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .016),
                            ),
                            Text("26 March at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session End time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .035),
                            ),
                            Text("26 March",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .23),
                            ),
                            Text("Completed",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,top: 5),
                      ],
                    ).paddingOnly(top: 10, bottom: 10),
                  ).paddingOnly(bottom:Get.height*0.02),
                  Container(
                    height: Get.height * 0.12,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: AppColors.blackShade,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text("How was your session with John ?",
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14))),
                        RatingBar.builder(
                          initialRating: -1,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 9.0),
                          itemBuilder: (context, _) => InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.review);
                              },
                              child: Image.asset(ImagesPaths.star,scale: 5,)),
                          onRatingUpdate: (rating) {
                            Get.toNamed(AppRoutes.review);
                          },
                        ).paddingOnly(top: Get.height * 0.02),
                      ],
                    ),
                  ),
                ],
              ):
              controller.bookingType.value=="Cancel"?
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackShade,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booked on:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .150),
                            ),
                            Text("26 March 2024 at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Duration:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .045),
                            ),
                            Text("60 Mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Booking Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .10),
                            ),
                            Text("26 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session Start time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .016),
                            ),
                            Text("26 March at 07:00:00",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Session End time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .035),
                            ),
                            Text("26 March",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,top: 5),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.Black3,
                        ).paddingOnly(left: 10, right: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*0.37,
                              child: Text("Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w500))
                                  .paddingOnly(right: Get.width * .23),
                            ),
                            Text("Cancel",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10, right: 10,top: 5),
                      ],
                    ).paddingOnly(top: 10, bottom: 10),
                  ).paddingOnly(bottom:Get.height*0.02),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkButton(child: Text("Cancelled", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),), onTap: (){}),
                  //   ],
                  // ),
                ],
              ):
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.sessionRunning);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blackShade,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Booked on:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .150),
                          ),
                          Text("26 March 2024 at 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,bottom: 5),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.Black3,
                      ).paddingOnly(left: 10, right: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Session Duration:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .045),
                          ),
                          Text("60 Mins",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.Black3,
                      ).paddingOnly(left: 10, right: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Booking Date:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .10),
                          ),
                          Text("26 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.Black3,
                      ).paddingOnly(left: 10, right: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Session Start time:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .016),
                          ),
                          Text("26 March at 07:00:00",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.Black3,
                      ).paddingOnly(left: 10, right: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Session End time:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .035),
                          ),
                          Text("26 March",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,top: 5),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.Black3,
                      ).paddingOnly(left: 10, right: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width*0.37,
                            child: Text("Status",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500))
                                .paddingOnly(right: Get.width * .23),
                          ),
                          Text("On going",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500)),
                        ],
                      ).paddingOnly(left: 10, right: 10,top: 5),
                    ],
                  ).paddingOnly(top: 10, bottom: 10),
                ).paddingOnly(bottom:Get.height*0.02),
              ),

            ],
          ).paddingOnly(left: Get.width*0.06, right: Get.width*0.06),
        ),
      ),
    );

  }
}
