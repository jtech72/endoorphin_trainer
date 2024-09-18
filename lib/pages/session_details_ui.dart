import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../controllers/session_running_controller.dart';
import '../utils/exports.dart';

class SessionDetailsUi extends StatelessWidget {
  const SessionDetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    SessionRunningController controller = Get.find();

    return WillPopScope(
      onWillPop: ()async{
        Get.offAllNamed(AppRoutes.bottomNavigation);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:
        FutureBuilder(
          future:CallAPI.getBookingDetails(id: controller.sessionIds!["id"].toString()),
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
                Stack(
                  children: [
                    Transform.scale(
                        scaleX: 1.1,
                        scaleY: 1,
                        child: Image.asset(ImagesPaths.bgBlackShade,)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height*0.075,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.offAllNamed(AppRoutes.bottomNavigation);
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.arrow_back_ios,size: 18,).paddingOnly(right: Get.width*0.02)),
                            ),
                          ],
                        ).paddingOnly(left: Get.width*0.0),
                        SizedBox(
                            width: Get.width,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Thanks for the Fitness Session, ",
                                    style: Theme.of(context).textTheme.headlineLarge),
                                TextSpan(
                                    text: "${snapshot.data!.result!.trainerName.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(color: AppColors.yellow)),
                              ]),
                            )).paddingOnly(top: 15,bottom: 15),
                        SizedBox(
                            width: Get.width * .8,
                            child: Text(
                              "We Hope you enjoyed your session.",
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: AppColors.lightyGrey, fontWeight: FontWeight.w500),
                            )).paddingOnly(bottom: 15),
                        Container(
                          height: Get.height*0.053,
                          decoration: BoxDecoration(
                              color: AppColors.blackShade,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DateTextWidget(isoDate: snapshot.data!.result!.endSession.toString(),),
                              Text("${snapshot.data!.result!.duration.toString()} min",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: AppColors.impgrey,fontWeight: FontWeight.w500))
                            ],
                          ).paddingOnly(left: 10, right: 10),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.greyButton,
                          ),
                          child: Row(
                            children: [
                              snapshot.data!.result!.customerProfileImg == " "?
                              const CircleAvatar(
                                maxRadius: 35,
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage("assets/images/img_profile.png",),
                              ).paddingOnly(
                                  left: Get.height * .02, right: Get.width * .08):
                                CachedNetworkImage(
                                    imageUrl: snapshot.data!.result!.customerProfileImg.toString(),
                                     imageBuilder: (context, imageProvider) => CircleAvatar(
                                    maxRadius: 35,
                                    backgroundColor: Colors.transparent,
                                     backgroundImage: imageProvider,
                                       ),
                                    placeholder: (context, url) => CircleAvatar(
                                     maxRadius: 35,
                                      backgroundColor: Colors.transparent,
                                 child: CircularProgressIndicator(), // Loader while the image is loading
                                     ),
                                    errorWidget: (context, url, error) => CircleAvatar(
                                    maxRadius: 35,
                                     backgroundColor: Colors.transparent,
                                       backgroundImage: AssetImage("assets/images/img_profile.png"),
                                         ),
                                     ).paddingOnly(
                                     left: Get.height * .02, right: Get.width * .08,
                                      ),
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
                                        color: AppColors.impgrey,
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

                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(ImagesPaths.star2,scale: 3.8,).paddingOnly(right: Get.width*0.01),
                                      Text(
                                        snapshot.data!.result!.userReviewCount == null
                                            ? "0"
                                            : NumberFormat("##0.0").format(snapshot.data!.result!.userReviewCount),
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
                        ).paddingOnly(top: 15,bottom: 0),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: Get.height*0.025,
                                  width: Get.width*0.035,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.yellow),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: Get.height*0.101,
                                  width: 1,
                                  color: AppColors.yellow,
                                ).paddingOnly(top: 3,bottom: 3),
                                Image.asset(ImagesPaths.location,scale: 5,)
                              ],
                            ),
                            SizedBox(
                              width: Get.width*0.02,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.result!.trainerCity.toString(),
                                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: AppColors.impgrey, fontWeight: FontWeight.w600),
                                  ).paddingOnly(bottom: 5),
                                  SizedBox(
                                      width: Get.width * .77,
                                      height: 30,
                                      child: Text(
                                        snapshot.data!.result!.trainerAddress.toString(),
                                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color: AppColors.impgrey,
                                        ),
                                      )).paddingOnly(bottom: 5),
                                  Text(DateFormat('h:mm a')
                                      .format(DateTime.parse(snapshot!
                                      .data!.result!.startSession
                                      .toString())),style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.yellow,),).paddingOnly(bottom: 8),
                                  Container(
                                    width: Get.width*.82,
                                    height: 1,
                                    color: AppColors.grey,
                                  ).paddingOnly(top: 6,bottom: 12),
                                  Text(
                                    snapshot.data!.result!.customerCity.toString(),
                                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: AppColors.impgrey, fontWeight: FontWeight.w600),
                                  ).paddingOnly(bottom: 5),
                                  SizedBox(
                                      width: Get.width * .77,
                                      child: Text(
                                        snapshot.data!.result!.customerAddress.toString(),
                                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color: AppColors.impgrey,),
                                      )).paddingOnly(bottom: 5),
                                  Text(DateFormat('h:mm a')
                                      .format(DateTime.parse(snapshot!
                                      .data!.result!.endSession
                                      .toString())),style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.yellow,),),
                                ],
                              ),
                            )
                          ],
                        ).paddingOnly(top: Get.height*0.035,bottom: Get.height*0.055),
                        Container(
                          height: Get.height*0.11,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.blackShade,
                              borderRadius: BorderRadius.circular(5)

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text("How was your session with ${snapshot.data!.result!.customerName} ?",style: Theme.of(context).textTheme.labelLarge)),
                              RatingBar.builder(
                                initialRating: 5,
                                minRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                const EdgeInsets.symmetric(horizontal: 9.0),
                                itemBuilder: (context, _) => InkWell(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.review);
                                    },
                                    child:Image.asset(ImagesPaths.star,scale: 5,)
                                ),
                                onRatingUpdate: (rating) {
                                },
                              ).paddingOnly(top: Get.height*0.02),
                            ],
                          ),
                        ),


                      ],
                    ).paddingOnly(left: Get.width*0.07, right: Get.width*0.07),
                  ],
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
      ),
    );
  }
}
class DateTextWidget extends StatelessWidget {
  final String isoDate;

  DateTextWidget({required this.isoDate});

  String formatDate(String isoDate) {
    // Parse the ISO date string
    DateTime dateTime = DateTime.parse(isoDate);

    // Define the output format
    DateFormat outputFormat = DateFormat('dd MMM yyyy hh:mm a');

    // Format the parsed date
    String formattedDate = outputFormat.format(dateTime.toLocal());

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(isoDate);

    return Text(
      formattedDate,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: AppColors.impgrey,fontWeight: FontWeight.w500),
    );
  }
}