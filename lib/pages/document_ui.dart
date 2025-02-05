import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
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
              if (controller.arguments.value == "upload") {
                Get.offAllNamed(AppRoutes.bottomNavigation);
              } else {
                Get.back();
              }
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
                      return
                        SizedBox(
                        height: Get.height * .7,
                        child: const Center(
                          child: SpinKitThreeBounce(color: AppColors.yellow,size: 30,),
                          // child: CircularProgressIndicator(),
                        ).paddingOnly(top: 0),
                      );
                    }
                 else  if (snapshot.hasData || controller.trainerDocStatusModel.value.result!.isNotEmpty) {
                      controller.trainerDocStatusModel.value = controller.trainerDocStatusModel.value;
                      return
                        Obx(
                            () => SizedBox(
                            height: Get.height * .8,
                            child:
                            controller.trainerDocStatusModel.value.result!.isEmpty?const SizedBox.shrink():
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
                                  TrainerDocumentStatusCard(
                                    docName: "Certification Name",
                                    docNumber: "Certification Number",
                                    categoryMainName: controller.trainerDocStatusModel.value.result![index].category!.name!.toUpperCase().toString(),
                                    categoryName: controller.trainerDocStatusModel.value.result![index].categoryName,
                                    categoryNumber: controller.trainerDocStatusModel.value.result![index].categoryNumber,
                                    documentFrontImg: controller.trainerDocStatusModel.value.result![index].documentFrontImg,
                                    documentBackImg: controller.trainerDocStatusModel.value.result![index].documentBackImg,
                                    approveStatus: controller.trainerDocStatusModel.value.result![index].approveStatus.toString(),
                                    remark: controller.trainerDocStatusModel.value.result![index].remark,
                                    comment: controller.trainerDocStatusModel.value.result![index].comment,
                                    onReuploadTap: () {
                                      {
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
                                      }
                                    },
                                  ).paddingOnly(left: 15,right: 15)
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
                                      ?
                                  TrainerDocumentStatusCard(
                                    docName: "Emirates ID Name",
                                    docNumber: "Emirates ID Number",
                                    categoryMainName: "Emirates ID",
                                    categoryName: controller.trainerDocStatusModel.value.result![index].emiratesName,
                                    categoryNumber: controller.trainerDocStatusModel.value.result![index].emiratesNumber,
                                    documentFrontImg: controller.trainerDocStatusModel.value.result![index].emiratesfrontImg.toString(),
                                    documentBackImg: controller.trainerDocStatusModel.value.result![index].emiratesbackImg.toString(),
                                    approveStatus: controller.trainerDocStatusModel.value.result![index].approveStatus.toString(),
                                    remark: controller.trainerDocStatusModel.value.result![index].remark,
                                    comment: controller.trainerDocStatusModel.value.result![index].comment,
                                    onReuploadTap: () {
                                      {
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
                                      }

                                    },
                                  ).paddingOnly(left: 15,right: 15)

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
                                      ?
                                  TrainerDocumentStatusCard(
                                    docName: "Passport Name",
                                    docNumber: "Passport Number",
                                    categoryMainName: "Passport",
                                    categoryName: controller.trainerDocStatusModel.value.result![index].passportName,
                                    categoryNumber: controller.trainerDocStatusModel.value.result![index].passportNumber,
                                    documentFrontImg: controller.trainerDocStatusModel.value.result![index].passportfrontImg.toString(),
                                    documentBackImg: controller.trainerDocStatusModel.value.result![index].passportbackImg.toString(),
                                    approveStatus: controller.trainerDocStatusModel.value.result![index].approveStatus.toString(),
                                    remark: controller.trainerDocStatusModel.value.result![index].remark,
                                    comment: controller.trainerDocStatusModel.value.result![index].comment,
                                    onReuploadTap: ()
                                    {
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
                                    }
                                    ,
                                  ).paddingOnly(left: 15,right: 15)
                                      :
                                  InkWell(
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
                   return const SizedBox.shrink();
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
