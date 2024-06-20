import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:endoorphin_trainer/controllers/more_about_you_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';

class MoreAboutYouUi extends StatelessWidget {
  const MoreAboutYouUi({super.key});
  @override
  Widget build(BuildContext context) {
    MoreAboutYouController controller = Get.put(MoreAboutYouController());

    return Scaffold(
      // appBar: myAppBar(
      //     title: Transform.translate(
      //         offset: const Offset(0, -3),
      //         child: GestureDetector(
      //             onTap: () {
      //               Get.toNamed(AppRoutes.registration);
      //             },
      //             child: Image.asset(
      //               ImagesPaths.logoimg,
      //               height: 36,
      //               width: 146,
      //             ))),
      //     action: [
      //       IconButton(
      //           onPressed: (){
      //               Get.toNamed(AppRoutes.bio);
      //           },
      //           icon: Container(
      //             alignment: Alignment.center,
      //             height: 24,
      //             width: 44,
      //             decoration: const BoxDecoration(
      //                 color: AppColors.yellow,
      //                 borderRadius: BorderRadius.all(Radius.circular(24))),
      //             child: Text('Skip',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
      //           ),
      //       ),
      //       SizedBox(width: Get.width*0.04,)
      //     ],
      //     context: context),
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.black,
        elevation: 3,
        titleSpacing: -10,
        leading: const SizedBox(),
        title: Transform.translate(
            offset:  Offset(- Get.width*0.09, -3),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.registration);
                },
                child: Image.asset(
                  ImagesPaths.logoimg,
                  height: 36,
                  width: 146,
                ))),
        actions: [
          IconButton(
            onPressed: (){
              Get.toNamed(AppRoutes.bio);
            },
            icon: Container(
              alignment: Alignment.center,
              height: 24,
              width: 44,
              decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Text('Skip',style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            ),
          ),
          SizedBox(width: Get.width*0.04,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImagesPaths.bgBlackShade),
          )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload your Documents",
                  style: Theme.of(context).textTheme.headlineSmall,
                ).paddingOnly(top: Get.height * .02, bottom: Get.height * .02),
                Text(
                  "Begin your journey by uploading your selected category certificate, passport and Emirates ID.",
                  style: Theme.of(context).textTheme.displayLarge,
                ).paddingOnly(top: Get.height * .02, bottom: Get.height * .02),
                Container(
                  height: Get.height * 0.26,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.greyButton,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImagesPaths.cooltick1,
                            height: 20,
                            width: 20,
                          ).paddingOnly(right: 15),
                          Expanded(
                            child: Text(
                              controller.item[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ).paddingOnly(
                          left: Get.width * 0.06,
                          right: Get.width * 0.02,
                          top: Get.height * 0.02,
                          bottom: Get.height * 0.01);
                    },
                  ),
                ).paddingOnly(top: Get.height * .01),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                FutureBuilder(
                  future:
                      CallAPI.getDocStatus(storage.read("userId").toString()),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ).paddingOnly(top: 20);
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.result == null) {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }
                    return
                      ListView.builder(
                      itemCount: snapshot.data!.result!.length + 4, // Adjusted itemCount to include the additional widgets
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index < snapshot.data!.result!.length) {
                          return
                            index < snapshot.data!.result!.length &&
                                snapshot.data!.result![index].documentBackImg != null &&
                                  snapshot.data!.result![index].documentFrontImg != null
                          //Certification
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.greyButton,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.result![index]!.category!.name.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                    color: AppColors.yellow,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 20,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: AppColors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "SAVED",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color: AppColors.white,
                                                      fontSize: 8),
                                            ),
                                          ).paddingOnly(right: 10),
                                          Container(
                                            height: 20,
                                            width: 25,
                                            decoration: const BoxDecoration(
                                                color: AppColors.yellow,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.done,
                                              color: AppColors.black,
                                              size: 14,
                                              weight: 10,
                                            ),
                                          )
                                        ],
                                      ).paddingOnly(bottom: 5),
                                      Container(
                                        height: 0.5,
                                        color: AppColors.grey5,
                                      ).paddingOnly(bottom: 15, top: 5),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () =>
                                                SizedBox(
                                                  width: Get.width * 0.55,
                                                  height: Get.height * 0.17,
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: controller.isFrontImageVisible2.value == true
                                                        ? snapshot.data!.result![index].documentFrontImg.toString()
                                                        : snapshot.data!.result![index].documentBackImg.toString(),
                                                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                                      child: SizedBox(
                                                        height: 30, // Adjust the height to make it smaller
                                                        width: 30,  // Adjust the width to make it smaller
                                                        child: CircularProgressIndicator(value: downloadProgress.progress),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Certificate Name",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400),
                                                    ),
                                                    Text(
                                                      snapshot.data!.result![index].categoryName
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color: AppColors
                                                                  .whiteShade),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ).paddingOnly(bottom: 7),
                                                    Text(
                                                      "Certificate Number",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400),
                                                    ),
                                                    Text(
                                                      snapshot.data!.result![index].categoryNumber
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color: AppColors
                                                                  .whiteShade),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ).paddingOnly(left: 10),
                                                Obx(
                                                      () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .isFrontImageVisible2
                                                              .value = true;
                                                        },
                                                        child: Container(
                                                          height: 22,
                                                          width: 22,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .yellow),
                                                              color: controller
                                                                  .isFrontImageVisible2
                                                                  .value !=
                                                                  false
                                                                  ? AppColors
                                                                  .yellow
                                                                  : Colors
                                                                  .transparent,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child: Transform.translate(
                                                            offset: const Offset(-1,0),
                                                            child: Image.asset(
                                                              ImagesPaths.arrowback,scale: 7,
                                                              color: controller.isFrontImageVisible2.value != false
                                                                  ? AppColors
                                                                  .black
                                                                  : AppColors.yellow,
                                                              alignment: Alignment.center,),
                                                          ),
                                                        ).paddingOnly(right: 0),
                                                      ),
                                                      Container(
                                                        height: Get.height*0.025,
                                                        width: Get.width*0.12,
                                                        alignment: Alignment.topCenter,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: AppColors.grey),
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child:Text(controller.isFrontImageVisible2.value ? 'Front' : 'Back',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)
                                                        ,
                                                      ).paddingOnly(left: 1,right: 1),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .isFrontImageVisible2
                                                              .value = false;
                                                          log(controller
                                                              .isFrontImageVisible2
                                                              .value
                                                              .toString());
                                                        },
                                                        child: Container(
                                                          height: 22,
                                                          width: 22,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .yellow),
                                                              color: controller
                                                                  .isFrontImageVisible2
                                                                  .value ==
                                                                  false
                                                                  ? AppColors
                                                                  .yellow
                                                                  : Colors
                                                                  .transparent,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child: Transform.translate(
                                                            offset: const Offset(1,0),
                                                            child: Image.asset(
                                                              ImagesPaths.arrowforword,scale: 7,
                                                              color: controller.isFrontImageVisible2.value != false
                                                                  ? AppColors
                                                                  .yellow
                                                                  : AppColors.black,
                                                              alignment: Alignment.center,),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ).paddingOnly(top: 7,left: 5,),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ).paddingOnly(
                                      top: 5, bottom: 5, right: 15, left: 15),
                                ).paddingOnly(bottom: Get.height * 0.02)
                              : index < snapshot.data!.result!.length &&
                                      snapshot.data!.result![index]
                                              .emiratesfrontImg !=
                                          null &&
                                      snapshot.data!.result![index]
                                              .emiratesbackImg !=
                                          null

                          //Emirates Id
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.greyButton,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data!.result![index]!
                                                        .emirates
                                                        .toString()
                                                        .toUpperCase()
                                                        .substring(0, 1) +
                                                    snapshot
                                                        .data!
                                                        .result![index]!
                                                        .emirates
                                                        .toString()
                                                        .toLowerCase()
                                                        .substring(1),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                        color: AppColors.yellow,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 20,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: AppColors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  "SAVED",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 8),
                                                ),
                                              ).paddingOnly(right: 10),
                                              Container(
                                                height: 20,
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                    color: AppColors.yellow,
                                                    shape: BoxShape.circle),
                                                child: const Icon(
                                                  Icons.done,
                                                  color: AppColors.black,
                                                  size: 14,
                                                  weight: 10,
                                                ),
                                              )
                                            ],
                                          ).paddingOnly(bottom: 5),
                                          Container(
                                            height: 0.5,
                                            color: AppColors.grey5,
                                          ).paddingOnly(bottom: 15, top: 5),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => SizedBox(
                                                  width: Get.width * 0.55,
                                                  height: Get.height * 0.17,
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:  controller.isFrontImageVisible1
                                                        .value ==
                                                        true
                                                        ? snapshot
                                                        .data!
                                                        .result![index]
                                                        .emiratesfrontImg
                                                        .toString()
                                                        : snapshot
                                                        .data!
                                                        .result![index]
                                                        .emiratesbackImg
                                                        .toString(),
                                                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                                      child: SizedBox(
                                                        height: 30, // Adjust the height to make it smaller
                                                        width: 30,  // Adjust the width to make it smaller
                                                        child: CircularProgressIndicator(value: downloadProgress.progress),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Certificate Name",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .result![index]
                                                              .emiratesName
                                                              .toString(),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .whiteShade),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ).paddingOnly(bottom: 7),
                                                        Text(
                                                          "Certificate Number",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .result![index]
                                                              .emiratesNumber
                                                              .toString(),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .whiteShade),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                        ),
                                                      ],
                                                    ).paddingOnly(left: 10),
                                                    Obx(
                                                          () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .isFrontImageVisible1
                                                                  .value = true;
                                                            },
                                                            child: Container(
                                                              height: 22,
                                                              width: 22,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .yellow),
                                                                  color: controller
                                                                      .isFrontImageVisible1
                                                                      .value !=
                                                                      false
                                                                      ? AppColors
                                                                      .yellow
                                                                      : Colors
                                                                      .transparent,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Transform.translate(
                                                                offset: const Offset(-1,0),
                                                                child: Image.asset(
                                                                  ImagesPaths.arrowback,scale: 7,
                                                                  color: controller.isFrontImageVisible1.value != false
                                                                      ? AppColors
                                                                      .black
                                                                      : AppColors.yellow,
                                                                  alignment: Alignment.center,),
                                                              ),
                                                            ).paddingOnly(right: 0),
                                                          ),
                                                          Container(
                                                            height: Get.height*0.025,
                                                            width: Get.width*0.12,
                                                            alignment: Alignment.topCenter,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: AppColors.grey),
                                                                borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child:Text(controller.isFrontImageVisible1.value ? 'Front' : 'Back',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)
                                                            ,
                                                          ).paddingOnly(left: 1,right: 1),
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .isFrontImageVisible1
                                                                  .value = false;
                                                              log(controller
                                                                  .isFrontImageVisible1
                                                                  .value
                                                                  .toString());
                                                            },
                                                            child: Container(
                                                              height: 22,
                                                              width: 22,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .yellow),
                                                                  color: controller
                                                                      .isFrontImageVisible1
                                                                      .value ==
                                                                      false
                                                                      ? AppColors
                                                                      .yellow
                                                                      : Colors
                                                                      .transparent,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Transform.translate(
                                                                offset: const Offset(1,0),
                                                                child: Image.asset(
                                                                  ImagesPaths.arrowforword,scale: 7,
                                                                  color: controller.isFrontImageVisible1.value != false
                                                                      ? AppColors
                                                                      .yellow
                                                                      : AppColors.black,
                                                                  alignment: Alignment.center,),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ).paddingOnly(top: 7,left: 5,),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ).paddingOnly(
                                          top: 5,
                                          bottom: 5,
                                          right: 15,
                                          left: 15),
                                    ).paddingOnly(bottom: Get.height * 0.02)
                                  : index <
                                              snapshot.data!.result!.length &&
                                          snapshot.data!.result![index]
                                                  .passportfrontImg !=
                                              null &&
                                          snapshot.data!.result![index]
                                                  .passportbackImg !=
                                              null
                          //Passport
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.greyButton,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot
                                                            .data!
                                                            .result![index]!
                                                            .passport
                                                            .toString()
                                                            .toUpperCase()
                                                            .substring(0, 1) +
                                                        snapshot
                                                            .data!
                                                            .result![index]!
                                                            .passport
                                                            .toString()
                                                            .toLowerCase()
                                                            .substring(1),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                          color:
                                                              AppColors.yellow,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  const Spacer(
                                                    flex: 1,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 20,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "SAVED",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 8),
                                                    ),
                                                  ).paddingOnly(right: 10),
                                                  Container(
                                                    height: 20,
                                                    width: 25,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: AppColors
                                                                .yellow,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: const Icon(
                                                      Icons.done,
                                                      color: AppColors.black,
                                                      size: 14,
                                                      weight: 10,
                                                    ),
                                                  )
                                                ],
                                              ).paddingOnly(bottom: 5),
                                              Container(
                                                height: 0.5,
                                                color: AppColors.grey5,
                                              ).paddingOnly(bottom: 15, top: 5),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(
                                                    () => SizedBox(
                                                      width: Get.width * 0.55,
                                                      height: Get.height * 0.17,
                                                      child:CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:controller.isFrontImageVisible
                                                            .value ==
                                                            true
                                                            ? snapshot
                                                            .data!
                                                            .result![
                                                        index]
                                                            .passportfrontImg
                                                            .toString()
                                                            : snapshot
                                                            .data!
                                                            .result![
                                                        index].passportbackImg
                                                            .toString(),
                                                        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                                          child: SizedBox(
                                                            height: 30, // Adjust the height to make it smaller
                                                            width: 30,  // Adjust the width to make it smaller
                                                            child: CircularProgressIndicator(value: downloadProgress.progress),
                                                          ),
                                                        ),
                                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Certificate Name",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .result![index]
                                                                  .passportName
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontSize: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .whiteShade),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                            ).paddingOnly(
                                                                bottom: 7),
                                                            Text(
                                                              "Certificate Number",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .result![index]
                                                                  .passportNumber
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelSmall!
                                                                  .copyWith(
                                                                      fontSize: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .whiteShade),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                            ),
                                                          ],
                                                        ).paddingOnly(left: 10),
                                                        Obx(
                                                              () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .isFrontImageVisible
                                                                      .value = true;
                                                                },
                                                                child: Container(
                                                                  height: 22,
                                                                  width: 22,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .yellow),
                                                                      color: controller
                                                                          .isFrontImageVisible
                                                                          .value !=
                                                                          false
                                                                          ? AppColors
                                                                          .yellow
                                                                          : Colors
                                                                          .transparent,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Transform.translate(
                                                                    offset: const Offset(-1,0),
                                                                    child: Image.asset(
                                                                      ImagesPaths.arrowback,scale: 7,
                                                                      color: controller.isFrontImageVisible.value != false
                                                                          ? AppColors
                                                                          .black
                                                                          : AppColors.yellow,
                                                                      alignment: Alignment.center,),
                                                                  ),
                                                                ).paddingOnly(right: 0),
                                                              ),
                                                              Container(
                                                                height: Get.height*0.025,
                                                                width: Get.width*0.12,
                                                                alignment: Alignment.topCenter,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: AppColors.grey),
                                                                    borderRadius: BorderRadius.circular(10)
                                                                ),
                                                                child:Text(controller.isFrontImageVisible.value ? 'Front' : 'Back',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)
                                                                ,
                                                              ).paddingOnly(left: 1,right: 1),
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .isFrontImageVisible
                                                                      .value = false;
                                                                  log(controller
                                                                      .isFrontImageVisible
                                                                      .value
                                                                      .toString());
                                                                },
                                                                child: Container(
                                                                  height: 22,
                                                                  width: 22,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColors
                                                                              .yellow),
                                                                      color: controller
                                                                          .isFrontImageVisible
                                                                          .value ==
                                                                          false
                                                                          ? AppColors
                                                                          .yellow
                                                                          : Colors
                                                                          .transparent,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Transform.translate(
                                                                    offset: const Offset(1,0),
                                                                    child: Image.asset(
                                                                      ImagesPaths.arrowforword,scale: 7,
                                                                      color: controller.isFrontImageVisible.value != false
                                                                          ? AppColors
                                                                          .yellow
                                                                          : AppColors.black,
                                                                      alignment: Alignment.center,),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ).paddingOnly(top: 7,left: 5,),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ).paddingOnly(
                                              top: 5,
                                              bottom: 5,
                                              right: 15,
                                              left: 15),
                                        ).paddingOnly(bottom: Get.height * 0.02)
                                      : InkWell(
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            final userId = snapshot.data!
                                                    .result![index].userId ??
                                                "";
                                            final categoryId = snapshot
                                                    .data!
                                                    .result![index]
                                                    .category
                                                    ?.id ??
                                                "";

                                            Get.toNamed(
                                                AppRoutes.trainerPassport,
                                                arguments: {
                                                  "userId": userId,
                                                  "name" : snapshot.data!.result![index].category!.name.toString(),
                                                  "categoryName": "",
                                                  "categoryId": categoryId,

                                                });
                                          },
                                          child: Container(
                                            height: 70,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.greyButton,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Transform.translate(
                                                      offset:
                                                          const Offset(-10, 2),
                                                      child: Container(
                                                        height:
                                                            Get.width * 0.14,
                                                        width: Get.width * 0.14,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 15,
                                                                vertical: 17),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                        child: Image.asset(
                                                          ImagesPaths.document,
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                      ).paddingOnly(
                                                          left: 20,
                                                          right: 10,
                                                          bottom: 5),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              Get.width * .55,
                                                          child: Text(
                                                            snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .category ==
                                                                    null
                                                                ? ""
                                                                : snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .category!
                                                                    .name
                                                                    .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleLarge
                                                                ?.copyWith(
                                                                    color: AppColors
                                                                        .yellow),
                                                          ).paddingOnly(
                                                              top: 12),
                                                        ),
                                                        Text(
                                                          "Upload your Certification ...",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          12),
                                                        ).paddingOnly(top: 10),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                      color: AppColors.impgrey,
                                                      size: 22,
                                                    ).paddingOnly(right: 15),
                                                  ],
                                                ),
                                              ],
                                            ).paddingOnly(left: 0),
                                          ).paddingOnly(
                                              bottom: Get.height * 0.02),
                                        );
                        }
                        else if (index == snapshot.data!.result!.length &&
                            storage.read("Emirates ID") != "true") {
                          return InkWell(
                            onTap: () {
                              uploadImage = UploadImage.byInitically;
                              Get.toNamed(AppRoutes.trainerPassport,
                                  arguments: {
                                    "userId": storage.read("userId").toString(),
                                    "categoryName": "Emirates ID",
                                  });
                            },
                            child: Container(
                              height: 70,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColors.greyButton,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(-10, 2),
                                        child: Container(
                                          height: Get.width * 0.14,
                                          width: Get.width * 0.14,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 17),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.black,
                                          ),
                                          child: Image.asset(
                                            ImagesPaths.document,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ).paddingOnly(
                                            left: 20, right: 10, bottom: 5),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * .55,
                                            child: Text(
                                              "Emirates ID",
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      color: AppColors.yellow),
                                            ).paddingOnly(top: 12),
                                          ),
                                          Text(
                                            "Upload your emirates id...",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(fontSize: 12),
                                          ).paddingOnly(top: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: AppColors.impgrey,
                                        size: 22,
                                      ).paddingOnly(right: 15),
                                    ],
                                  ),
                                ],
                              ).paddingOnly(left: 0),
                            ).paddingOnly(bottom: Get.height * 0.02),
                          );
                        }
                        else if (index == snapshot.data!.result!.length + 1 &&
                            storage.read("Passport") != "true") {
                          return InkWell(
                            onTap: () {
                              uploadImage = UploadImage.byInitically;
                              Get.toNamed(AppRoutes.trainerPassport,
                                  arguments: {
                                    "userId": storage.read("userId").toString(),
                                    "categoryName": "Passport",
                                  });
                            },
                            child: Container(
                              height: 70,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: AppColors.greyButton,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(-10, 2),
                                        child: Container(
                                          height: Get.width * 0.14,
                                          width: Get.width * 0.14,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 17),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.black,
                                          ),
                                          child: Image.asset(
                                            ImagesPaths.document,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ).paddingOnly(
                                            left: 20, right: 10, bottom: 5),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * .55,
                                            child: Text(
                                              "Passport",
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      color: AppColors.yellow),
                                            ).paddingOnly(top: 12),
                                          ),
                                          Text(
                                            "Upload your passport...",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(fontSize: 12),
                                          ).paddingOnly(top: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: AppColors.impgrey,
                                        size: 22,
                                      ).paddingOnly(right: 15),
                                    ],
                                  ),
                                ],
                              ).paddingOnly(left: 0),
                            ).paddingOnly(bottom: Get.height * 0.02),
                          );
                        }
                        else if (index == snapshot.data!.result!.length + 2
                         ) {
                          return Obx(
                            () => Material(
                              type: MaterialType.transparency,
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      activeColor: AppColors.yellow,
                                      checkColor: Colors.black,
                                      value: controller.isChecked.value,
                                      onChanged: (value) {
                                        controller.isChecked.value = value!;
                                        log(controller.isChecked.value
                                            .toString());
                                      },
                                    ),
                                    const Text(
                                        'I accept the terms and conditions',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                    const Spacer(flex: 1,),
                                    const Text(
                                        'view all',
                                        style: TextStyle(
                                            color: AppColors.whiteShade, fontSize: 12))
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (index == snapshot.data!.result!.length + 3) {
                          return Center(
                            child: InkButton(
                              child: Text(
                                'Continue',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                    ),
                              ),
                                onTap: () {
                                  bool hasMissingDocuments =
                                         storage.read("Passport") != "true"||
                                             storage.read("Emirates ID") != "true";

                                  if (hasMissingDocuments) {
                                    showSnackBar("Please upload all the certificates");
                                  } else if (!controller.isChecked.value) {
                                    showSnackBar("Please accept terms and conditions");
                                  } else {
                                    Get.toNamed(AppRoutes.bio)?.then((result) {
                                      if (result != null && result == true) {
                                        controller.showButton(true);
                                      }
                                    });
                                  }
                                }
                            ),
                          ).paddingOnly(bottom: 15, top: 5);
                        }
                        return const SizedBox
                            .shrink(); // Fallback in case index is out of bounds
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

