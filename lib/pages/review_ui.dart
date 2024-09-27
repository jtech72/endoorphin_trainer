import 'dart:developer';
import '../utils/exports.dart';
import 'package:flutter/material.dart';
class ReviewUi extends StatelessWidget {
  const ReviewUi({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewController controller= Get.put(ReviewController());
    SessionRunningController controller2 = Get.find();

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
       appBar: myAppBar(title: GestureDetector(onTap: (){Get.back();},child: Text('Review Your Booking/User',style: Theme.of(context).textTheme.headlineSmall,)), context: context,),
        body: FutureBuilder(
          future:CallAPI.getBookingDetails(id: controller2.sessionIds!["id"].toString()),
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
              controller.bookingId = snapshot.data!.result!.bookingId.toString();
              controller.userId = snapshot.data!.result!.userId.toString();
              return
                    Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesPaths.bgBlackShade),fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                snapshot.data!.result!.customerProfileImg == " "?
                                const CircleAvatar(
                                  maxRadius: 35,
                                  backgroundColor: AppColors.black,
                                  backgroundImage: AssetImage("assets/images/img_profile.png"),
                                ).paddingOnly(
                                    left: Get.height * .02, right: Get.width * .08):
                                CachedNetworkImage(
                                  imageUrl: snapshot.data!.result!.customerProfileImg.toString(),
                                  imageBuilder: (context, imageProvider) => CircleAvatar(
                                    maxRadius: 40,
                                    backgroundColor: AppColors.black,
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) => const CircleAvatar(
                                    maxRadius: 40,
                                    backgroundColor: AppColors.black,
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => const CircleAvatar(
                                    maxRadius: 40,
                                    backgroundColor: AppColors.black,
                                    backgroundImage: AssetImage("assets/images/img_profile.png"), // Fallback image
                                  ),
                                ),
                                Text(
                                  snapshot.data!.result!.customerName.toString(),
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ).paddingOnly(top: 10),
                                Text(
                                  "Please share your experience with a quick review",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.impgrey),
                                ).paddingOnly(top: 10),
                                RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 0,
                                  unratedColor: AppColors.impgrey,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                                  itemBuilder: (context, _) => Image.asset(ImagesPaths.star2,scale: 5,),
                                  onRatingUpdate: (rating) {
                                    controller.ratingCount.value = rating;
                                    log(controller.ratingCount.value.toString());
                                    controller.writeReviewVisible.value = true;
                                  },
                                ).paddingOnly(top: 20),
                                Obx(
                                      ()=> Text(
                                      controller.writeReviewVisible.value == false?
                                      "Tap the stars to rate":"Check what applies to ${snapshot.data!.result!.customerName.toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.impgrey))
                                      .paddingOnly(top: 10),
                                ),
                                Obx(
                                      ()=> Visibility(
                                    visible: controller.writeReviewVisible.value,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Write a Review",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        Container(
                                          height: Get.height*0.15,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: AppColors.greyButton,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child:  Padding(
                                            padding:
                                            const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: TextField(
                                              textInputAction: TextInputAction.done,
                                              maxLength: 250,
                                              controller: controller.descriptionController,
                                              style: const TextStyle(
                                                color: AppColors.impgrey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              buildCounter: (
                                                  BuildContext context, {
                                                    required int currentLength,
                                                    required bool isFocused,
                                                    required int? maxLength,
                                                  }) {
                                                return Text(
                                                  '$currentLength/$maxLength',
                                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12,color: AppColors.whiteShade), // Adjust the font size here
                                                );
                                              },
                                              maxLines: 3,
                                              decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                border: InputBorder.none,
                                                hintText: 'Enter your review here',
                                                hintStyle:   TextStyle(
                                                  color: AppColors.lightGrey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).paddingOnly(top: 10,bottom: Get.height*.07),
                                        Center(
                                          child: inkButton(child: Text(
                                            "Submit",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(color: AppColors.black,fontSize: 18,
                                                fontFamily: 'Montserrat'),
                                          ), onTap: (){
                                            controller.onSubmitButton();

                                          }),
                                        )
                                      ],
                                    ).paddingOnly(top: 60),
                                  ),
                                )
                              ],
                            ).paddingOnly(top: Get.height*0.03,left: Get.width*0.025,right: Get.width*0.025),
                          ),
                        ),
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

