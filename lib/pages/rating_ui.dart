import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../utils/exports.dart';
class RatingUi extends StatelessWidget {
  const RatingUi({super.key});

  @override
  Widget build(BuildContext context) {
    RatingController controller =Get.find();
    return  Scaffold(
      appBar: myAppBar(
        title: Text(
          'Rating & Reviews',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.white),
        ),
        context: context,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPaths.bgBlackShade),
            fit: BoxFit.cover,
          ),),
        child: FutureBuilder(
          future: CallAPI.getReviewForTrainer(trainerId: storage.read("userId").toString()),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Skeletonizer(
                  // effect: ShimmerEffect(baseColor: AppColors.greyButton),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Reviews ',
                                      style: Theme.of(context).textTheme.headlineSmall
                                  ),
                                  TextSpan(
                                      text: "00",
                                      style: Theme.of(context).textTheme.headlineSmall
                                  ),
                                ]
                            )).paddingOnly(bottom: Get.height*0.01
                        ),
                        Container(
                          height: 1,
                          width: Get.width,
                          color: AppColors.grey2,
                        ).paddingOnly(bottom: Get.height*0.01),
                        SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                              itemCount: snapshot.data?.result!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 25,
                                              backgroundColor: AppColors.greyButton,
                                            ).paddingOnly(right: Get.width*0.03),
                                            SizedBox(
                                              width: Get.width*0.42,
                                              child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("{snapshot.data."),
                                                  Text("controller")
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const Text(
                                          "0000000",
                                        ).paddingOnly(right: Get.width*0.04)
                                      ],
                                    ).paddingOnly(bottom: Get.height*0.02),
                                    Text("snapshot.data!.",
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.whiteShade,),)

                                  ],
                                ).paddingOnly(bottom: Get.height*0.029);
                              }),
                        )
                      ],
                    ).paddingOnly(left: Get.width*0.05, right: Get.width*0.05),
                  )
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return
             snapshot.data!.result == null || snapshot.data!.result!.isEmpty?
                const Center(
                  child: Text('No Review Yet'),
                ):
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Reviews ',
                                    style: Theme.of(context).textTheme.headlineSmall
                                ),
                                TextSpan(
                                    text: "(${snapshot.data!.result!.length})",
                                    style: Theme.of(context).textTheme.headlineSmall
                                ),
                              ]
                          )).paddingOnly(bottom: Get.height*0.01
                      ),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: AppColors.grey2,
                      ).paddingOnly(bottom: Get.height*0.01),
                      SizedBox(
                        height: Get.height,
                        child: ListView.builder(
                            itemCount: snapshot.data!.result!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.black,
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot.data!.result![index].userData![0].profileImg.toString(),
                                              fit: BoxFit.cover,
                                              imageBuilder: (context, imageProvider) => CircleAvatar(
                                                radius: 25,
                                                backgroundImage: imageProvider, // Apply the loaded image
                                              ),
                                              placeholder: (context, url) => const CircularProgressIndicator(
                                                color: Colors.black, // Loader color set to black
                                              ),
                                              errorWidget: (context, url, error) =>const CircleAvatar(
                                                maxRadius: 25,
                                                backgroundColor: AppColors.black,
                                                backgroundImage: AssetImage("assets/images/img_profile.png"), // Fallback image
                                              ),
                                            ),
                                          ).paddingOnly(right: Get.width*0.03),
                                          SizedBox(
                                            width: Get.width*0.42,
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(overflow: TextOverflow.ellipsis,"${snapshot.data!.result![index].userData![0].userName.toString()} ${snapshot.data!.result![index].userData![0].lastName.toString()}",style:Theme.of(context).textTheme.headlineSmall),
                                                Text(controller.calculateDifferenceInDays(snapshot.data!.result![index].booking!.createdAt!),
                                                    style:Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500,color: AppColors.grey7)
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 16,
                                            initialRating: snapshot.data!.result![index].reviewCount!.toDouble(),
                                            minRating: 0,
                                            unratedColor: AppColors.impgrey,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.zero, // No padding
                                            itemBuilder: (context, _) => Container(
                                              width: 5.0,
                                              height: 30.0,
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.star,
                                                size:27.0, // Adjust the size if needed
                                                color: AppColors.yellow,
                                              ),
                                            ),
                                            onRatingUpdate: (rating) {
                                            },
                                            ignoreGestures: true,
                                          ).paddingOnly(right: Get.width*0.02),

                                          Text(
                                            "${snapshot.data!.result![index].reviewCount!.toString()}.0",
                                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                                          )
                                        ],
                                      ).paddingOnly(right: Get.width*0.04)
                                    ],
                                  ).paddingOnly(bottom: Get.height*0.02),
                                  Text(snapshot.data!.result![index].description.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.whiteShade,),)

                                ],
                              ).paddingOnly(bottom: Get.height*0.029);
                            }),
                      )
                    ],
                  ).paddingOnly(left: Get.width*0.05, right: Get.width*0.05),
                );
            } else {
              return const Center(
                child: Text("No Review Yet"),
              );
            }
          },
        ),
      ),
    );
  }
}
