import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/exports.dart';

class BookingRequestUi extends StatelessWidget {
  const BookingRequestUi({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    BookingRequestController controller = Get.find();
    return Scaffold(
        body: Column(
          children: [
            Flexible(
              child: Obx(
                () => Stack(
                  children: [
                    SizedBox(
                      child: locationController.currentLocation.value == null
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.yellow,
                            ))
                          : GetBuilder<BookingRequestController>(
                              builder: (context) {
                              return GoogleMap(
                                mapType: MapType.normal,
                                zoomControlsEnabled: false,
                                scrollGesturesEnabled: true,
                                onMapCreated: (GoogleMapController
                                    onMapCreatedController) async {
                                  controller.mapController =
                                      onMapCreatedController;
                                  controller.setMapStyle();

                                  /// Origin marker
                                  await controller.addMarker(
                                      locationController.currentLocation.value!,
                                      "origin",
                                      "assets/images/ic_current_location.png");

                                  /// Destination marker
                                  await controller.addMarker(
                                      LatLng(controller.userLat!,
                                          controller.userLng!),
                                      "destination",
                                      controller.notificationData["categoryLogo"].toString(),isNetworkImage: true);

                                  /// Update the camera position to show both markers
                                  LatLngBounds bounds = LatLngBounds(
                                    southwest: LatLng(
                                      min(
                                          locationController
                                              .currentLocation.value!.latitude,
                                          controller.userLat!),
                                      min(
                                          locationController
                                              .currentLocation.value!.longitude,
                                          controller.userLng!),
                                    ),
                                    northeast: LatLng(
                                      max(
                                          locationController
                                              .currentLocation.value!.latitude,
                                          controller.userLat!),
                                      max(
                                          locationController
                                              .currentLocation.value!.longitude,
                                          controller.userLng!),
                                    ),
                                  );
                                  CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 120);
                                  onMapCreatedController.animateCamera(cameraUpdate);
                                },
                                initialCameraPosition: CameraPosition(
                                  target: locationController
                                              .currentLocation.value !=
                                          null
                                      ? locationController
                                          .currentLocation.value!
                                      : const LatLng(30.6665, 76.8260),
                                  zoom: 15.0,
                                ),
                                markers:
                                    Set<Marker>.of(controller.markers.values),
                                polylines: Set<Polyline>.of(
                                    controller.polyLines.values),
                              );
                            }),
                    ),
                            controller.selectedIndex.value == 2 ||
                            controller.selectedIndex.value == 1 ||
                            locationController.currentLocation.value == null||
                            controller.timerIsVisible.value == false
                           ?
                         const SizedBox.shrink()
                        : Positioned(
                            top: Get.height * .3,
                            left: Get.width * .27,
                            child: Obx(() => Container(
                                height: 100,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.yellow, width: 6),
                                    color: AppColors.white.withOpacity(0.8)),
                                child: Text(
                                  controller.time.value.toString(),
                                  style: const TextStyle(
                                      fontSize: 25, color: AppColors.black),
                                )))),
                    Positioned(
                        left: Get.width * 0.041,
                        top: Get.height * 0.061,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.white,
                            )))
                  ],
                ),
              ),
            ),
            SizedBox(
              height:controller.selectedIndex.value == 1?Get.height*.48: Get.height * .38,
              child: Obx(() => controller.selectedIndex.value == 2
                  ? SingleChildScrollView(
                      child: Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImagesPaths.bgBlackShade),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please Verify the pin to start the training",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ).paddingOnly(bottom: Get.height * 0.03),
                            PinCodeTextField(
                              onCompleted: (v){
                                controller.onPinVerify();
                              },
                                    controller: controller.pinController,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],

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
                                    hintStyle: const TextStyle(
                                        color: AppColors.grey, fontSize: 22),
                                    hintCharacter: '●',
                                    blinkWhenObscuring: true,
                                    cursorColor: AppColors.yellow,
                                    keyboardType: TextInputType.number,
                                    backgroundColor: Colors.transparent,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    length: 4)
                                .paddingOnly(bottom: Get.height * 0.01),
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
                                const Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: AppColors.impgrey,
                                ).paddingOnly(right: 20),
                                Text(
                                  "${controller.bookingDetails?.result?.userHouseNo ?? ""} ${controller.bookingDetails?.result?.userStreetArea ?? ""} ${controller.bookingDetails?.result?.userCity ?? ""} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ).paddingOnly(top: 20, bottom: 50, left: 25, right: 25),
                      ),
                    )
                  : controller.selectedIndex.value == 1
                      ? SingleChildScrollView(
                          child: Container(
                            // height: Get.height,
                            width: Get.width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesPaths.bgBlackShade),
                                    fit: BoxFit.cover)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
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
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                      controller.bookingDetails!
                                                          .result!.userProfile
                                                          .toString()), // Your profile image
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text: controller.bookingDetails
                                                      ?.result?.userName
                                                      .toString() ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            TextSpan(
                                              text: '\n3kms away | 12 min',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ])),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            ImagesPaths.star2,
                                            scale: 4,
                                          ).paddingOnly(right: 5),
                                          Text(
                                            '4.78',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ).paddingOnly(
                                      bottom: 15,
                                      left: Get.width * 0.04,
                                      right: Get.width * 0.04),
                                  Container(
                                    height: 1,
                                    width: Get.width,
                                    color: AppColors.grey3,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.openGoogleMaps(
                                              controller.bookingDetails!.result!
                                                  .trainerLat!,
                                              controller.bookingDetails!.result!
                                                  .trainerLong!,
                                              controller.bookingDetails!.result!
                                                  .userLat!,
                                              controller.bookingDetails!.result!
                                                  .userLong!);
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 125,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                                        fontWeight:
                                                            FontWeight.w500),
                                              )
                                            ],
                                          ).paddingOnly(left: 10),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _launchTelephone(controller
                                                  .bookingDetails
                                                  ?.result
                                                  ?.phoneNumber
                                                  .toString() ??
                                              "");
                                        },
                                        child: const CircleAvatar(
                                          radius: 20,
                                          backgroundColor: AppColors.black,
                                          backgroundImage: AssetImage(
                                            ImagesPaths.telephone,
                                          ), // Your profile image
                                        ),
                                      ).paddingOnly(right: 10),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                ChatBottomSheet(),
                                          );
                                        },
                                        child: const CircleAvatar(
                                          radius: 20,
                                          backgroundColor: AppColors.yellow,
                                          child: Icon(
                                            Icons.message_outlined,
                                            color: AppColors.black,
                                          ),
                                          // Your profile image
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(top: Get.height * 0.015),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                          offset: const Offset(0, 25),
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
                                            width: Get.width * 0.030,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: AppColors.white),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          Container(
                                            height: 3,
                                            width: 2,
                                            color: AppColors.white,
                                          ).paddingOnly(top: 3, bottom: 3),
                                          const Icon(
                                            Icons.circle,
                                            color: AppColors.yellow,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.024,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.bookingDetails?.result?.trainerHouseNo ?? ""} ${controller.bookingDetails?.result?.trainerStreetArea ?? ""} ${controller.bookingDetails?.result?.trainerCity ?? ""} ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                      color: AppColors.impgrey,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ).paddingOnly(bottom: 5),
                                            SizedBox(
                                                width: Get.width * .77,
                                                child: Text(
                                                  "1.2 Km",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium
                                                      ?.copyWith(
                                                        color:
                                                            AppColors.impgrey,
                                                      ),
                                                )).paddingOnly(bottom: 5),
                                            Container(
                                              width: Get.width * .80,
                                              height: 1,
                                              color: AppColors.grey,
                                            ).paddingOnly(top: 10, bottom: 15),
                                            Text(
                                              "${controller.bookingDetails?.result?.userHouseNo ?? ""} ${controller.bookingDetails?.result?.userStreetArea ?? ""} ${controller.bookingDetails?.result?.userCity ?? ""}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                      color: AppColors.impgrey,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ).paddingOnly(bottom: 5),
                                          ],
                                        ),
                                      )
                                    ],
                                  ).paddingOnly(
                                      top: Get.height * 0.035,
                                      bottom: Get.height * 0.035),
                                  Center(
                                      child: InkButton(
                                          child: Text(
                                            'Start',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                    color: AppColors.black,
                                                    fontSize: 18,
                                                    fontFamily: 'Montserrat'),
                                          ),
                                          onTap: () {
                                           controller.onStartButton();
                                          })),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  )
                                ]).paddingOnly(
                                top: 20, left: 20, right: 20, bottom: 20),
                          ),
                        )
                      :

              Obx(() {
                if (controller.isLoading.value) {
                  return Shimmer.fromColors(
                    baseColor: AppColors.white,
                    highlightColor: AppColors.black,
                    child:  Center(
                      child: Text(
                        'Booking Requested, waiting for confirmation Please wait...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ).paddingOnly(left: 10,right: 10),
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagesPaths.bgBlackShade),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                            backgroundImage:
                                            CachedNetworkImageProvider(
                                                controller.notificationData["userProfile"].toString())),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: controller
                                                  .notificationData["name"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            TextSpan(
                                              text: '\n3kms away | 12 min',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                  color: Colors.white),
                                            ),
                                          ])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImagesPaths.star2,
                                        scale: 4,
                                      ).paddingOnly(right: 5),
                                      Text(
                                        '4.78',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ).paddingOnly(top: 15, bottom: 15),
                              Text(
                                'Client address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall,
                              ),
                              Text(
                                controller.notificationData["address"]
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ).paddingOnly(
                              left: Get.width * 0.04,
                              right: Get.width * 0.04,
                              bottom: Get.height * 0.01),
                          Center(
                              child: InkButton(
                                  child: Text(
                                    'Accept',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  onTap: () {
                                    controller.onAcceptButton();
                                  })).paddingOnly(top: 30, bottom: 5),
                          Center(
                              child: InkButton(
                                  backGroundColor: AppColors.black,
                                  child: Text(
                                    'Reject',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        color: AppColors.yellow,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  onTap: () {
                                    // controller.showDialogBox(
                                    //     "Session request rejected",
                                    //     ImagesPaths.cooltick.toString(),
                                    //         () {
                                    //       Get.offAllNamed(
                                    //           AppRoutes.bottomNavigation);
                                    //     });
                                    controller.sendMessageIo();
                                  })).paddingOnly(top: 10, bottom: 15),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          //
                        ],
                      ).paddingOnly(left: 15, right: 15),
                    ),
                  ); // Replace with your normal widget when not loading
                }
              })
              ),
            )
          ],
        ));
  }
}
//

_launchTelephone(String number) async {
  final telephoneNumber = number;
  if (await canLaunch(telephoneNumber)) {
    await launch(telephoneNumber);
  } else {
    throw 'Could not launch $telephoneNumber';
  }
}

class ChatBottomSheet extends StatelessWidget {
  final BookingRequestController chatController =
      Get.put(BookingRequestController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: chatController.messages.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: AppColors.blackShade,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75),
                            child: Text(
                              textAlign: TextAlign.right,
                              chatController.messages[index],
                              style: const TextStyle(color: AppColors.white),
                            )),
                      );
                    },
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatController.messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          fillColor: AppColors.blackShade,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onSubmitted: (value) => chatController.sendMessage(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => chatController.sendMessage(),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                            color: AppColors.yellow, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.send_sharp,
                          color: AppColors.blackShade,
                        ),
                      ),
                    ).paddingOnly(left: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
