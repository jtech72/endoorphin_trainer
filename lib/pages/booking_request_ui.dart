import 'package:endoorphin_trainer/controllers/booking_request_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../utils/exports.dart';

class BookingRequsetUi extends StatelessWidget {
  const BookingRequsetUi({super.key});

  @override
  Widget build(BuildContext context) {
    BookingRequestController controller = Get.find();
    return Scaffold(
        // appBar: myAppBar(
        //     title: Text("",
        //         style: Theme.of(context).textTheme.bodyMedium),
        //     context: context),
        bottomSheet: BottomSheet(
          shape: const ContinuousRectangleBorder(),
          enableDrag: true,
          backgroundColor: AppColors.black,
          onClosing: () {},
          builder: (BuildContext context) {
            return Obx(() => controller.selectedIndex.value == 2
                ? SingleChildScrollView(
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(

                          image: DecorationImage(
                              image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type your “icebreaker” given by your\ncustomer to start your Fitness session!",
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
                          ).paddingOnly(bottom: Get.height * 0.03),
                          PinCodeTextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                                  backgroundColor:Colors.transparent,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  length: 4)
                              .paddingOnly(bottom: Get.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.width*.6,
                                child: SlideAction(
                                  sliderButtonYOffset:-4,
                                  animationDuration: Durations.medium4,
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
                                        ?.copyWith(color: Colors.black,fontSize: 14,
                                        fontFamily: 'Montserrat'),
                                  ).paddingOnly(left: Get.width*.07),
                                  onSubmit: (){
                                    Get.toNamed(AppRoutes.sessionRunning);
                                    return null;
                                  },

                                ).paddingOnly(right: 20),
                              ).paddingOnly(left: Get.width*0.01),
                              const CircleAvatar(
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
                              const Icon(
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
                    ),
                  )
                : controller.selectedIndex.value == 1
                    ? SingleChildScrollView(

                        child: Container(
                          // height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                              )
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Get.height*0.01,),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 32,
                                          backgroundColor: AppColors.yellow,
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(ImagesPaths
                                                .profilePic), // Your profile image
                                          ),
                                        ),
                                        const SizedBox(
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
                                                .labelMedium!.copyWith(color: Colors.white),
                                          ),
                                        ])),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                      Image.asset(ImagesPaths.star2,scale: 4,).paddingOnly(right: 5),
                                        Text(
                                          '4.78',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ).paddingOnly(
                                  bottom: 15,left: Get.width*0.04,right: Get.width*0.04
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
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.black,
                                      backgroundImage: AssetImage(
                                        ImagesPaths.telephone,
                                      ), // Your profile image
                                    ),
                                  ],
                                ).paddingOnly(top: Get.height*0.015),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        ).paddingOnly(top: 3,bottom: 3),

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
                                            width: Get.width * .80,
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
                                              .copyWith(color: AppColors.black,fontSize: 18,
                                              fontFamily: 'Montserrat'),
                                        ),
                                        onTap: () {
                                          controller.selectedIndex.value = 2;
                                        })),
                                SizedBox(
                                  height: Get.height * 0.02,
                                )
                              ]).paddingOnly(
                              top: 20, left: 20, right: 20, bottom: 20),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Get.height*0.03,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 32,
                                            backgroundColor: AppColors.yellow,
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage(ImagesPaths
                                                  .profilePic), // Your profile image
                                            ),
                                          ),
                                          const SizedBox(
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
                                                  .labelMedium!.copyWith(color: Colors.white),
                                            ),
                                          ])),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(ImagesPaths.star2,scale: 4,).paddingOnly(right: 5),
                                          Text(
                                            '4.78',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!.copyWith(color: Colors.white),
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
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white),
                                  ),
                                ],
                              ).paddingOnly(left: Get.width*0.04,right: Get.width*0.04,bottom: Get.height*0.01),
                              Center(
                                  child: InkButton(
                                      child: Text(
                                        'Accept',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(color: AppColors.black,fontSize: 18,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      onTap: () {
                                        controller.selectedIndex.value = 1;
                                      })).paddingOnly(top: 30, bottom: 30),
                              SizedBox(height: Get.height*0.02,),
                              //
                            ],
                          ).paddingOnly(left: 15, right: 15),
                        ),
                      ));
          },
        ),
        body:
            // Obx(() {
            //   return controller.currentLocation.value == null
            //       ? const Center(child: CircularProgressIndicator())
            //       .paddingOnly(bottom: 300)
            //       :
            Stack(
              children: [
                SizedBox(
                          height: Get.height * .8,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            zoomControlsEnabled: true,
                            scrollGesturesEnabled:true,
                            onMapCreated: (GoogleMapController onMapCreatedController) {
                              controller.mapController = onMapCreatedController;
                              controller.setMapStyle();
                            },
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
                        ),
                Positioned(
                    left: Get.width*0.041,
                    top: Get.height*0.061,
                    child: IconButton(
                        onPressed: (){
                          Get.back();
                          // if (controller.selectedIndex.value == 2) {
                          //   controller.selectedIndex.value = 1;
                          // } else if (controller.selectedIndex.value == 1) {
                          //   controller.selectedIndex.value = 0;
                          // }else{
                          //   Get.back();
                          // }
                        },
                        icon: Icon(Icons.arrow_back_ios,size: 18,color: Colors.black,)))
              ],
            ));
  }
}
//
