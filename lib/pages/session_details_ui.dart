import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/exports.dart';

class SessionDetailsUi extends StatelessWidget {
  const SessionDetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: const Text(''), context: context,),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: Get.width,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Thanks for Fitness Session,",
                      style: Theme.of(context).textTheme.headlineLarge),
                  TextSpan(
                      text: "\nJohn",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.yellow)),
                ]),
              )).paddingOnly(top: 15,bottom: 15),
          SizedBox(
              width: Get.width * .8,
              child: Text(
                "We Hope you enjoyed your session .",
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
                Text("26 Mar 2024 07:45 AM",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.impgrey,fontWeight: FontWeight.w500)),
                Text("7.21km | 32min",
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
                const CircleAvatar(
                  maxRadius: 35,
                  backgroundColor: AppColors.black,
                  backgroundImage: AssetImage(ImagesPaths.profilePic),
                ).paddingOnly(
                    left: Get.height * .02, right: Get.width * .08),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Max',
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
                          color: AppColors.yellow,
                          size: 18,
                        ),
                        Text(
                          "4.86 (49)",
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

          Transform.translate(
            offset: const Offset(-12,0),
            child: Row(
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
                      height: Get.height*0.091,
                      width: 1,
                      color: AppColors.yellow,
                    ).paddingOnly(top: 3,bottom: 3),
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.yellow,
                      size: 22,
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width*0.014,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aryarup Comples",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.impgrey, fontWeight: FontWeight.w600),
                    ).paddingOnly(bottom: 5),
                    SizedBox(
                        width: Get.width * .77,
                        child: Text(
                          "221b Baker St, Marylebone, Dubai NW! 6xE, United Arabia - 25m",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: AppColors.impgrey,
                              ),
                        )).paddingOnly(bottom: 5),
                    Text("9:54 AM",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.yellow,),).paddingOnly(bottom: 8),
                    Container(
                      width: Get.width*.77,
                      height: 1,
                      color: AppColors.grey,
                    ).paddingOnly(top: 6,bottom: 12),
                    Text(
                      "Aryarup Comples",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.impgrey, fontWeight: FontWeight.w600),
                    ).paddingOnly(bottom: 5),
                    SizedBox(
                        width: Get.width * .77,
                        child: Text(
                          "221b Baker St, Marylebone, Dubai NW! 6xE, United Arabia - 25m",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: AppColors.impgrey,),
                        )).paddingOnly(bottom: 5),
                    Text("9:54 AM",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.yellow,),),
                  ],
                )
              ],
            ).paddingOnly(top: Get.height*0.035,bottom: Get.height*0.055),
          ),
          Container(
            height: Get.height*0.11,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.blackShade,
              borderRadius: BorderRadius.circular(5)

            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("How was your session with John ?",style: Theme.of(context).textTheme.labelLarge)),
                RatingBar.builder(
                  initialRating: -1,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                  const EdgeInsets.symmetric(horizontal: 6.0),
                  itemBuilder: (context, _) => InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.review);
                    },
                    child: const Icon(
                      Icons.star_border,color: AppColors.yellow,
                    )
                  ),
                  onRatingUpdate: (rating) {
                    Get.toNamed(AppRoutes.review);
                  },
                ).paddingOnly(top: Get.height*0.02),
              ],
            ),
          ),


        ],
      ).paddingOnly(left: Get.width*0.07, right: Get.width*0.07),
    );
  }
}
