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
      appBar: myAppBar(
          title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Documents',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          context: context),
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
                future: CallAPI.getDocStatus(storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: Get.height * .7,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ).paddingOnly(top: 20),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.result == null) {
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
                  return SizedBox(
                      height: Get.height - 150,
                      child: ListView.builder(
                        itemCount: snapshot.data!.result!.length +
                            2, // Adjusted itemCount to include the additional widgets
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          if (index < snapshot.data!.result!.length) {
                            return index < snapshot.data!.result!.length &&
                                    snapshot.data!.result![index]
                                            .documentBackImg !=
                                        null &&
                                    snapshot.data!.result![index]
                                            .documentFrontImg !=
                                        null
                                //Certification
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot.data!.result![index]
                                                            .category ==
                                                        null
                                                    ? snapshot
                                                                .data!
                                                                .result![index]
                                                                .emirates ==
                                                            null
                                                        ? snapshot
                                                            .data!
                                                            .result![index]
                                                            .passport
                                                            .toString()
                                                            .toUpperCase()
                                                        : snapshot
                                                            .data!
                                                            .result![index]
                                                            .emirates
                                                            .toString()
                                                            .toUpperCase()
                                                    : snapshot
                                                        .data!
                                                        .result![index]
                                                        .category!
                                                        .name
                                                        .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color:
                                                            AppColors.yellow),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 22,
                                                    width: 52,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .approveStatus ==
                                                                "pending"
                                                            ? AppColors
                                                                .backgroundcolor2
                                                            : AppColors.black),
                                                    child: const Center(
                                                        child: Text('SAVED',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white))),
                                                  ).paddingOnly(
                                                      right: Get.width * 0.03),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.yellow,
                                                    radius: 11,
                                                    child: Image.asset(
                                                      ImagesPaths.tick,
                                                      color: AppColors.black,
                                                      width: 12,
                                                    ),
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
                                                child: SizedBox(
                                                  height: 131,
                                                  width: 204,
                                                  child: Image.network(
                                                      fit: BoxFit.cover,
                                                      snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .documentFrontImg ==
                                                              null
                                                          ? snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .passportfrontImg ==
                                                                  null
                                                              ? snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .emiratesfrontImg
                                                                  .toString()
                                                              : snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .passportfrontImg
                                                                  .toString()
                                                          : snapshot
                                                              .data!
                                                              .result![index]
                                                              .documentFrontImg
                                                              .toString()),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Institute  Name',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                  ).paddingOnly(bottom: 2),
                                                  Text(
                                                    snapshot
                                                                .data!
                                                                .result![index]
                                                                .category ==
                                                            null
                                                        ? snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .emirates ==
                                                                null
                                                            ? snapshot
                                                                .data!
                                                                .result![index]
                                                                .passportName
                                                                .toString()
                                                                .toUpperCase()
                                                            : snapshot
                                                                .data!
                                                                .result![index]
                                                                .emiratesName
                                                                .toString()
                                                                .toUpperCase()
                                                        : snapshot
                                                            .data!
                                                            .result![index]
                                                            .category!
                                                            .name
                                                            .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ).paddingOnly(bottom: 8),
                                                  Text(
                                                    'Certification Year',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                  ).paddingOnly(bottom: 2),
                                                  Text(
                                                    'john abc',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  snapshot.data!.result![index]
                                                              .approveStatus ==
                                                          "approved"
                                                      ? Container(
                                                          height: 22,
                                                          width: 64,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .yellow,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: const Center(
                                                              child: Text(
                                                                  'Approved',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .black))),
                                                        )
                                                      : snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .approveStatus ==
                                                              "pending"
                                                          ? Container(
                                                              height: 22,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .backgroundcolor2,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: const Center(
                                                                  child: Text(
                                                                      'Under verification',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              AppColors.whiteShade))),
                                                            )
                                                          : GestureDetector(
                                                              onTap: () {
                                                                uploadImage =
                                                                    UploadImage
                                                                        .byProfile;
                                                                Get.toNamed(
                                                                    AppRoutes
                                                                        .trainerPassport,
                                                                    arguments: {
                                                                      "userId": snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .userId
                                                                          .toString(),
                                                                      "categoryName":
                                                                          "",
                                                                      "categoryId": snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .category!
                                                                          .id
                                                                          .toString(),
                                                                      "certificateNumber":
                                                                          "",
                                                                      "certificateName":
                                                                          "",
                                                                    });
                                                              },
                                                              child: Container(
                                                                height: 22,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    color: AppColors
                                                                        .yellow,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                child: const Center(
                                                                    child: Text(
                                                                        'Resubmit Documents',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: AppColors.black))),
                                                              ),
                                                            )
                                                ],
                                              ).paddingOnly(
                                                  left: Get.width * 0.04)
                                            ],
                                          ),
                                          snapshot.data!.result![index]
                                                      .remark ==
                                                  null
                                              ? const Text("")
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Rejection Reason",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .white),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .result![index]
                                                          .remark!
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              fontSize: 10,
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
                                : index < snapshot.data!.result!.length &&
                                        snapshot.data!.result![index]
                                                .emiratesfrontImg !=
                                            null &&
                                        snapshot.data!.result![index]
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
                                                    snapshot
                                                                .data!
                                                                .result![index]
                                                                .category ==
                                                            null
                                                        ? snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .emirates ==
                                                                null
                                                            ? snapshot
                                                                .data!
                                                                .result![index]
                                                                .passport
                                                                .toString()
                                                                .toUpperCase()
                                                            : snapshot
                                                                .data!
                                                                .result![index]
                                                                .emirates
                                                                .toString()
                                                                .toUpperCase()
                                                        : snapshot
                                                            .data!
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
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 22,
                                                        width: 52,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .approveStatus ==
                                                                    "pending"
                                                                ? AppColors
                                                                    .backgroundcolor2
                                                                : AppColors
                                                                    .black),
                                                        child: const Center(
                                                            child: Text('SAVED',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white))),
                                                      ).paddingOnly(
                                                          right:
                                                              Get.width * 0.03),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            AppColors.yellow,
                                                        radius: 11,
                                                        child: Image.asset(
                                                          ImagesPaths.tick,
                                                          color:
                                                              AppColors.black,
                                                          width: 12,
                                                        ),
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
                                                    child: SizedBox(
                                                      height: 131,
                                                      width: 204,
                                                      child: Image.network(
                                                          fit: BoxFit.cover,
                                                          snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .documentFrontImg ==
                                                                  null
                                                              ? snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .passportfrontImg ==
                                                                      null
                                                                  ? snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .emiratesfrontImg
                                                                      .toString()
                                                                  : snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .passportfrontImg
                                                                      .toString()
                                                              : snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .documentFrontImg
                                                                  .toString()),
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
                                                        'Institute  Name',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium,
                                                      ).paddingOnly(bottom: 2),
                                                      Text(
                                                        snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .category ==
                                                                null
                                                            ? snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .emirates ==
                                                                    null
                                                                ? snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .passportName
                                                                    .toString()
                                                                    .toUpperCase()
                                                                : snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .emiratesName
                                                                    .toString()
                                                                    .toUpperCase()
                                                            : snapshot
                                                                .data!
                                                                .result![index]
                                                                .category!
                                                                .name
                                                                .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ).paddingOnly(bottom: 8),
                                                      Text(
                                                        'Certification Year',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium,
                                                      ).paddingOnly(bottom: 2),
                                                      Text(
                                                        'john abc',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.02,
                                                      ),
                                                      snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .approveStatus ==
                                                              "approved"
                                                          ? Container(
                                                              height: 22,
                                                              width: 64,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .yellow,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: const Center(
                                                                  child: Text(
                                                                      'Approved',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              AppColors.black))),
                                                            )
                                                          : snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .approveStatus ==
                                                                  "pending"
                                                              ? Container(
                                                                  height: 22,
                                                                  width: 100,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .backgroundcolor2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: const Center(
                                                                      child: Text(
                                                                          'Under verification',
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: AppColors.whiteShade))),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    uploadImage =
                                                                        UploadImage
                                                                            .byProfile;
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .trainerPassport,
                                                                        arguments: {
                                                                          "userId": snapshot
                                                                              .data!
                                                                              .result![index]
                                                                              .userId
                                                                              .toString(),
                                                                          "categoryName":
                                                                              "",
                                                                          "categoryId": snapshot
                                                                              .data!
                                                                              .result![index]
                                                                              .category!
                                                                              .id
                                                                              .toString(),
                                                                          "certificateNumber":
                                                                              "",
                                                                          "certificateName":
                                                                              "",
                                                                        });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 22,
                                                                    width: 120,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .yellow,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child: const Center(
                                                                        child: Text(
                                                                            'Resubmit Documents',
                                                                            style: TextStyle(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: AppColors.black))),
                                                                  ),
                                                                )
                                                    ],
                                                  ).paddingOnly(
                                                      left: Get.width * 0.04)
                                                ],
                                              ),
                                              snapshot.data!.result![index]
                                                          .remark ==
                                                      null
                                                  ? const Text("")
                                                  : Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Rejection Reason",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .white),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .result![index]
                                                              .remark!
                                                              .toString(),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  fontSize: 10,
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
                                    : index <
                                                snapshot.data!.result!.length &&
                                            snapshot.data!.result![index]
                                                    .passportfrontImg !=
                                                null &&
                                            snapshot.data!.result![index]
                                                    .passportbackImg !=
                                                null
                                        //Passport
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
                                                        snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .category ==
                                                                null
                                                            ? snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .emirates ==
                                                                    null
                                                                ? snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .passport
                                                                    .toString()
                                                                    .toUpperCase()
                                                                : snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .emirates
                                                                    .toString()
                                                                    .toUpperCase()
                                                            : snapshot
                                                                .data!
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
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 22,
                                                            width: 52,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: snapshot
                                                                            .data!
                                                                            .result![
                                                                                index]
                                                                            .approveStatus ==
                                                                        "pending"
                                                                    ? AppColors
                                                                        .backgroundcolor2
                                                                    : AppColors
                                                                        .black),
                                                            child: const Center(
                                                                child: Text(
                                                                    'SAVED',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10,
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .white))),
                                                          ).paddingOnly(
                                                              right: Get.width *
                                                                  0.03),
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                AppColors
                                                                    .yellow,
                                                            radius: 11,
                                                            child: Image.asset(
                                                              ImagesPaths.tick,
                                                              color: AppColors
                                                                  .black,
                                                              width: 12,
                                                            ),
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
                                                        child: SizedBox(
                                                          height: 131,
                                                          width: 204,
                                                          child: Image.network(
                                                              fit: BoxFit.cover,
                                                              snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .documentFrontImg ==
                                                                      null
                                                                  ? snapshot.data!.result![index].passportfrontImg ==
                                                                          null
                                                                      ? snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .emiratesfrontImg
                                                                          .toString()
                                                                      : snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .passportfrontImg
                                                                          .toString()
                                                                  : snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .documentFrontImg
                                                                      .toString()),
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
                                                            'Institute  Name',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ).paddingOnly(
                                                              bottom: 2),
                                                          Text(
                                                            snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .category ==
                                                                    null
                                                                ? snapshot
                                                                            .data!
                                                                            .result![
                                                                                index]
                                                                            .emirates ==
                                                                        null
                                                                    ? snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .passportName
                                                                        .toString()
                                                                        .toUpperCase()
                                                                    : snapshot
                                                                        .data!
                                                                        .result![
                                                                            index]
                                                                        .emiratesName
                                                                        .toString()
                                                                        .toUpperCase()
                                                                : snapshot
                                                                    .data!
                                                                    .result![
                                                                        index]
                                                                    .category!
                                                                    .name
                                                                    .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall,
                                                          ).paddingOnly(
                                                              bottom: 8),
                                                          Text(
                                                            'Certification Year',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium,
                                                          ).paddingOnly(
                                                              bottom: 2),
                                                          Text(
                                                            'john abc',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall,
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.02,
                                                          ),
                                                          snapshot
                                                                      .data!
                                                                      .result![
                                                                          index]
                                                                      .approveStatus ==
                                                                  "approved"
                                                              ? Container(
                                                                  height: 22,
                                                                  width: 64,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .yellow,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: const Center(
                                                                      child: Text(
                                                                          'Approved',
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: AppColors.black))),
                                                                )
                                                              : snapshot
                                                                          .data!
                                                                          .result![
                                                                              index]
                                                                          .approveStatus ==
                                                                      "pending"
                                                                  ? Container(
                                                                      height:
                                                                          22,
                                                                      width:
                                                                          100,
                                                                      decoration: BoxDecoration(
                                                                          color: AppColors
                                                                              .backgroundcolor2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                      child: const Center(
                                                                          child: Text(
                                                                              'Under verification',
                                                                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.whiteShade))),
                                                                    )
                                                                  : GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        uploadImage =
                                                                            UploadImage.byProfile;
                                                                        Get.toNamed(
                                                                            AppRoutes.trainerPassport,
                                                                            arguments: {
                                                                              "userId": snapshot.data!.result![index].userId.toString(),
                                                                              "categoryName": "",
                                                                              "categoryId": snapshot.data!.result![index].category!.id.toString(),
                                                                              "certificateNumber": "",
                                                                              "certificateName": "",
                                                                            });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            120,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.yellow,
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        child: const Center(
                                                                            child:
                                                                                Text('Resubmit Documents', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.black))),
                                                                      ),
                                                                    )
                                                        ],
                                                      ).paddingOnly(
                                                          left:
                                                              Get.width * 0.04)
                                                    ],
                                                  ),
                                                  snapshot.data!.result![index]
                                                              .remark ==
                                                          null
                                                      ? const Text("")
                                                      : Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
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
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .white),
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
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
                                        : InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              final userId = snapshot.data!.result![index].userId ?? "";
                                              final categoryId = snapshot.data!.result![index].category?.id ??
                                                  "";

                                              Get.toNamed(
                                                  AppRoutes.trainerPassport,
                                                  arguments: {
                                                    "userId": userId,
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
                                                        offset: const Offset(
                                                            -10, 2),
                                                        child: Container(
                                                          height:
                                                              Get.width * 0.14,
                                                          width:
                                                              Get.width * 0.14,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 17),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                          child: Image.asset(
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
                                                        color:
                                                            AppColors.impgrey,
                                                        size: 22,
                                                      ).paddingOnly(right: 15),
                                                    ],
                                                  ),
                                                ],
                                              ).paddingOnly(left: 0),
                                            ).paddingOnly(
                                                bottom: Get.height * 0.02),
                                          );
                          } else if (index == snapshot.data!.result!.length &&
                              storage.read("Emirates ID") != "true") {
                            return InkWell(
                              onTap: () {
                                uploadImage = UploadImage.byProfile;
                                Get.toNamed(AppRoutes.trainerPassport,
                                    arguments: {
                                      "userId":
                                          storage.read("userId").toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                        color:
                                                            AppColors.yellow),
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
                          } else if (index ==
                                  snapshot.data!.result!.length + 1 &&
                              storage.read("Passport") != "true") {
                            return InkWell(
                              onTap: () {
                                uploadImage = UploadImage.byProfile;
                                Get.toNamed(AppRoutes.trainerPassport,
                                    arguments: {
                                      "userId":
                                          storage.read("userId").toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                        color:
                                                            AppColors.yellow),
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

                          return const SizedBox
                              .shrink(); // Fallback in case index is out of bounds
                        },
                      )
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
