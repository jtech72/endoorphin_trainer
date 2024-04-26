import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class BookingDetailsUi extends StatefulWidget {
  const BookingDetailsUi({super.key});

  @override
  State<BookingDetailsUi> createState() => _BookingDetailsUiState();
}

class _BookingDetailsUiState extends State<BookingDetailsUi> {
  bool firstButtonSelected = false;
  bool secondButtonSelected = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: myAppBar(
          title: Text("Booking Details",
              style: Theme.of(context).textTheme.bodyMedium),
          context: context),
      body: SingleChildScrollView(
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
                          const Icon(
                            Icons.star,
                            color: AppColors.impgrey,
                            size: 18,
                          ),
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
            Transform.translate(
              offset: const Offset(-12, 0),
              child: Row(
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
                        height: Get.height * 0.101,
                        width: 1,
                        color: AppColors.yellow,
                      ).paddingOnly(top: 3, bottom: 3),
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.yellow,
                        size: 22,
                      )
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.014,
                  ),
                  Column(
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
                        width: Get.width * .77,
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
                  )
                ],
              ).paddingOnly(
                  top: Get.height * 0.035, bottom: Get.height * 0.055),
            ),
            Text(
              "Session Details",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.yellow),
            ).paddingOnly(bottom: 0, top: 0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blackShade,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Booked on:",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500))
                          .paddingOnly(right: Get.width * .150),
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
                    color: AppColors.impgrey,
                  ).paddingOnly(left: 10, right: 10),
                  Row(
                    children: [
                      Text("Session Duration:",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500))
                          .paddingOnly(right: Get.width * .045),
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
                    color: AppColors.impgrey,
                  ).paddingOnly(left: 10, right: 10),
                  Row(
                    children: [
                      Text("Booking Date:",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500))
                          .paddingOnly(right: Get.width * .10),
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
                    color: AppColors.impgrey,
                  ).paddingOnly(left: 10, right: 10),
                  Row(
                    children: [
                      Text("Session Start time:",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500))
                          .paddingOnly(right: Get.width * .016),
                      Text("26 March 2024 at 07:00:00",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ).paddingOnly(left: 10, right: 10,bottom: 5,top: 5),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: AppColors.impgrey,
                  ).paddingOnly(left: 10, right: 10),
                  Row(
                    children: [
                      Text("Session End time:",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w500))
                          .paddingOnly(right: Get.width * .035),
                      Text("26 March",
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
                          style: Theme.of(context).textTheme.labelLarge)),
                  RatingBar.builder(
                    initialRating: -1,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    itemBuilder: (context, _) => InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.review);
                        },
                        child: const Icon(
                          Icons.star_border,
                          color: AppColors.yellow,
                        )),
                    onRatingUpdate: (rating) {
                      Get.toNamed(AppRoutes.review);
                    },
                  ).paddingOnly(top: Get.height * 0.02),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.bookingrequest);
                    print("object");
                    setState(() {
                      firstButtonSelected = !firstButtonSelected;
                      if (firstButtonSelected) secondButtonSelected = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.yellow),
                      borderRadius: BorderRadius.circular(50),
                      color: firstButtonSelected ? AppColors.yellow: Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Accept",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: firstButtonSelected ? AppColors.black : AppColors.yellow),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secondButtonSelected = !secondButtonSelected;
                      if (secondButtonSelected) firstButtonSelected = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.yellow),
                      borderRadius: BorderRadius.circular(50),
                      color: secondButtonSelected ? AppColors.yellow : Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Reject",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondButtonSelected ? AppColors.black : AppColors.yellow),
                    ),
                  ),
                ),
              ],
            ).paddingOnly(top: 30),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkButton(child: Text("Cancelled"), onTap: (){}),
            //   ],
            // )

          ],
        ).paddingOnly(left: 18, right: 18),
      ),
    );
  }
}
//