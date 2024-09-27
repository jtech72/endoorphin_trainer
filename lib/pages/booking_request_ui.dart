import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import '../utils/exports.dart';
class BookingRequestUi extends StatelessWidget {
  const BookingRequestUi({super.key});
  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    BookingRequestController controller = Get.put(BookingRequestController());
    return WillPopScope(
      onWillPop: () async {
      Get.back();
        return false;
      },
      child: Scaffold(
            body: Obx(
              ()=> SizedBox(
                height: Get.height * 0.9999,
                child: controller.isLocationOn.value
                    ? const SpinKitThreeBounce(color: AppColors.yellow,size: 30)
                    : Column(
                  children: [
                    Flexible(
                      child: Obx(
                            () => Stack(
                          alignment: Alignment.center,
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
                                      mapToolbarEnabled: false,
                                      myLocationButtonEnabled: false,
                                      myLocationEnabled: false,
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
                                            controller.notificationData["categoryLogo"].toString(),
                                            isNetworkImage: true);

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
                                        CameraUpdate cameraUpdate =
                                        CameraUpdate.newLatLngBounds(bounds, 150);
                                        onMapCreatedController
                                            .animateCamera(cameraUpdate);
                                      },
                                      initialCameraPosition: CameraPosition(
                                        target: locationController
                                            .currentLocation.value !=
                                            null
                                            ? locationController.currentLocation.value!
                                            : const LatLng(30.6665, 76.8260),
                                        zoom: 15.0,
                                      ),
                                      markers:
                                      Set<Marker>.of(controller.markers.values),
                                      polylines:
                                      Set<Polyline>.of(controller.polyLines.values),
                                    );
                                  }),
                            ),
                            controller.selectedIndex.value == 2 ||
                                controller.selectedIndex.value == 1 ||
                                locationController.currentLocation.value == null ||
                                controller.timerIsVisible.value == false
                                ? const SizedBox.shrink()
                                : SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  Container(
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
                                      )),
                                  Container(
                                    height: 35,
                                    width: 251,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.blackShade),
                                    child: Center(
                                      child: Text(
                                        'Time Remaining to Accept this Booking',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ).paddingOnly(top: 10)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                          () => SizedBox(
                          height: controller.selectedIndex.value == 1
                              ? Get.height * .52
                              : controller.selectedIndex.value == 2
                              ? Get.height * .35
                              : Get.height * .38,
                          child: controller.selectedIndex.value == 2
                              ? SingleChildScrollView(
                            child:
                            FutureBuilder(
                              future: CallAPI.getTrainerOngoingDetails(
                                  trainerId:
                                  controller.notificationData["trainerId"],
                                  userId: controller.notificationData["userId"],
                                  bookingId:
                                  controller.notificationData["bookingId"]),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height*.4,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ).paddingOnly(top: 0),
                                  );
                                } else if (snapshot.hasData) {
                                  controller.userLat = snapshot.data!.result!.userLat!;
                                  controller.userLng = snapshot.data!.result!.userLong!;
                                  controller.notificationData["categoryLogo"] = snapshot.data!.result!.categoryLogo.toString();
                                  controller.findDistanceAndTime(locationController.currentLocation.value!, LatLng(controller.userLat!,controller. userLng!));
                                  return Container(
                                    width: Get.width,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ImagesPaths.bgBlackShade),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Please Verify the pin to start the training",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                              fontWeight: FontWeight.w400),
                                        ).paddingOnly(bottom: Get.height * 0.03),
                                        PinCodeTextField(
                                            onCompleted: (v) {
                                              controller.onPinVerify(snapshot.data!.result!.bookingId.toString());
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
                                                shape:
                                                PinCodeFieldShape.underline,
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                fieldHeight: 50,
                                                fieldWidth: 40,
                                                inactiveColor:
                                                AppColors.lightGrey,
                                                selectedColor: AppColors.yellow,
                                                activeColor: AppColors.yellow,
                                                inactiveBorderWidth: 1,
                                                selectedBorderWidth: 1,
                                                activeBorderWidth: 1),
                                            autoDisposeControllers: true,
                                            enablePinAutofill: true,
                                            appContext: context,
                                            hintStyle: const TextStyle(
                                                color: AppColors.grey,
                                                fontSize: 22),
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
                                            .paddingOnly(
                                            bottom: Get.height * 0.015),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              size: 15,
                                              color: AppColors.impgrey,
                                            ).paddingOnly(right: 20),
                                            SizedBox(
                                              width: Get.width * .75,
                                              child: Text(
                                                snapshot.data!.result!.userAddressType.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ).paddingOnly(
                                        top: 40, bottom: 50, left: 25, right: 25),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (!snapshot.hasData) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: Text(
                                        'No data available',
                                        style: TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          )
                              : controller.selectedIndex.value == 1
                              ? SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child:
                            FutureBuilder(
                              future: CallAPI.getTrainerOngoingDetails(
                                  trainerId: controller.notificationData["trainerId"],
                                  userId: controller.notificationData["userId"],
                                  bookingId: controller.notificationData["bookingId"]),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return SizedBox(height: Get.height*.5,);
                                } else if (snapshot.hasData) {
                                  controller.userLat = snapshot.data!.result!.userLat!;
                                  controller.userLng = snapshot.data!.result!.userLong!;
                                  controller.notificationData["categoryLogo"] = snapshot.data!.result!.categoryLogo.toString();
                                  controller.findDistanceAndTime(locationController.currentLocation.value!, LatLng(controller.userLat!,controller. userLng!));
                                  return
                                    GetBuilder<BookingRequestController>(
                                        builder: (contexts) {
                                          return Container(
                                            // height: Get.height,
                                            width: Get.width,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                    AssetImage(ImagesPaths.bgBlackShade),
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
                                                          CachedNetworkImage(
                                                            imageUrl: snapshot.data!.result!.userProfile.toString(),
                                                            imageBuilder:
                                                                (context, imageProvider) =>
                                                                CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor:
                                                                  AppColors.yellow,
                                                                  child: CircleAvatar(
                                                                    radius: 30,
                                                                    backgroundColor:
                                                                    Colors.transparent,
                                                                    backgroundImage:
                                                                    imageProvider,
                                                                  ),
                                                                ),
                                                            placeholder: (context, url) =>
                                                            const CircleAvatar(
                                                              radius: 32,
                                                              backgroundColor:
                                                              Colors.transparent,
                                                            ),
                                                            errorWidget:
                                                                (context, url, error) =>
                                                            const CircleAvatar(
                                                              radius: 32,
                                                              child: CircleAvatar(
                                                                radius: 30,
                                                                backgroundColor:
                                                                Colors.transparent,
                                                                backgroundImage: AssetImage(
                                                                    "assets/images/img_profile.png"),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          RichText(
                                                              text: TextSpan(children: [
                                                                TextSpan(
                                                                  text: snapshot.data!.result!.userName.toString(),
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .headlineSmall,
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                  " ${snapshot.data!.result!.lastName.toString()}" ??
                                                                      "",
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .headlineSmall,
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                  '\n${controller.totalDistance} away | ${controller.totalTIme}',
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
                                                          SizedBox(
                                                            width: Get.width * 0.09,
                                                            child: Text(
                                                              overflow: TextOverflow.ellipsis,
                                                              snapshot.data!.result!.averageReview ==
                                                                  null
                                                                  ? "0"
                                                                  :snapshot.data?.result?.averageReview.toString()  ??
                                                                  "0",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .copyWith(
                                                                  color: Colors.white),
                                                            ),
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
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.openGoogleMaps(
                                                              snapshot.data!.result!.trainerLat!,
                                                              snapshot.data!.result!.trainerLat!,
                                                              snapshot.data!.result!.userLat!,
                                                              snapshot.data!.result!.userLong!);
                                                        },
                                                        child: Container(
                                                          height: 35,
                                                          width: 125,
                                                          decoration: BoxDecoration(
                                                              color: AppColors.Black3,
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

                                                          _launchTelephone(snapshot.data?.result?.phoneNumber ??
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
                                                    ],
                                                  ).paddingOnly(top: Get.height * 0.015),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Transform.translate(
                                                          offset: const Offset(0, 26),
                                                          child: SizedBox(
                                                            width: 25,
                                                            child: Text(
                                                              controller.totalTIme.value
                                                                  .toString(),
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  color:
                                                                  AppColors.Black2),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          )),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: Get.height * 0.028,
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
                                                          Container(
                                                            height: 3,
                                                            width: 2,
                                                            color: AppColors.white,
                                                          ).paddingOnly(top: 3, bottom: 4),

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
                                                              maxLines: 2,
                                                              "${snapshot.data?.result?.trainerddressType ?? ""} ",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.copyWith(
                                                                  color:
                                                                  AppColors.impgrey,
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  fontSize: 12),
                                                            ).paddingOnly(bottom: 5),
                                                            SizedBox(
                                                                width: Get.width * .77,
                                                                child: Text(
                                                                  "${controller.totalDistance}",
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .labelMedium
                                                                      ?.copyWith(
                                                                    color:
                                                                    AppColors.grey6,
                                                                  ),
                                                                )).paddingOnly(bottom: 5),
                                                            Container(
                                                              width: Get.width * .80,
                                                              height: 1,
                                                              color: AppColors.grey,
                                                            ).paddingOnly(
                                                                top: 10, bottom: 15),
                                                            Text(
                                                              maxLines: 2,
                                                              snapshot.data?.result?.userAddressType ??
                                                                  "",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.copyWith(
                                                                  color:
                                                                  AppColors.impgrey,
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  fontSize: 12),
                                                            ).paddingOnly(bottom: 5),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ).paddingOnly(
                                                      top: Get.height * 0.025,
                                                      bottom: Get.height * 0.035),
                                                  Center(
                                                      child: inkButton(
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
                                                            controller.onStartButton(snapshot.data!.result!.bookingId.toString());
                                                          })),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  )
                                                ]).paddingOnly(
                                                top: 20, left: 20, right: 20, bottom: 20),
                                          );
                                        }
                                    );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (!snapshot.hasData) {
                                  return SizedBox(
                                    height: Get.height * .7,
                                    child: const Center(
                                      child: Text(
                                        'No data available',
                                        style: TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          )
                              : Obx(() {
                            if (controller.isLoading.value) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomProgressIndicator(),
                                  Text(
                                    controller.time.value,
                                    style: const TextStyle(
                                        color: AppColors.yellow,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ).paddingOnly(top: 15, bottom: 15),
                                  const SizedBox(
                                    width: 320,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "While the client pays for the session, you will have to wait for three minutes.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              dev.log(
                                  "PROFILE IMAGE ${controller.notificationData['userProfile']}");
                              return Container(
                                width: Get.width,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ImagesPaths.bgBlackShade),
                                        fit: BoxFit.cover)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  controller.notificationData[
                                                  "userProfile"] ==
                                                      null
                                                      ? const CircleAvatar(
                                                    radius: 32,
                                                    backgroundColor:
                                                    AppColors.yellow,
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage:
                                                      AssetImage(
                                                          "assets/images/img_profile.png"),
                                                    ),
                                                  )
                                                      : CachedNetworkImage(
                                                    imageUrl: controller
                                                        .notificationData[
                                                    "userProfile"]
                                                        .toString()
                                                        .trim(),
                                                    imageBuilder: (context,
                                                        imageProvider) =>
                                                        CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                          AppColors
                                                              .yellow,
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundImage:
                                                            imageProvider,
                                                          ),
                                                        ),
                                                    placeholder:
                                                        (context, url) =>
                                                        const CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                          AppColors
                                                              .yellow,

                                                        ),
                                                    errorWidget: (context,
                                                        url, error) =>
                                                        const CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                          AppColors
                                                              .yellow,
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                            Colors.black,
                                                            backgroundImage:
                                                            AssetImage(
                                                                "assets/images/img_profile.png"),
                                                          ),
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text: controller
                                                              .notificationData[
                                                          "userName"],
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headlineSmall,
                                                        ),
                                                        TextSpan(
                                                          text:
                                                          " ${controller.notificationData["lastName"]}",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headlineSmall,
                                                        ),
                                                        TextSpan(
                                                          text:
                                                          '\n${controller.totalDistance} away | ${controller.totalTIme}',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelMedium!
                                                              .copyWith(
                                                              color:
                                                              Colors.white),
                                                        ),
                                                      ])),
                                                ],
                                              ),
                                            ],
                                          ).paddingOnly(top: 15, bottom: 15),
                                          Text(
                                            'Client address',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          Text(
                                            controller
                                                .notificationData["address"]
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
                                      ),
                                      Center(
                                          child: inkButton(
                                              child: Text(
                                                'Accept',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                    color: AppColors.black,
                                                    fontSize: 18,
                                                    fontFamily:
                                                    'Montserrat'),
                                              ),
                                              onTap: () {
                                                controller.onAcceptButton();
                                              })).paddingOnly(
                                          top: 30, bottom: 5),
                                      Center(
                                          child: inkButton(
                                              backGroundColor: AppColors.black,
                                              child: Text(
                                                'Reject',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(
                                                    color: AppColors.yellow,
                                                    fontSize: 18,
                                                    fontFamily:
                                                    'Montserrat'),
                                              ),
                                              onTap: () {
                                                controller.showDialogBox(
                                                    "Session request rejected",
                                                    ImagesPaths.cooltick
                                                        .toString(), () {
                                                  controller.onRejectButton();
                                                });
                                              })).paddingOnly(
                                        top: 10,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      //
                                    ],
                                  ).paddingOnly(left: 15, right: 15),
                                ),
                              ); // Replace with your normal widget when not loading
                            }
                          })),
                    )
                  ],
                ), // Display this text if isLocationOn is false
              ),
            )


        ,
          )
      );
  }
}
//

_launchTelephone(String number) async {
  final telephoneNumber = 'tel:$number'; // Add 'tel:' prefix to the number
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
