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
            offset: Offset(-Get.width * 0.09, -3),
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
            onPressed: () {
              Get.offAllNamed(AppRoutes.bio);
            },
            icon: Container(
              alignment: Alignment.center,
              height: 24,
              width: 44,
              decoration: const BoxDecoration(
                  color: AppColors.greyButton,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.yellow, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.04,
          )
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
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.whiteShade2),
                            ).paddingOnly(top: 2),
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
                    return ListView.builder(
                      itemCount: snapshot.data!.result!
                          .length, // Adjusted itemCount to include the additional widgets
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return snapshot.data!.result![index].documentFrontImg !=
                                    null ||
                                snapshot.data!.result![index].documentBackImg !=
                                    null
                            ?
                            //Certification
                            Obx(
                                () =>CertificateCard(
                                  categoryMainName: snapshot.data!.result![index].category!.name!.toUpperCase(),
                                  categoryName: snapshot.data!.result![index]!.categoryName.toString(),
                                  categoryNumber: snapshot.data!.result![index]!.categoryNumber.toString(),
                                  documentFrontImg: snapshot.data!.result![index]!.documentFrontImg,
                                  documentBackImg: snapshot.data!.result![index]!.documentBackImg,
                                  isFrontImageVisible: controller.isFrontImageVisible2.value,
                                  onFrontImageTap: () {
                                    controller.isFrontImageVisible2.value = true;
                                  },
                                  onBackImageTap: () {
                                    controller.isFrontImageVisible2.value = false;
                                  },
                                ),
                            )
                            : snapshot.data!.result![index].passportbackImg !=
                                        null ||
                                    snapshot.data!.result![index]
                                            .passportfrontImg !=
                                        null
                                ?
                                //Passport
                        Obx(
                              () =>CertificateCard(
                            categoryMainName: "PASSPORT",
                            categoryName: snapshot.data!.result![index]!.passportName.toString(),
                            categoryNumber: snapshot.data!.result![index]!.passportNumber.toString(),
                            documentFrontImg: snapshot.data!.result![index]!.passportfrontImg.toString(),
                            documentBackImg: snapshot.data!.result![index]!.passportbackImg.toString(),
                            isFrontImageVisible: controller.isFrontImageVisible.value,
                            onFrontImageTap: () {
                              controller.isFrontImageVisible.value = true;
                            },
                            onBackImageTap: () {
                              controller.isFrontImageVisible.value = false;
                            },
                          ),
                        )
                                : snapshot.data!.result![index]
                                                .emiratesfrontImg !=
                                            null ||
                                        snapshot.data!.result![index]
                                                .emiratesbackImg !=
                                            null
                                    ?
                                    //Emirates Id
                        Obx(
                              () =>CertificateCard(
                            categoryMainName: "EMIRATES ID",
                            categoryName: snapshot.data!.result![index]!.emiratesName.toString(),
                            categoryNumber: snapshot.data!.result![index]!.emiratesNumber.toString(),
                            documentFrontImg: snapshot.data!.result![index]!.emiratesfrontImg.toString(),
                            documentBackImg: snapshot.data!.result![index]!.emiratesfrontImg.toString(),
                            isFrontImageVisible: controller.isFrontImageVisible1.value,
                            onFrontImageTap: () {
                              controller.isFrontImageVisible1.value = true;
                            },
                            onBackImageTap: () {
                              controller.isFrontImageVisible1.value = false;
                            },
                          ),
                        )
                                    :
                        InkWell(
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
                                          uploadImage =
                                              UploadImage.byInitically;
                                          Get.toNamed(AppRoutes.trainerPassport,
                                              arguments: {
                                                "userId": userId,
                                                "name": snapshot
                                                        .data
                                                        ?.result?[index]
                                                        .category
                                                        ?.name
                                                        .toString() ??
                                                    "",
                                                "categoryName": snapshot
                                                        .data
                                                        ?.result?[index]
                                                        .passport
                                                        .toString() ??
                                                    "",
                                                "categoryId": categoryId,
                                                "id": snapshot
                                                    .data!.result![index].id
                                                    .toString()
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Transform.translate(
                                                    offset:
                                                        const Offset(-10, 2),
                                                    child: Container(
                                                      height: Get.width * 0.14,
                                                      width: Get.width * 0.14,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15,
                                                          vertical: 17),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: AppColors.black,
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
                                                        width: Get.width * .55,
                                                        child: Text(
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
                                                                          .passport
                                                                          .toString() ==
                                                                      "emirates"
                                                                  ? "Emirates ID"
                                                                  : "Passport"
                                                              : snapshot
                                                                  .data!
                                                                  .result![
                                                                      index]
                                                                  .category!
                                                                  .name
                                                                  .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                                  color: AppColors
                                                                      .yellow),
                                                        ).paddingOnly(top: 12),
                                                      ),
                                                      Text(
                                                        "Upload your Certification ...",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall
                                                            ?.copyWith(
                                                                fontSize: 12),
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
                                                    color: AppColors.grey4,
                                                    size: 20,
                                                  ).paddingOnly(right: 15),
                                                ],
                                              ),
                                            ],
                                          ).paddingOnly(left: 0),
                                        ).paddingOnly(
                                            bottom: Get.height * 0.02),
                                      );
                      },
                    );
                  },
                ),
                Obx(
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
                              log(controller.isChecked.value.toString());
                            },
                          ),
                          const Text('I accept the terms and conditions',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('view all',
                              style: TextStyle(
                                  color: AppColors.whiteShade, fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkButton(
                      child: Text(
                        'Continue',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                ),
                      ),
                      onTap: () {
                        bool hasMissingDocuments =
                            storage.read("Passport") != "true" ||
                                storage.read("Emirates ID") != "true";

                        if (hasMissingDocuments) {
                          showSnackBar("Please upload all the documents");
                        } else if (!controller.isChecked.value) {
                          showSnackBar("Please accept terms and conditions");
                        } else {
                          Get.offAllNamed(AppRoutes.bio)?.then((result) {
                            if (result != null && result == true) {
                              controller.showButton(true);
                            }
                          });
                        }
                      }),
                ).paddingOnly(bottom: 15, top: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
