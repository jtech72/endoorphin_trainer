import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class WithdrawUI extends StatelessWidget {
  const WithdrawUI({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    WithdrawController controller = Get.put(WithdrawController());
    return Scaffold(
        appBar: myAppBar(
            title: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Withdraw',
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
            child: Obx(
              () => Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 71,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.greyButton,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Balance',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'AED ${controller.totalBalance.value.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.yellow),
                            ),
                          ],
                        ).paddingOnly(
                            right: Get.width * 0.05, left: Get.width * 0.05),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = 0;
                            },
                            child: Container(
                              height: 31,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 0
                                      ? AppColors.yellow
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: controller.selectedIndex.value == 0
                                          ? AppColors.yellow
                                          : AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'Unpaid',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color:
                                            controller.selectedIndex.value == 0
                                                ? AppColors.black
                                                : AppColors.yellow),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = 3;
                            },
                            child: Container(
                              height: 31,
                              width: 93,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 3
                                      ? AppColors.yellow
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: controller.selectedIndex.value == 3
                                          ? AppColors.yellow
                                          : AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'Requested',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color:
                                            controller.selectedIndex.value == 3
                                                ? AppColors.black
                                                : AppColors.yellow),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = 2;
                            },
                            child: Container(
                              height: 31,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 2
                                      ? AppColors.yellow
                                      : AppColors.black,
                                  border: Border.all(color: AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'Paid',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color:
                                            controller.selectedIndex.value == 2
                                                ? AppColors.black
                                                : AppColors.yellow),
                              )),
                            ),
                          ),
                        ],
                      ).paddingOnly(bottom: Get.height * 0.02)
                    ],
                  ).paddingOnly(
                      left: Get.width * 0.02, right: Get.width * 0.02),
                  controller.selectedIndex.value == 0 ?
                  //UNPAID
                  SizedBox(
                          height: Get.height,
                          width: Get.width,
                          child:
                          FutureBuilder(
                            future: CallAPI. getUnpaid(trainerId: storage.read("userId").toString()),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center();
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else if (snapshot.data!.result!.isNotEmpty) {
                                double totalBalance = 0.0;
                                for (var item in snapshot.data!.result!) {
                                  totalBalance += double.parse( item.bookingAmount.toString());
                                }
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  controller.totalBalance.value = totalBalance;
                                });
                                return Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height*.6,
                                        width: Get.width,
                                        child:
                                        ListView.builder(
                                            itemCount:snapshot.data!.result!.length,
                                          itemBuilder: (context,index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Container(
                                                  height: 1,
                                                  width: Get.width,
                                                  color: AppColors.lightyGrey,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Obx(
                                                          () => Checkbox(
                                                            checkColor:
                                                                AppColors.yellow,
                                                            activeColor:
                                                                Colors.transparent,
                                                            side: const BorderSide(
                                                                color: AppColors.grey3,
                                                                width: 2),
                                                            value: controller.selectedItems.contains(snapshot.data!.result![index].id.toString()),
                                                            onChanged: (value) {
                                                              controller.toggleSelection(snapshot.data!.result![index].id.toString());
                                                              log(controller.selectedItems.toString());
                                                            },
                                                          ),
                                                        ),
                                                         Column(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width:Get.width*0.6,
                                                              child: Text(
                                                                '${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].user!.userName}',
                                                                style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight.w500),
                                                              ),
                                                            ),
                                                            Text(
                                                              DateFormat('dd MMM  h:mm a')
                                                                  .format(DateTime.parse(snapshot
                                                                  .data!.result![index].createdAt
                                                                  .toString())),
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight.w300),
                                                            ),
                                                          ],
                                                        ).paddingOnly(
                                                            left: Get.width * 0.05),
                                                      ],
                                                    ),
                                                     Text(
                                                      'AED ${snapshot.data!.result![index].bookingAmount}',
                                                      style: const TextStyle(
                                                          color: AppColors.yellow,
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ).paddingOnly(
                                                    right: Get.width * 0.03,
                                                    top: Get.height * .02,
                                                    bottom: Get.height * .02),
                                                if (index == snapshot.data!.result!.length - 1)
                                                  Container(
                                                    height: 1,
                                                    width: Get.width,
                                                    color: AppColors.lightyGrey,
                                                  ),
                                              ],
                                            ).paddingOnly();
                                          }
                                        ),
                                      ).paddingOnly(bottom: Get.height*0.02),
                                      inkButton(
                                          child: Text(
                                            'Sent Request',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                color: AppColors.black,
                                                fontSize: 18,
                                                fontFamily: 'Montserrat'),
                                          ),
                                          onTap: () {
                                            controller.postWithdrawRequest();
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                  AppColors.Black3,
                                                  title: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height * 0.03,
                                                      ),
                                                      Image.asset(
                                                        ImagesPaths.cooltick,
                                                        scale: 4,
                                                      ),
                                                      SizedBox(
                                                        height: Get.height * 0.02,
                                                      ),
                                                    ],
                                                  ),
                                                  content: SizedBox(
                                                      width: Get.width,
                                                      height: Get.height * 0.075,
                                                      child: Text(
                                                        "Your Request has been sent\nsuccessfully. You will be notified\nshortly",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelLarge!
                                                            .copyWith(
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,
                                                            color: AppColors
                                                                .white),
                                                        textAlign:
                                                        TextAlign.center,
                                                      )),
                                                  actions: [
                                                    Center(
                                                      child: inkButton(
                                                          child: Text(
                                                            'OK',
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .headlineSmall!
                                                                .copyWith(
                                                                color:
                                                                AppColors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                'Montserrat'),
                                                          ),
                                                          onTap: () {
                                                            Get.back();
                                                            controller
                                                                .selectedIndex
                                                                .value = 3;
                                                          },
                                                          height: 35,
                                                          width: 95),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.03,
                                                    ),
                                                  ],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                  ),
                                                );
                                              },
                                            );
                                          })

                                    ],
                                  );
                              } else {
                                return const Center(
                                  child: Text("No unpaid booking available"),
                                ).paddingOnly(bottom: 0);
                              }
                            },
                          )
                  ):
                  controller.selectedIndex.value == 2?
                  //PAID
                  SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child:
                      FutureBuilder(
                        future: CallAPI. getPaidSession(trainerId: storage.read("userId").toString()),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              // child: CircularProgressIndicator(),
                            ).paddingOnly(top: 20);
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.data!.result!.isNotEmpty) {
                            double totalBalance = 0.0;
                            for (var item in snapshot.data!.result!) {
                              totalBalance += double.parse(item == null?"0": item.bookingAmount.toString());
                            }
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              controller.totalBalance.value = totalBalance;
                            });
                            return
                              Column(
                                children: [
                                  SizedBox(
                                    height: Get.height,
                                    width: Get.width,
                                    child: ListView.builder(
                                        itemCount:snapshot.data!.result!.length,
                                        itemBuilder: (context,index) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                height: 1,
                                                width: Get.width,
                                                color: AppColors.lightyGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(
                                                      onTap:(){
                                                        log("${snapshot.data!.result![index].paymentAttachment}");
                                                        // controller.saveNetworkImage(snapshot.data!.result![index].paymentAttachment);
                                                      },
                                                      child: Container(
                                                          height:40,width: 40,color: Colors.transparent,
                                                          child:  const Icon(Icons.download,size: 20,color: AppColors.yellow,)).paddingOnly(left: Get.width*0.04)),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: Get.width * 0.7,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width*0.6,
                                                              child: Text(
                                                                '${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].user!.userName}',
                                                                style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                    FontWeight.w500),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  DateFormat('dd MMM  h:mm a')
                                                                      .format(DateTime.parse(snapshot
                                                                      .data!.result![index].createdAt
                                                                      .toString())),
                                                                  style: const TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                      FontWeight.w300),
                                                                ).paddingOnly(right: Get.width*0.03),
                                                              ],
                                                            ),
                                                          ],
                                                        ).paddingOnly(
                                                            left: Get.width * 0.05),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'AED ${snapshot.data!.result![index].bookingAmount}',
                                                    style: const TextStyle(
                                                        color: AppColors.yellow,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ).paddingOnly(
                                                  right: Get.width * 0.03,
                                                  top: Get.height * .02,
                                                  bottom: Get.height * .02),
                                              if (index == snapshot.data!.result!.length - 1)
                                                Container(
                                                  height: 1,
                                                  width: Get.width,
                                                  color: AppColors.lightyGrey,
                                                ),
                                            ],
                                          ).paddingOnly();
                                        }
                                    ),
                                  ),

                                ],
                              );
                          } else {
                            return const Center(
                              child: Text("No paid booking available"),
                            ).paddingOnly(bottom: 0);
                          }
                        },
                      )
                  ):
                  //REQUESTED
                  SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child:
                      FutureBuilder(
                        future: CallAPI. getRequestedBookings(trainerId: storage.read("userId").toString()),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              // child: CircularProgressIndicator(),
                            ).paddingOnly(top: 20);
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.data!.result!.isNotEmpty) {
                            double totalBalance = 0.0;
                            for (var item in snapshot.data!.result!) {
                              totalBalance += double.parse(item == null?"0": item.bookingAmount.toString());
                            }
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              controller.totalBalance.value = totalBalance;
                            });
                            return
                              Column(
                                children: [
                                  SizedBox(
                                    height: Get.height,
                                    width: Get.width,
                                    child: ListView.builder(
                                        itemCount:snapshot.data!.result!.length,
                                        itemBuilder: (context,index) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                height: 1,
                                                width: Get.width,
                                                color: AppColors.lightyGrey,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [

                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width*0.65,
                                                            child: Text(
                                                              '${snapshot.data!.result![index].categoryName} session with ${snapshot.data!.result![index].user!.userName}',
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight.w500),
                                                            ),
                                                          ),
                                                          Text(
                                                            DateFormat('dd MMM  h:mm a')
                                                                .format(DateTime.parse(snapshot
                                                                .data!.result![index].createdAt
                                                                .toString())),
                                                            style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.w300),
                                                          ),
                                                        ],
                                                      ).paddingOnly(
                                                          left: Get.width * 0.05),
                                                    ],
                                                  ),
                                                  Text(
                                                    'AED ${snapshot.data!.result![index].bookingAmount}',
                                                    style: const TextStyle(
                                                        color: AppColors.yellow,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ).paddingOnly(
                                                  right: Get.width * 0.03,
                                                  top: Get.height * .02,
                                                  bottom: Get.height * .02),
                                              if (index == snapshot.data!.result!.length - 1)
                                                Container(
                                                  height: 1,
                                                  width: Get.width,
                                                  color: AppColors.lightyGrey,
                                                ),
                                            ],
                                          ).paddingOnly();
                                        }
                                    ),
                                  ),
                                ],
                              );
                          } else {
                            return const Center(
                              child: Text("No unpaid booking available"),
                            ).paddingOnly(bottom: 0);
                          }
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
