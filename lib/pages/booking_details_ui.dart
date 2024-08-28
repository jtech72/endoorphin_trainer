import 'package:cached_network_image/cached_network_image.dart';
import 'package:endoorphin_trainer/controllers/booking_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

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
      body:
      FutureBuilder(
        future:CallAPI.getBookingDetails(id: controller.bookingType.toString()),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return
              SizedBox(
                height: Get.height ,
                child: const Center(
                  child: CircularProgressIndicator(),
                ).paddingOnly(top: 0),
              );
          }
          else  if (snapshot.hasData ) {

            return
              SingleChildScrollView(
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
                        snapshot.data!.result!.customerProfileImg == null
                          ? CircleAvatar(
                          maxRadius: 35,
                          backgroundColor: AppColors.black,
                          backgroundImage: const AssetImage("assets/images/profile_img.png"),
                        )
                      : CachedNetworkImage(
              imageUrl: snapshot.data!.result!.customerProfileImg.toString(),
          imageBuilder: (context, imageProvider) => CircleAvatar(
          maxRadius: 35,
          backgroundColor: AppColors.black,
          backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => CircleAvatar(
          maxRadius: 35,
          backgroundColor: AppColors.black,
          child: CircularProgressIndicator(), // Loader while the image is loading
          ),
          errorWidget: (context, url, error) => CircleAvatar(
          maxRadius: 35,
          backgroundColor: AppColors.black,
          backgroundImage: const AssetImage("assets/images/profile_img.png"), // Fallback image
          ),
          )
              .paddingOnly(left: Get.height * .02, right: Get.width * .08),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: snapshot.data!.result!.customerName.toString(),
                                    style:
                                    Theme.of(context).textTheme.labelMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.yellow,
                                      fontSize: 16,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '\n${snapshot.data!.result!.customerEmail.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.impgrey),
                                      ),
                                       TextSpan(
                                        text: '\n${snapshot.data!.result!.customerPhoneNumber.toString()}',
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
                                      snapshot.data!.result!.userReviewCount.toString(),
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
                                  snapshot.data!.result!.trainerName.toString(),
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: AppColors.impgrey,
                                      fontWeight: FontWeight.w600),
                                ).paddingOnly(bottom: 5),
                                SizedBox(
                                    width: Get.width * .77,
                                    child: Text(
                                      snapshot.data!.result!.trainerAddress.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                        color: AppColors.impgrey,
                                      ),
                                    )).paddingOnly(bottom: 5),
                                Text(
                                  snapshot.data!.result!.startSession == null ?"":snapshot.data!.result!.startSession.toString(),
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
                                  snapshot.data!.result!.customerName.toString(),
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: AppColors.impgrey,
                                      fontWeight: FontWeight.w600),
                                ).paddingOnly(bottom: 5),
                                SizedBox(
                                    width: Get.width * .77,
                                    child: Text(
                                      snapshot.data!.result!.customerAddress.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                        color: AppColors.impgrey,
                                      ),
                                    )).paddingOnly(bottom: 5),
                                Text(
                                  snapshot.data!.result!.endSession == null ?"":snapshot.data!.result!.endSession.toString(),
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
                                Text(DateFormat('dd MMM yyyy, h:mm a')
                                    .format(DateTime.parse(snapshot!
                                    .data!.result!.bookingDate
                                    .toString())),
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
                                Text("${snapshot.data!.result!.duration.toString()} mins",
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
                                Text(DateFormat('dd MMM yyyy')
                                    .format(DateTime.parse(snapshot!
                                    .data!.result!.bookingDate
                                    .toString())),
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
                            snapshot.data!.result!.startSession ==null?SizedBox.shrink():
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
                                Text("07:00 pm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                            snapshot.data!.result!.startSession ==null?SizedBox.shrink():
                            Container(
                              height: 1,
                              width: Get.width,
                              color: AppColors.Black3,
                            ).paddingOnly(left: 10, right: 10),
                            snapshot.data!.result!.startSession ==null?SizedBox.shrink():
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
                                Text("08:00 pm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 10, right: 10,top: 5),
                            snapshot.data!.result!.startSession ==null?SizedBox.shrink():
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
                                Text(snapshot.data!.result!.bookingStatus!.capitalizeFirst.toString() ,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w500)),
                              ],
                            ).paddingOnly(left: 10, right: 10,top: 5),
                          ],
                        ).paddingOnly(top: 10, bottom: 10),
                      ).paddingOnly(bottom:Get.height*0.02),

                    ],
                  ).paddingOnly(left: Get.width*0.06, right: Get.width*0.06),
                ),
              );

          } else  if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          else  if (!snapshot.hasData) {
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
    );

  }
}
