import 'dart:developer';
import 'package:endoorphin_trainer/controllers/booking_request_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../bindings/booking_request_binding.dart';
import '../utils/exports.dart';

class BookingRequsetUi extends StatelessWidget {
  const BookingRequsetUi({super.key});

  @override
  Widget build(BuildContext context) {
    BookingRequestController controller = Get.find();
    return Scaffold(
        bottomSheet: BottomSheet(
          shape: const ContinuousRectangleBorder(),
          enableDrag: true,
          backgroundColor: AppColors.black,
          onClosing: () {},
          builder: (BuildContext context) {
            return Obx(() => controller.selectedIndex.value == 2
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(ImagesPaths.hammer)
                            .paddingOnly(bottom: Get.height * 0.02),
                        Text(
                          "Type your “icebreaker” given by your\ncustomer to start your Fitness session!",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ).paddingOnly(bottom: Get.height * 0.03),
                        PinCodeTextField(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                animationCurve: Curves.easeInCubic,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    inactiveColor: AppColors.lightGrey,
                                    selectedColor: AppColors.yellow,
                                    activeColor: AppColors.yellow,
                                    inactiveBorderWidth: 1,
                                    selectedBorderWidth: 1,
                                    activeBorderWidth: 1),
                                autoDisposeControllers: true,
                                enablePinAutofill: true,
                                appContext: context,
                                hintStyle: TextStyle(
                                    color: AppColors.grey, fontSize: 22),
                                hintCharacter: '●',
                                blinkWhenObscuring: true,
                                cursorColor: AppColors.yellow,
                                keyboardType: TextInputType.number,
                                backgroundColor: AppColors.backgroundBlack,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                length: 4)
                            .paddingOnly(bottom: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width*.6,
                              child: SlideAction(
                                sliderButtonYOffset:-4,
                                innerColor: AppColors.black,
                                sliderButtonIcon: Image.asset(
                                  ImagesPaths.send2,
                                  scale: 5,
                                ),
                                outerColor: AppColors.yellow,
                                height: 35,
                                sliderButtonIconPadding: 8,
                                borderRadius: 36,
                                sliderRotate: false,

                                child: Text(
                                  "Swipe to Start Session",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.black,fontSize: 12),
                                ).paddingOnly(left: Get.width*.07),
                                onSubmit: (){
                                  Get.toNamed(AppRoutes.sessionRunning);
                                },

                              ).paddingOnly(right: 20),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                ImagesPaths.telephone,
                              ), // Your profile image
                            ),
                          ],
                        ).paddingOnly(bottom: Get.height * 0.02),
                        Text('Customer Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.yellow))
                            .paddingOnly(bottom: Get.height * 0.015),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 15,
                              color: AppColors.impgrey,
                            ).paddingOnly(right: 20),
                            Text(
                              '54, route Gue banquet',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ).paddingOnly(top: 20, bottom: 50, left: 25, right: 25),
                  )
                : controller.selectedIndex.value == 1
                    ? SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //   Text(
                              //     "Address Information",
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .labelLarge
                              //         ?.copyWith(fontWeight: FontWeight.w500),
                              //   ).paddingOnly(left: 25, right: 20, bottom: 20),
                              //   InkWell(
                              //     onTap: () {
                              //       controller.selectedIndex.value = 2;
                              //     },
                              //     child: Container(
                              //       height: 48,
                              //       width: Get.width,
                              //       decoration: const BoxDecoration(
                              //         color: AppColors.blackShade,
                              //         border: Border(
                              //           top: BorderSide(
                              //               width: 1.0, color: AppColors.yellow),
                              //           // Top white border
                              //           bottom: BorderSide(
                              //               width: 1.0,
                              //               color: AppColors
                              //                   .yellow), // Bottom white border
                              //         ),
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Text(
                              //             "Address Type",
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .labelLarge
                              //                 ?.copyWith(
                              //                 fontWeight: FontWeight.w500),
                              //           ),
                              //           Text(
                              //             "Home",
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .labelLarge
                              //                 ?.copyWith(
                              //                 fontWeight: FontWeight.w500),
                              //           )
                              //         ],
                              //       ).paddingOnly(left: 25, right: 20),
                              //     ),
                              //   ),
                              //   Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Anglesey Rd. Enfield EN3 4HY, UA ",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(fontWeight: FontWeight.w500),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         width: Get.width,
                              //         color: AppColors.grey,
                              //       ).paddingOnly(bottom: 20, top: 15),
                              //       Text(
                              //         "Zero High Inc.",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(fontWeight: FontWeight.w500),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         width: Get.width,
                              //         color: AppColors.grey,
                              //       ).paddingOnly(bottom: 20, top: 15),
                              //       Text(
                              //         "4",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(fontWeight: FontWeight.w500),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         width: Get.width,
                              //         color: AppColors.grey,
                              //       ).paddingOnly(bottom: 20, top: 15),
                              //       Text(
                              //         "Anglesey Road",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(fontWeight: FontWeight.w500),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         width: Get.width,
                              //         color: AppColors.grey,
                              //       ).paddingOnly(bottom: 20, top: 15),
                              //       Text(
                              //         "En3 4hy",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .labelLarge
                              //             ?.copyWith(fontWeight: FontWeight.w500),
                              //       ),
                              //       Container(
                              //         height: 1,
                              //         width: Get.width,
                              //         color: AppColors.grey,
                              //       ).paddingOnly(bottom: 20, top: 15),
                              //     ],
                              //   ).paddingOnly(top: 18, left: 25, right: 20)

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundColor: AppColors.yellow,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(ImagesPaths
                                              .profilePic), // Your profile image
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'John Doe',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        TextSpan(
                                          text: '\n3kms away | 12 min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ).paddingOnly(right: 5),
                                      Text(
                                        '4.78',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ).paddingOnly(
                                bottom: 15,
                              ),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: AppColors.grey3,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: AppColors.yellow,
                                        )),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          ImagesPaths.arrow_1,
                                          scale: 3.5,
                                        ).paddingOnly(right: 10),
                                        Text(
                                          "Share ETA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ).paddingOnly(left: 10),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.black,
                                    backgroundImage: AssetImage(
                                      ImagesPaths.telephone,
                                    ), // Your profile image
                                  ),
                                ],
                              ).paddingOnly(top: 20),
                              Transform.translate(
                                offset: const Offset(-12, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                        offset: Offset(0, 25),
                                        child: Text(
                                          '4\nmin',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.Black2),
                                          textAlign: TextAlign.center,
                                        )),
                                    Column(
                                      children: [
                                        Container(
                                          height: Get.height * 0.025,
                                          width: Get.width * 0.035,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.white),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Container(
                                          height: Get.height * 0.044,
                                          width: 1,
                                          color: AppColors.white,
                                        ).paddingOnly(top: 3, bottom: 3),
                                        const Icon(
                                          Icons.circle,
                                          color: AppColors.yellow,
                                          size: 22,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.014,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "54, route Gue banquet",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: AppColors.impgrey,
                                                  fontWeight: FontWeight.w600),
                                        ).paddingOnly(bottom: 5),
                                        SizedBox(
                                            width: Get.width * .77,
                                            child: Text(
                                              "1.2 Km",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: AppColors.impgrey,
                                                  ),
                                            )).paddingOnly(bottom: 5),
                                        Container(
                                          width: Get.width * .77,
                                          height: 1,
                                          color: AppColors.grey,
                                        ).paddingOnly(top: 10, bottom: 15),
                                        Text(
                                          "66, route Gue banquet",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  color: AppColors.impgrey,
                                                  fontWeight: FontWeight.w600),
                                        ).paddingOnly(bottom: 5),
                                      ],
                                    )
                                  ],
                                ).paddingOnly(
                                    top: Get.height * 0.035,
                                    bottom: Get.height * 0.035),
                              ),
                              Center(
                                  child: InkButton(
                                      child: Text(
                                        'Start',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(color: AppColors.black),
                                      ),
                                      onTap: () {
                                        controller.selectedIndex.value = 2;
                                      })),
                              SizedBox(
                                height: Get.height * 0.02,
                              )
                            ]).paddingOnly(
                            top: 20, left: 20, right: 20, bottom: 20),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: AppColors.yellow,
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(ImagesPaths
                                            .profilePic), // Your profile image
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: 'John Doe',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      TextSpan(
                                        text: '\n3kms away | 12 min',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ])),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ).paddingOnly(right: 5),
                                    Text(
                                      '4.78',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )
                                  ],
                                )
                              ],
                            ).paddingOnly(top: 15, bottom: 15),
                            Text(
                              'Client address',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              'Malviya Nagar, Near LB hospital, Jaipur, Rajthan',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Center(
                                child: InkButton(
                                    child: Text(
                                      'Accept',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(color: AppColors.black),
                                    ),
                                    onTap: () {
                                      controller.selectedIndex.value = 1;
                                    })).paddingOnly(top: 30, bottom: 30),
                            //
                          ],
                        ).paddingOnly(left: 15, right: 15),
                      ));
          },
        ),
        body:
            // Obx(() {
            //   return controller.currentLocation.value == null
            //       ? const Center(child: CircularProgressIndicator())
            //       .paddingOnly(bottom: 300)
            //       :
            SizedBox(
          height: Get.height * .8,
          child: GoogleMap(
            mapType: MapType.normal,

            onMapCreated: controller.onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
              zoom: 15.0,
            ),
            // markers: {
            //   Marker(
            //     markerId: const MarkerId('current_location'),
            //     position: controller.currentLocation.value!,
            //     infoWindow: const InfoWindow(title: 'Current Location'),
            //   ),
            // },
          ),
        ));
  }
}
//
