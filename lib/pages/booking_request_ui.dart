import 'dart:developer';
import 'package:endoorphin_trainer/controllers/booking_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          onClosing: () {},
          builder: (BuildContext context) {
            return Obx(
                  () =>
                 controller.selectedIndex.value == 2

                        ?
                 SingleChildScrollView(
                   child: Column(
                     children: [
                       Text(
                         "Confirm Your Address at 10/16, MMB Rd, Buroshibtalla, Behala",
                         style: Theme.of(context).textTheme.headlineSmall,
                       ).paddingOnly(bottom: 30),
                       InkButton(
                           width: 150,
                           child: Text(
                             "Confirm Address",
                             style: Theme.of(context)
                                 .textTheme
                                 .headlineSmall
                                 ?.copyWith(color: AppColors.black),
                           ),
                           onTap: () {
                             // Get.toNamed(AppRoutes.findingTrainerMap);
                           })
                     ],
                   ).paddingOnly(top: 50, left: 25, right: 20,bottom: 50),
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

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor: AppColors.yellow,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(ImagesPaths.profilePic), // Your profile image
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RichText(text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'John Doe',style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      TextSpan(
                                        text: '\n3kms away | 12 min',style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ]
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,color: AppColors.yellow,),
                                Text('4.78',style: Theme.of(context).textTheme.labelMedium,)
                              ],
                            ),

                          ],
                        ).paddingOnly(bottom: 15),
                          Container(
                            height: 1,
                            width: Get.width,
                            color: AppColors.grey3,
                          ),

                          Container(
                            height: 35,
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: AppColors.yellow,
                              )
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage(ImagesPaths.arrow_1,)),
                                Text("Share ETA")

                              ],
                            ),
                          )
]
                      ).paddingOnly(top: 20),
                    )
                        :                  SingleChildScrollView(
                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               CircleAvatar(
                                 radius: 32,
                                 backgroundColor: AppColors.yellow,
                                 child: CircleAvatar(
                                   radius: 30,
                                   backgroundImage: AssetImage(ImagesPaths.profilePic), // Your profile image
                                 ),
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               RichText(text: TextSpan(
                                   children: [
                                     TextSpan(
                                       text: 'John Doe',style: Theme.of(context).textTheme.headlineSmall,
                                     ),
                                     TextSpan(
                                       text: '\n3kms away | 12 min',style: Theme.of(context).textTheme.labelMedium,
                                     ),
                                   ]
                               )),
                             ],
                           ),
                           Row(
                             children: [
                               Icon(Icons.star,color: AppColors.yellow,),
                               Text('4.78',style: Theme.of(context).textTheme.labelMedium,)
                             ],
                           )

                         ],
                       ).paddingOnly(top: 15,bottom: 15),
                       Text('Client address',style: Theme.of(context).textTheme.headlineSmall,),
                       Text('Malviya Nagar, Near LB hospital, Jaipur, Rajthan',style: Theme.of(context).textTheme.labelMedium,),
                       Center(child: InkButton(child: Text('Accept',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),), onTap:(){                             controller.selectedIndex.value = 1;
                       })).paddingOnly(top: 30,bottom: 30),
                       //

                     ],
                   ).paddingOnly(left: 15,right: 15),
                 )

            );
          },),
        body:
        // Obx(() {
        //   return controller.currentLocation.value == null
        //       ? const Center(child: CircularProgressIndicator())
        //       .paddingOnly(bottom: 300)
        //       :
        SizedBox(
          height: Get.height*.6,
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
