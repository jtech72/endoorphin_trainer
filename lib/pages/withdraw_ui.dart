import 'package:endoorphin_trainer/controllers/withdraw_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

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
                              'AED2648.00',
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
                              controller.selectedIndex.value = 1;
                            },
                            child: Container(
                              height: 31,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex.value == 1
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
                                            controller.selectedIndex.value == 1
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
                  controller.selectedIndex.value == 0
                      ? SizedBox(
                          height: Get.height,
                          width: Get.width,
                          child: FutureBuilder(
                            future: CallAPI. getUnpaid(trainerId: storage.read("userId").toString()),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                ).paddingOnly(top: 20);
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Column(
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
                                                    value: controller
                                                        .isChecked3.value,
                                                    onChanged: (value) {
                                                      controller
                                                          .toggleCheckbox3();
                                                    },
                                                  ),
                                                ),
                                                const Column(
                                                  children: [
                                                    Text(
                                                      'Yoga session with Richard',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      '21 Dec . 1.39 pm ',
                                                      style: TextStyle(
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
                                            const Text(
                                              'AED 900',
                                              style: TextStyle(
                                                  color: AppColors.yellow,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ).paddingOnly(
                                            right: Get.width * 0.03,
                                            top: Get.height * .02,
                                            bottom: Get.height * .02),
                                        Container(
                                          height: 1,
                                          width: Get.width,
                                          color: AppColors.lightyGrey,
                                        ),
                                      ],
                                    ).paddingOnly(bottom: Get.height * 0.35),
                                    InkButton(
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
                                                    height: Get.height * 0.07,
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
                                                    child: InkButton(
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
                                                              .value = 1;
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
                                  child: Text("Something went wrong"),
                                );
                              }
                            },
                          )).paddingOnly()
                      : SizedBox(
                          height: Get.height * .4,
                          width: Get.width,
                          child: Column(
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
                                      const Column(
                                        children: [
                                          Text(
                                            'Yoga session with Richard',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '21 Dec . 1.39 pm ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ).paddingOnly(left: Get.width * 0.05),
                                    ],
                                  ),
                                  const Text(
                                    'AED 500',
                                    style: TextStyle(
                                        color: AppColors.yellow,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                ],
                              ).paddingOnly(
                                  right: Get.width * 0.03,
                                  top: Get.height * .026,
                                  bottom: Get.height * .026),
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
                                      const Column(
                                        children: [
                                          Text(
                                            'Yoga session with Richard',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '21 Dec . 1.39 pm ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ).paddingOnly(left: Get.width * 0.05),
                                    ],
                                  ),
                                  const Text(
                                    'AED 700',
                                    style: TextStyle(
                                        color: AppColors.yellow,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                ],
                              ).paddingOnly(
                                  right: Get.width * 0.03,
                                  top: Get.height * .026,
                                  bottom: Get.height * .026),
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
                                      const Column(
                                        children: [
                                          Text(
                                            'Yoga session with Richard',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '21 Dec . 1.39 pm ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ).paddingOnly(left: Get.width * 0.05),
                                    ],
                                  ),
                                  const Text(
                                    'AED 900',
                                    style: TextStyle(
                                        color: AppColors.yellow,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                ],
                              ).paddingOnly(
                                  right: Get.width * 0.03,
                                  top: Get.height * .026,
                                  bottom: Get.height * .026),
                              Container(
                                height: 1,
                                width: Get.width,
                                color: AppColors.lightyGrey,
                              ),
                            ],
                          )),
                ],
              ),
            ),
          ),
        ));
  }
}
