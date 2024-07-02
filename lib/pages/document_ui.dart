import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:endoorphin_trainer/controllers/document_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../services/network_services/api_call.dart';

class DocumentUI extends StatelessWidget {
  const DocumentUI({super.key});

  @override
  Widget build(BuildContext context) {
    DocumentController controller = Get.put(DocumentController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.black,
        elevation: 3,
        titleSpacing: -10,
        leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.bottomNavigation);
              // Get.back();
            },
            child: Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 18,
                ))),
        title: GestureDetector(
          onTap: () {
            // Get.offAllNamed(AppRoutes.bottomNavigation);
            Get.back();
          },
          child: Text(
            "Documents",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesPaths.bgBlackShade,
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () {
              return controller.onRefresh();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'Uploaded Documents',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ).paddingOnly(
                        bottom: Get.height * 0.03,
                        top: Get.height * 0.01,
                        left: 10)),
                FutureBuilder(

                  future:controller.onRefresh(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: Get.height * .7,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ).paddingOnly(top: 0),
                      );
                    }
                 else  if (snapshot.hasData || controller.trainerDocStatusModel.value.result!.isNotEmpty) {
                      controller.trainerDocStatusModel.value =
                          controller.trainerDocStatusModel.value;
                      return Obx(
                            () => SizedBox(
                            height: Get.height * .8,
                            child:
                            controller.trainerDocStatusModel.value.result!.isEmpty?SizedBox.shrink():
                            ListView.builder(
                                itemCount: controller
                                    .trainerDocStatusModel.value.result!.length,
                                reverse: false,
                                itemBuilder: (context, index) {
                                  return controller
                                      .trainerDocStatusModel
                                      .value
                                      .result![index]
                                      .documentBackImg !=
                                      null &&
                                      controller
                                          .trainerDocStatusModel
                                          .value
                                          .result![index]
                                          .documentFrontImg !=
                                          null
                                  //Certification
                                      ?
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.greyButton,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![index]
                                                    .category ==
                                                    null
                                                    ? controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .emirates ==
                                                    null
                                                    ? controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![index]
                                                    .passport
                                                    .toString()
                                                    .toUpperCase()
                                                    : controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![index]
                                                    .emirates
                                                    .toString()
                                                    .toUpperCase()
                                                    : controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![index]
                                                    .category!
                                                    .name
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                    color: AppColors
                                                        .yellow),
                                              ),

                                              //status----------------------------------------------------------------

                                              Row(
                                                children: [
                                                  controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![
                                                  index]
                                                      .approveStatus ==
                                                      "approved"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height: 22,
                                                        width: 64,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .Black3,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                5)),
                                                        child: const Center(
                                                            child: Text(
                                                                'Approved',
                                                                style: TextStyle(
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: Colors.green))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors
                                                            .yellow,
                                                        radius: 11,
                                                        child: Image
                                                            .asset(
                                                          ImagesPaths
                                                              .checktick,
                                                          width: 22,
                                                        ),
                                                      ).paddingOnly(
                                                          left: 10)
                                                    ],
                                                  )
                                                      : controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![
                                                  index]
                                                      .approveStatus ==
                                                      "pending"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width:
                                                        100,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .Black3,
                                                            borderRadius:
                                                            BorderRadius.circular(5)),
                                                        child: const Center(
                                                            child: Text(
                                                                'Under verification',
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.yellow))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors
                                                            .yellow,
                                                        radius:
                                                        11,
                                                        child: Image
                                                            .asset(
                                                          ImagesPaths
                                                              .check,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                      : Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width: 64,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .Black3,
                                                            borderRadius:
                                                            BorderRadius.circular(5)),
                                                        child: const Center(
                                                            child: Text(
                                                                'Rejected',
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.red))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors
                                                            .yellow,
                                                        radius:
                                                        11,
                                                        child: Image
                                                            .asset(
                                                          ImagesPaths
                                                              .checkcross,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ).paddingOnly(
                                              bottom: Get.height * 0.01),
                                          Container(
                                            height: 1,
                                            width: Get.width,
                                            color: AppColors.lightyGrey,
                                          ).paddingOnly(
                                              bottom: Get.height * 0.02),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Obx(
                                                      ()=> SizedBox(
                                                    height: 131,
                                                    width: 204,
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.contain,
                                                      // imageUrl: controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .documentFrontImg ==
                                                      //         null
                                                      //     ? controller
                                                      //                 .trainerDocStatusModel
                                                      //                 .value
                                                      //                 .result![
                                                      //                     index]
                                                      //                 .passportfrontImg ==
                                                      //             null
                                                      //         ? controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .emiratesfrontImg
                                                      //             .toString()
                                                      //         : controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .passportfrontImg
                                                      //             .toString()
                                                      //     : controller
                                                      //         .trainerDocStatusModel
                                                      //         .value
                                                      //         .result![index]
                                                      //         .documentFrontImg
                                                      //         .toString(),
                                                      imageUrl: controller
                                                          .isFrontImageVisible1
                                                          .value?controller.trainerDocStatusModel.value.result![index].documentFrontImg!:controller.trainerDocStatusModel.value.result![index].documentBackImg!,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                          downloadProgress) =>
                                                          Center(
                                                            child: SizedBox(
                                                              height: 30,
                                                              // Adjust the height to make it smaller
                                                              width: 30,
                                                              // Adjust the width to make it smaller
                                                              child: CircularProgressIndicator(
                                                                  value: downloadProgress
                                                                      .progress),
                                                            ),
                                                          ),
                                                      errorWidget: (context,
                                                          url, error) =>
                                                      const Icon(
                                                          Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Certification Name',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(bottom: 2),
                                                  Container(
                                                    width: 120,
                                                    child: Text(
                                                      controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![index]
                                                          .categoryName
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                    ).paddingOnly(bottom: 8),
                                                  ),
                                                  Text(
                                                    'Certification Number',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(bottom: 2),
                                                  Text(
                                                    controller
                                                        .trainerDocStatusModel
                                                        .value
                                                        .result![index]
                                                        .categoryNumber
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    Get.height * 0.02,
                                                  ),
                                                  Obx(
                                                        () => Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                                color: controller.isFrontImageVisible1.value !=
                                                                    false
                                                                    ? AppColors
                                                                    .yellow
                                                                    : Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  -1,
                                                                  0),
                                                              child: Image
                                                                  .asset(
                                                                ImagesPaths
                                                                    .arrowback,
                                                                scale: 7,
                                                                color: controller.isFrontImageVisible1.value !=
                                                                    false
                                                                    ? AppColors
                                                                    .black
                                                                    : AppColors
                                                                    .yellow,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              right: 10),
                                                        ),
                                                        Container(
                                                          height:
                                                          Get.height *
                                                              0.025,
                                                          width: Get.width *
                                                              0.12,
                                                          alignment:
                                                          Alignment
                                                              .topCenter,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .grey),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10)),
                                                          child: Text(
                                                            controller
                                                                .isFrontImageVisible1
                                                                .value
                                                                ? 'Front'
                                                                : 'Back',
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .titleMedium,
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                          ),
                                                        ).paddingOnly(
                                                            left: 1,
                                                            right: 1),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .isFrontImageVisible1
                                                                .value = false;
                                                          },
                                                          child: Container(
                                                            height: 22,
                                                            width: 22,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .yellow),
                                                                color: controller.isFrontImageVisible1.value ==
                                                                    false
                                                                    ? AppColors
                                                                    .yellow
                                                                    : Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  1, 0),
                                                              child: Image
                                                                  .asset(
                                                                ImagesPaths
                                                                    .arrowforword,
                                                                scale: 7,
                                                                color: controller.isFrontImageVisible1.value !=
                                                                    false
                                                                    ? AppColors
                                                                    .yellow
                                                                    : AppColors
                                                                    .black,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              left: 10),
                                                        ),
                                                      ],
                                                    ).paddingOnly(
                                                      top: 7,
                                                      left: 5,
                                                    ),
                                                  )
                                                ],
                                              ).paddingOnly(
                                                  left: Get.width * 0.04)
                                            ],
                                          ),
                                          controller
                                              .trainerDocStatusModel
                                              .value
                                              .result![index]
                                              .remark ==
                                              null
                                              ? const Text("")
                                              : Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Rejection Reason",
                                                        style: Theme.of(
                                                            context)
                                                            .textTheme
                                                            .labelSmall!
                                                            .copyWith(
                                                            fontSize:
                                                            12,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color:
                                                            AppColors.white),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          final userId = controller
                                                              .trainerDocStatusModel
                                                              .value
                                                              .result![index]
                                                              .userId ??
                                                              "";
                                                          final categoryId = controller
                                                              .trainerDocStatusModel
                                                              .value
                                                              .result![index]
                                                              .category
                                                              ?.id ??
                                                              "";
                                                          uploadImage =
                                                              UploadImage
                                                                  .byProfile;
                                                          Get.toNamed(
                                                              AppRoutes
                                                                  .trainerPassport,
                                                              arguments: {
                                                                "userId":
                                                                userId,
                                                                "name":
                                                                controller.trainerDocStatusModel.value?.result?[index].category?.name.toString() ?? "",
                                                                "categoryName":
                                                                controller.trainerDocStatusModel.value?.result?[index].passport.toString() ?? "",
                                                                "categoryId":
                                                                categoryId,
                                                                "id": controller
                                                                    .trainerDocStatusModel
                                                                    .value
                                                                    .result![index]
                                                                    .id
                                                                    .toString(),
                                                                "reupload":
                                                                true,
                                                              });
                                                        },
                                                        child:
                                                        Container(
                                                          height: 24,
                                                          width: 85,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  30),
                                                              border: Border.all(
                                                                  color:
                                                                  AppColors.yellow)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                'Reupload ',
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .labelSmall!
                                                                    .copyWith(color: AppColors.yellow),
                                                              ),
                                                              Image
                                                                  .asset(
                                                                ImagesPaths
                                                                    .upload2,
                                                                color:
                                                                AppColors.yellow,
                                                                scale:
                                                                8,
                                                              )
                                                            ],
                                                          ),
                                                        ).paddingOnly(
                                                            left:
                                                            20),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    controller
                                                        .trainerDocStatusModel
                                                        .value
                                                        .result![
                                                    index]
                                                        .remark!
                                                        .toString(),
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                        fontSize:
                                                        10,
                                                        color: AppColors
                                                            .whiteShade),
                                                  ),
                                                  Text(
                                                    controller
                                                        .trainerDocStatusModel
                                                        .value
                                                        .result![
                                                    index]
                                                        .comment!
                                                        .toString(),
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                        fontSize:
                                                        10,
                                                        color: AppColors
                                                            .whiteShade),
                                                  ),
                                                ],
                                              ).paddingOnly(
                                                  top: 5, right: 4)
                                        ],
                                      ).paddingOnly(
                                          bottom: 5,
                                          top: 15,
                                          right: 15,
                                          left: 15),
                                    ),
                                  )
                                      : controller
                                      .trainerDocStatusModel
                                      .value
                                      .result![index]
                                      .emiratesfrontImg !=
                                      null &&
                                      controller
                                          .trainerDocStatusModel
                                          .value
                                          .result![index]
                                          .emiratesbackImg !=
                                          null

                                  //Emirates Id
                                      ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.greyButton,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                "EMIRATES ID",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                    color: AppColors
                                                        .yellow),
                                              ),
                                              Row(
                                                children: [
                                                  controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![
                                                  index]
                                                      .approveStatus ==
                                                      "approved"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width: 64,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .Black3,
                                                            borderRadius:
                                                            BorderRadius.circular(5)),
                                                        child: const Center(
                                                            child: Text(
                                                                'Approved',
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.green))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors
                                                            .yellow,
                                                        radius:
                                                        11,
                                                        child: Image
                                                            .asset(
                                                          ImagesPaths
                                                              .checktick,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                      : controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![
                                                  index]
                                                      .approveStatus ==
                                                      "pending"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width:
                                                        100,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.Black3,
                                                            borderRadius: BorderRadius.circular(5)),
                                                        child:
                                                        const Center(child: Text('Under verification', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.yellow))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors.yellow,
                                                        radius:
                                                        11,
                                                        child:
                                                        Image.asset(
                                                          ImagesPaths.check,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                      : Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width:
                                                        64,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.Black3,
                                                            borderRadius: BorderRadius.circular(5)),
                                                        child:
                                                        const Center(child: Text('Rejected', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.red))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors.yellow,
                                                        radius:
                                                        11,
                                                        child:
                                                        Image.asset(
                                                          ImagesPaths.checkcross,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ).paddingOnly(
                                              bottom:
                                              Get.height * 0.01),
                                          Container(
                                            height: 1,
                                            width: Get.width,
                                            color: AppColors.lightyGrey,
                                          ).paddingOnly(
                                              bottom:
                                              Get.height * 0.02),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Obx(
                                                      ()=> SizedBox(
                                                    height: 131,
                                                    width: 204,
                                                    child:
                                                    CachedNetworkImage(
                                                      fit: BoxFit.contain,
                                                      // imageUrl: controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .documentFrontImg ==
                                                      //         null
                                                      //     ? controller
                                                      //                 .trainerDocStatusModel
                                                      //                 .value
                                                      //                 .result![
                                                      //                     index]
                                                      //                 .passportfrontImg ==
                                                      //             null
                                                      //         ? controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .emiratesfrontImg
                                                      //             .toString()
                                                      //         : controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .passportfrontImg
                                                      //             .toString()
                                                      //     : controller
                                                      //         .trainerDocStatusModel
                                                      //         .value
                                                      //         .result![
                                                      //             index]
                                                      //         .documentFrontImg
                                                      //         .toString(),
                                                      imageUrl: controller
                                                          .isFrontImageVisible2
                                                          .value?controller.trainerDocStatusModel.value.result![index].emiratesfrontImg!:controller.trainerDocStatusModel.value.result![index].emiratesbackImg!,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                          downloadProgress) =>
                                                          Center(
                                                            child: SizedBox(
                                                              height: 30,
                                                              // Adjust the height to make it smaller
                                                              width: 30,
                                                              // Adjust the width to make it smaller
                                                              child: CircularProgressIndicator(
                                                                  value: downloadProgress
                                                                      .progress),
                                                            ),
                                                          ),
                                                      errorWidget:
                                                          (context, url,
                                                          error) =>
                                                      const Icon(Icons
                                                          .error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    'Emirates ID Name',
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(
                                                      bottom: 2),
                                                  Container(
                                                    width: 120,
                                                    child: Text(
                                                      controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![index]
                                                          .emiratesName
                                                          .toString(),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                    ).paddingOnly(
                                                        bottom: 8),
                                                  ),
                                                  Text(
                                                    'Emirates ID Number',
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(
                                                      bottom: 2),
                                                  Text(
                                                    controller
                                                        .trainerDocStatusModel
                                                        .value
                                                        .result![index]
                                                        .emiratesNumber
                                                        .toString(),
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height *
                                                        0.02,
                                                  ),
                                                  Obx(
                                                        () => Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .isFrontImageVisible2
                                                                .value = true;
                                                          },
                                                          child:
                                                          Container(
                                                            height: 22,
                                                            width: 22,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .yellow),
                                                                color: controller.isFrontImageVisible2.value !=
                                                                    false
                                                                    ? AppColors
                                                                    .yellow
                                                                    : Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  -1,
                                                                  0),
                                                              child: Image
                                                                  .asset(
                                                                ImagesPaths
                                                                    .arrowback,
                                                                scale:
                                                                7,
                                                                color: controller.isFrontImageVisible2.value !=
                                                                    false
                                                                    ? AppColors.black
                                                                    : AppColors.yellow,
                                                                alignment:
                                                                Alignment.center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              right:
                                                              10),
                                                        ),
                                                        Container(
                                                          height:
                                                          Get.height *
                                                              0.025,
                                                          width:
                                                          Get.width *
                                                              0.12,
                                                          alignment:
                                                          Alignment
                                                              .topCenter,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .grey),
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                          child: Text(
                                                            controller
                                                                .isFrontImageVisible2
                                                                .value
                                                                ? 'Front'
                                                                : 'Back',
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .titleMedium,
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                          ),
                                                        ).paddingOnly(
                                                            left: 1,
                                                            right: 1),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .isFrontImageVisible2
                                                                .value = false;
                                                          },
                                                          child:
                                                          Container(
                                                            height: 22,
                                                            width: 22,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .yellow),
                                                                color: controller.isFrontImageVisible2.value ==
                                                                    false
                                                                    ? AppColors
                                                                    .yellow
                                                                    : Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  1,
                                                                  0),
                                                              child: Image
                                                                  .asset(
                                                                ImagesPaths
                                                                    .arrowforword,
                                                                scale:
                                                                7,
                                                                color: controller.isFrontImageVisible2.value !=
                                                                    false
                                                                    ? AppColors.yellow
                                                                    : AppColors.black,
                                                                alignment:
                                                                Alignment.center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              left:
                                                              10),
                                                        ),
                                                      ],
                                                    ).paddingOnly(
                                                      top: 7,
                                                      left: 5,
                                                    ),
                                                  )
                                                ],
                                              ).paddingOnly(
                                                  left:
                                                  Get.width * 0.04)
                                            ],
                                          ),
                                          controller
                                              .trainerDocStatusModel
                                              .value
                                              .result![index]
                                              .remark ==
                                              null
                                              ? const Text("")
                                              : Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rejection Reason",
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                        fontSize:
                                                        12,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        color:
                                                        AppColors.white),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      final userId = controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![index]
                                                          .userId ??
                                                          "";
                                                      final categoryId = controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![index]
                                                          .category
                                                          ?.id ??
                                                          "";
                                                      uploadImage =
                                                          UploadImage
                                                              .byProfile;
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .trainerPassport,
                                                          arguments: {
                                                            "userId":
                                                            userId,
                                                            "name":
                                                            controller.trainerDocStatusModel.value?.result?[index].category?.name.toString() ?? "",
                                                            "categoryName":
                                                            controller.trainerDocStatusModel.value?.result?[index].passport.toString() ?? "",
                                                            "categoryId":
                                                            categoryId,
                                                            "id": controller
                                                                .trainerDocStatusModel
                                                                .value
                                                                .result![index]
                                                                .id
                                                                .toString(),
                                                            "reupload":
                                                            true,
                                                          });
                                                    },
                                                    child:
                                                    Container(
                                                      height: 24,
                                                      width: 85,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                          border: Border.all(
                                                              color:
                                                              AppColors.yellow)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Reupload ',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .labelSmall!
                                                                .copyWith(color: AppColors.yellow),
                                                          ),
                                                          Image
                                                              .asset(
                                                            ImagesPaths
                                                                .upload2,
                                                            color:
                                                            AppColors.yellow,
                                                            scale:
                                                            8,
                                                          ).paddingOnly(left: 5)
                                                        ],
                                                      ).paddingAll(2),
                                                    ).paddingOnly(
                                                        left:
                                                        20),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .remark!
                                                    .toString(),
                                                style: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                    fontSize:
                                                    10,
                                                    color: AppColors
                                                        .whiteShade),
                                              ),
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .comment!
                                                    .toString(),
                                                style: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                    fontSize:
                                                    10,
                                                    color: AppColors
                                                        .whiteShade),
                                              ),
                                            ],
                                          ).paddingOnly(top: 5)
                                        ],
                                      ).paddingOnly(
                                          bottom: 5,
                                          top: 15,
                                          right: 15,
                                          left: 15),
                                    ),
                                  )
                                      : controller
                                      .trainerDocStatusModel
                                      .value
                                      .result![index]
                                      .passportfrontImg !=
                                      null &&
                                      controller
                                          .trainerDocStatusModel
                                          .value
                                          .result![index]
                                          .passportbackImg !=
                                          null
                                  //Passport
                                      ? Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color:
                                          AppColors.greyButton,
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .category ==
                                                    null
                                                    ? controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .emirates ==
                                                    null
                                                    ? controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .passport
                                                    .toString()
                                                    .toUpperCase()
                                                    : controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .emirates
                                                    .toString()
                                                    .toUpperCase()
                                                    : controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .category!
                                                    .name
                                                    .toString(),
                                                style: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                    color: AppColors
                                                        .yellow),
                                              ),
                                              Row(
                                                children: [
                                                  controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![
                                                  index]
                                                      .approveStatus ==
                                                      "approved"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height:
                                                        22,
                                                        width:
                                                        64,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.Black3,
                                                            borderRadius: BorderRadius.circular(5)),
                                                        child:
                                                        const Center(child: Text('Approved', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.green))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        AppColors.yellow,
                                                        radius:
                                                        11,
                                                        child:
                                                        Image.asset(
                                                          ImagesPaths.checktick,
                                                          width:
                                                          22,
                                                        ),
                                                      ).paddingOnly(
                                                          left:
                                                          10)
                                                    ],
                                                  )
                                                      : controller
                                                      .trainerDocStatusModel
                                                      .value
                                                      .result![index]
                                                      .approveStatus ==
                                                      "pending"
                                                      ? Row(
                                                    children: [
                                                      Container(
                                                        height: 22,
                                                        width: 100,
                                                        decoration: BoxDecoration(color: AppColors.Black3, borderRadius: BorderRadius.circular(5)),
                                                        child: const Center(child: Text('Under verification', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.yellow))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor: AppColors.yellow,
                                                        radius: 11,
                                                        child: Image.asset(
                                                          ImagesPaths.check,
                                                          width: 22,
                                                        ),
                                                      ).paddingOnly(left: 10)
                                                    ],
                                                  )
                                                      : Row(
                                                    children: [
                                                      Container(
                                                        height: 22,
                                                        width: 64,
                                                        decoration: BoxDecoration(color: AppColors.Black3, borderRadius: BorderRadius.circular(5)),
                                                        child: const Center(child: Text('Rejected', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.red))),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor: AppColors.yellow,
                                                        radius: 11,
                                                        child: Image.asset(
                                                          ImagesPaths.checkcross,
                                                          width: 22,
                                                        ),
                                                      ).paddingOnly(left: 10)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ).paddingOnly(
                                              bottom: Get.height *
                                                  0.01),
                                          Container(
                                            height: 1,
                                            width: Get.width,
                                            color: AppColors
                                                .lightyGrey,
                                          ).paddingOnly(
                                              bottom: Get.height *
                                                  0.02),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Obx(
                                                      ()=> SizedBox(
                                                    height: 131,
                                                    width: 204,
                                                    child:
                                                    CachedNetworkImage(
                                                      fit: BoxFit
                                                          .contain,
                                                      // imageUrl: controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .documentFrontImg ==
                                                      //         null
                                                      //     ? controller.trainerDocStatusModel.value.result![index].passportfrontImg ==
                                                      //             null
                                                      //         ? controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .emiratesfrontImg
                                                      //             .toString()
                                                      //         : controller
                                                      //             .trainerDocStatusModel
                                                      //             .value
                                                      //             .result![
                                                      //                 index]
                                                      //             .passportfrontImg
                                                      //             .toString()
                                                      //     : controller
                                                      //         .trainerDocStatusModel
                                                      //         .value
                                                      //         .result![
                                                      //             index]
                                                      //         .documentFrontImg
                                                      //         .toString(),
                                                      imageUrl: controller
                                                          .isFrontImageVisible
                                                          .value?controller.trainerDocStatusModel.value.result![index].passportfrontImg!:controller.trainerDocStatusModel.value.result![index].passportbackImg!,
                                                      progressIndicatorBuilder:
                                                          (context,
                                                          url,
                                                          downloadProgress) =>
                                                          Center(
                                                            child:
                                                            SizedBox(
                                                              height: 30,
                                                              // Adjust the height to make it smaller
                                                              width: 30,
                                                              // Adjust the width to make it smaller
                                                              child: CircularProgressIndicator(
                                                                  value: downloadProgress
                                                                      .progress),
                                                            ),
                                                          ),
                                                      errorWidget: (context,
                                                          url,
                                                          error) =>
                                                          Icon(Icons
                                                              .error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    'Passport Name',
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(
                                                      bottom: 2),
                                                  Container(
                                                    width: 120,
                                                    child: Text(
                                                      controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![
                                                      index]
                                                          .passportName
                                                          .toString(),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                    ).paddingOnly(
                                                        bottom: 8),
                                                  ),
                                                  Text(
                                                    'Passport Number',
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelMedium!.copyWith(color: Colors.white),
                                                  ).paddingOnly(
                                                      bottom: 2),
                                                  Text(
                                                    controller
                                                        .trainerDocStatusModel
                                                        .value
                                                        .result![
                                                    index]
                                                        .passportNumber
                                                        .toString(),
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!.copyWith(color: AppColors.lightGrey),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    Get.height *
                                                        0.02,
                                                  ),
                                                  Obx(
                                                        () => Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap:
                                                              () {
                                                            log("message1");
                                                            controller
                                                                .isFrontImageVisible
                                                                .value = true;
                                                          },
                                                          child:
                                                          Container(
                                                            height:
                                                            22,
                                                            width:
                                                            22,
                                                            decoration: BoxDecoration(
                                                                border:
                                                                Border.all(color: AppColors.yellow),
                                                                color: controller.isFrontImageVisible.value != false ? AppColors.yellow : Colors.transparent,
                                                                shape: BoxShape.circle),
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  -1,
                                                                  0),
                                                              child:
                                                              Image.asset(
                                                                ImagesPaths.arrowback,
                                                                scale:
                                                                7,
                                                                color: controller.isFrontImageVisible.value != false
                                                                    ? AppColors.black
                                                                    : AppColors.yellow,
                                                                alignment:
                                                                Alignment.center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              right: 10),
                                                        ),
                                                        Container(
                                                          height: Get
                                                              .height *
                                                              0.025,
                                                          width: Get
                                                              .width *
                                                              0.12,
                                                          alignment:
                                                          Alignment
                                                              .topCenter,
                                                          decoration: BoxDecoration(
                                                              border:
                                                              Border.all(color: AppColors.grey),
                                                              borderRadius: BorderRadius.circular(10)),
                                                          child:
                                                          Text(
                                                            controller.isFrontImageVisible.value
                                                                ? 'Front'
                                                                : 'Back',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleMedium,
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                        ).paddingOnly(
                                                            left: 1,
                                                            right:
                                                            1),
                                                        InkWell(
                                                          onTap:
                                                              () {
                                                            log("message2");

                                                            controller
                                                                .isFrontImageVisible
                                                                .value = false;
                                                          },
                                                          child:
                                                          Container(
                                                            height:
                                                            22,
                                                            width:
                                                            22,
                                                            decoration: BoxDecoration(
                                                                border:
                                                                Border.all(color: AppColors.yellow),
                                                                color: controller.isFrontImageVisible.value == false ? AppColors.yellow : Colors.transparent,
                                                                shape: BoxShape.circle),
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  1,
                                                                  0),
                                                              child:
                                                              Image.asset(
                                                                ImagesPaths.arrowforword,
                                                                scale:
                                                                7,
                                                                color: controller.isFrontImageVisible.value != false
                                                                    ? AppColors.yellow
                                                                    : AppColors.black,
                                                                alignment:
                                                                Alignment.center,
                                                              ),
                                                            ),
                                                          ).paddingOnly(
                                                              left: 10),
                                                        ),
                                                      ],
                                                    ).paddingOnly(
                                                      top: 7,
                                                      left: 5,
                                                    ),
                                                  )
                                                ],
                                              ).paddingOnly(
                                                  left: Get.width *
                                                      0.04)
                                            ],
                                          ),
                                          controller
                                              .trainerDocStatusModel
                                              .value
                                              .result![
                                          index]
                                              .remark ==
                                              null
                                              ? const Text("")
                                              : Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rejection Reason",
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColors.white),
                                                  ),
                                                  GestureDetector(
                                                    onTap:
                                                        () {
                                                      final userId =
                                                          controller.trainerDocStatusModel.value.result![index].userId ??
                                                              "";
                                                      final categoryId =
                                                          controller.trainerDocStatusModel.value.result![index].category?.id ??
                                                              "";
                                                      uploadImage =
                                                          UploadImage.byProfile;
                                                      Get.toNamed(
                                                          AppRoutes.trainerPassport,
                                                          arguments: {
                                                            "userId": userId,
                                                            "name": controller.trainerDocStatusModel.value?.result?[index].category?.name.toString() ?? "",
                                                            "categoryName": controller.trainerDocStatusModel.value?.result?[index].passport.toString() ?? "",
                                                            "categoryId": categoryId,
                                                            "id": controller.trainerDocStatusModel.value.result![index].id.toString(),
                                                            "reupload": true,
                                                          });
                                                    },
                                                    child:
                                                    Container(
                                                      height:
                                                      24,
                                                      width:
                                                      85,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(30),
                                                          border: Border.all(color: AppColors.yellow)),
                                                      child:
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(
                                                            'Reupload ',
                                                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.yellow),
                                                          ),
                                                          Image.asset(
                                                            ImagesPaths.upload2,
                                                            color: AppColors.yellow,
                                                            scale: 8,
                                                          )
                                                        ],
                                                      ),
                                                    ).paddingOnly(
                                                        left: 20),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .remark!
                                                    .toString(),
                                                style: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                    fontSize:
                                                    10,
                                                    color:
                                                    AppColors.whiteShade),
                                              ),
                                              Text(
                                                controller
                                                    .trainerDocStatusModel
                                                    .value
                                                    .result![
                                                index]
                                                    .comment!
                                                    .toString(),
                                                style: Theme.of(
                                                    context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                    fontSize:
                                                    10,
                                                    color:
                                                    AppColors.whiteShade),
                                              ),
                                            ],
                                          ).paddingOnly(
                                              top: 5)
                                        ],
                                      ).paddingOnly(
                                          bottom: 5,
                                          top: 15,
                                          right: 15,
                                          left: 15),
                                    ),
                                  )
                                      : InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      final userId = controller
                                          .trainerDocStatusModel
                                          .value
                                          .result![index]
                                          .userId ??
                                          "";
                                      final categoryId = controller
                                          .trainerDocStatusModel
                                          .value
                                          .result![index]
                                          .category
                                          ?.id ??
                                          "";
                                      uploadImage =
                                          UploadImage.byProfile;
                                      Get.toNamed(
                                          AppRoutes.trainerPassport,
                                          arguments: {
                                            "userId": userId,
                                            "name": controller
                                                .trainerDocStatusModel
                                                .value
                                                .result?[index]
                                                .category
                                                ?.name
                                                .toString() ??
                                                "",
                                            "categoryName": controller
                                                .trainerDocStatusModel
                                                .value
                                                .result?[index]
                                                .passport
                                                .toString() ??
                                                "",
                                            "categoryId":
                                            categoryId,
                                            "id": controller
                                                .trainerDocStatusModel
                                                .value
                                                .result![index]
                                                .id
                                                .toString()
                                          });
                                    },
                                    child: Container(
                                      height: 70,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.greyButton,
                                        borderRadius:
                                        BorderRadius.circular(
                                            5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              Transform.translate(
                                                offset:
                                                const Offset(
                                                    -10, 2),
                                                child: Container(
                                                  height:
                                                  Get.width *
                                                      0.14,
                                                  width: Get.width *
                                                      0.14,
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      15,
                                                      vertical:
                                                      17),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5),
                                                    color: AppColors
                                                        .black,
                                                  ),
                                                  child:
                                                  Image.asset(
                                                    ImagesPaths
                                                        .document,
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
                                                    Get.width *
                                                        .55,
                                                    child: Text(
                                                      controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![
                                                      index]
                                                          .category ==
                                                          null
                                                          ? controller
                                                          .trainerDocStatusModel
                                                          .value
                                                          .result![
                                                      index]
                                                          .passport == "passport"?
                                                          "Passport":"Emirates ID"

                                                          : controller
                                                          .trainerDocStatusModel
                                                          .value
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
                                                          color:
                                                          AppColors.yellow),
                                                    ).paddingOnly(
                                                        top: 12),
                                                  ),
                                                  Text(
                                                    "Upload your Certification ...",
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .labelSmall
                                                        ?.copyWith(
                                                        fontSize:
                                                        12),
                                                  ).paddingOnly(
                                                      top: 10),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColors
                                                    .impgrey,
                                                size: 22,
                                              ).paddingOnly(
                                                  right: 15),
                                            ],
                                          ),
                                        ],
                                      ).paddingOnly(left: 0),
                                    ).paddingOnly(
                                        top: Get.height * 0.008,
                                        bottom: Get.height * 0.008,
                                        left: Get.width * 0.02,
                                        right: Get.width * 0.02),
                                  );
                                }
                            ),
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
                   return SizedBox.shrink();
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
