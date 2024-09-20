import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    final EarningController controller = Get.put(EarningController());

    final currentMonth = DateTime.now().month.obs;
    return Scaffold(
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
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Get.offAllNamed(AppRoutes.bottomNavigation);
            // Get.back();
          },
          child: Text(
            "My Earnings",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: Obx(()=>
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * .09,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.blackShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(
                        ()=> RichText(
                            text: TextSpan(
                              text: "Wallet Balance\n",
                              style: Theme.of(context).textTheme.displayLarge,
                              children: [
                                TextSpan(
                                  text: "AED ${controller.totalAmount.value}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(color: AppColors.yellow),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkButton(
                          height: 35,
                          width: 130,
                          child: Text(
                            "WITHDRAW",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                              color: AppColors.black,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.withdraw);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.55,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackShade,
                    ),
                    child:
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:(){
                                controller.isWeekly.value=true;
                                log('Weekly');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 31,
                                width: 88,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.isWeekly.value == false ? AppColors.blackShade : AppColors.yellow,
                                ),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "Weekly",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!.copyWith(color: controller.isWeekly.value ==false ?  AppColors.yellow:Colors.black)
                                ),).paddingOnly(right: Get.width*0.05),
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.isWeekly.value=false;
                                log('Monthly');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 31,
                                width: 88,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.yellow),
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.isWeekly.value == true ? AppColors.blackShade : AppColors.yellow,
                                ),
                                child: Text(textAlign: TextAlign.center,
                                    "Monthly",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!.copyWith(color: controller.isWeekly.value ==true ?  AppColors.yellow:Colors.black)
                                ),
                              ),
                            ),
                          ],
                        ).paddingOnly(top: Get.height*0.02,bottom: Get.height*0.02),
                        // Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: DropdownButton<String>(
                        //       value: controller.isWeekly.value ? 'Weekly' : 'Monthly',
                        //       items: const [
                        //         DropdownMenuItem(
                        //           value: 'Weekly',
                        //           child: Text('Weekly'),
                        //         ),
                        //         DropdownMenuItem(
                        //           value: 'Monthly',
                        //           child: Text('Monthly'),
                        //         ),
                        //       ],
                        //       onChanged: (value) {
                        //         if (value == 'Weekly' && !controller.isWeekly.value) {
                        //           controller.toggleView();
                        //         } else if (value == 'Monthly' && controller.isWeekly.value) {
                        //           controller.toggleView();
                        //         }
                        //       },
                        //     )
                        // ),
                        // controller.isWeekly.value ==true ?
                        // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         GestureDetector(
                        //             onTap: () {
                        //               if (currentDay.value > 1) {
                        //                 currentDay.value = currentDay.value - 1;
                        //               }
                        //             },
                        //             child: Container(
                        //                 height: 25,
                        //                 width: 25,
                        //                 decoration: const BoxDecoration(
                        //                     color: Colors.transparent,
                        //                     shape: BoxShape.circle
                        //                 ),
                        //                 child: const Icon(Icons.arrow_back_ios,size: 16,).paddingOnly(right: Get.width*0.01))),
                        //         Container(
                        //           width: Get.width*0.29,
                        //           alignment: Alignment.center,
                        //           child: Text(
                        //             controller.days[currentDay.value - 1],
                        //             style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                        //         ),
                        //         GestureDetector(
                        //             onTap: () {
                        //               if (currentDay.value < controller.days.length) {
                        //                 currentDay.value = currentDay.value + 1;
                        //               }
                        //             },
                        //             child: Container(
                        //                 height: 25,
                        //                 width: 25,
                        //                 decoration: const BoxDecoration(
                        //                     color: Colors.transparent,
                        //                     shape: BoxShape.circle
                        //                 ),
                        //                 child: const Icon(Icons.arrow_forward_ios,size: 16,).paddingOnly(left: Get.width*0.01))),
                        //       ],
                        //     ),
                        //   ],
                        // ):
                        // Row(mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GestureDetector(
                        //         onTap: () {
                        //           currentMonth.value = (currentMonth.value - 2 + 12) % 12 + 1;
                        //         },
                        //         child: Container(
                        //             height: 25,
                        //             width: 25,
                        //             decoration: const BoxDecoration(
                        //                 color: Colors.transparent,
                        //                 shape: BoxShape.circle
                        //             ),
                        //             child: const Icon(Icons.arrow_back_ios,size: 16,).paddingOnly(right: Get.width*0.01))),
                        //     Container(alignment: Alignment.center,
                        //       width: Get.width*0.23,
                        //       child: Text(controller.months[currentMonth.value - 1],
                        //         style: const TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //         onTap: () {
                        //           currentMonth.value = (currentMonth.value % 12) + 1;
                        //         },
                        //         child: Container(
                        //             height: 25,
                        //             width: 25,
                        //             decoration: const BoxDecoration(
                        //                 color: Colors.transparent,
                        //                 shape: BoxShape.circle
                        //             ),
                        //             child: const Icon(Icons.arrow_forward_ios,size: 16,).paddingOnly(left: Get.width*0.01))),
                        //
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                          'AED ${controller.totalEarnings.value}',
                            style: const TextStyle(
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        controller.isWeekly.value ?
                        FutureBuilder(
                          future:CallAPI.getWeeklyData(trainerId: storage.read("userId").toString()),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return
                                SizedBox(
                                  height: Get.height * .3,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ).paddingOnly(top: 0),
                                );
                            }
                            else  if (snapshot.hasData ) {
                              SchedulerBinding.instance.addPostFrameCallback((_) {
                                controller.weeklyData = snapshot.data!.dailyRevenue!;
                                controller.totalSession.value = snapshot.data!.totalSession.toString();
                                controller.totalEarnings.value = snapshot.data!.totalRevenue.toString();
                              });
                              return
                                Expanded(
                                  child: GetBuilder<EarningController>(
                                    builder: (controller) {
                                      final List<CartesianSeries<dynamic, dynamic>> seriesList = [
                                        ColumnSeries<dynamic, String>(
                                          width: 0.6,
                                          dataSource: controller.weeklyData ,
                                          xValueMapper: (dynamic data, _) => data.dayName,
                                          yValueMapper: (dynamic data, _) => data.revenue,
                                          pointColorMapper: (dynamic data, int index) {
                                            return index == controller.tappedIndex.value ? AppColors.yellow : Colors.transparent;
                                          },
                                          borderColor: AppColors.yellow,
                                          borderWidth: 1,
                                          borderRadius: BorderRadius.circular(10),
                                          onPointTap: (ChartPointDetails details) {
                                            log('Tapped on index: ${details.pointIndex}');
                                            controller.updateTappedIndex(details.pointIndex!);
                                          },
                                        ),
                                      ];
                                      final chart = SfCartesianChart(
                                        plotAreaBorderWidth: 0,
                                        borderWidth: 0,
                                        tooltipBehavior: TooltipBehavior(
                                          canShowMarker: true,
                                          enable: false,
                                          color: Colors.white,
                                          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                                            return Container(
                                              height: 60,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                color: AppColors.yellow,
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        primaryXAxis:
                                        CategoryAxis(
                                          isVisible: true,
                                          labelStyle: const TextStyle(color: AppColors.impgrey),
                                          majorGridLines: const MajorGridLines(width: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          isVisible: false,
                                          majorGridLines: const MajorGridLines(width: 0),
                                          minimum: controller.isWeekly.value ? null : 10,
                                          maximum: controller.isWeekly.value ? null : 100,
                                          interval: controller.isWeekly.value ? null : 10,
                                        ),
                                        series: seriesList,
                                      );

                                      return controller.isWeekly.value
                                          ? chart
                                          : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width:controller. monthlyData.length * 50.0,
                                          child: chart,
                                        ),
                                      );
                                    },
                                  ),
                                );

                            } else  if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                            else  if (!snapshot.hasData) {
                              return SizedBox(
                                height: Get.height * .4,
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
                        ):
                        FutureBuilder(
                          future:CallAPI.getMonthlyData(trainerId: storage.read("userId").toString()),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return
                                SizedBox(
                                  height: Get.height * .3,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ).paddingOnly(top: 0),
                                );
                            }
                            else  if (snapshot.hasData ) {
                              SchedulerBinding.instance.addPostFrameCallback((_) {
                                controller.monthlyData= snapshot.data!.revenueByDay!;
                                // controller.totalAmount.value = snapshot.data!.totalRevenue.toString();
                                controller.totalSession.value = snapshot.data!.totalSession.toString();
                                controller.totalEarnings.value = snapshot.data!.totalRevenue.toString();
                              });
                              return
                                Expanded(
                                  child: GetBuilder<EarningController>(
                                    builder: (controller) {
                                      final List<CartesianSeries<dynamic, dynamic>> seriesList = [
                                        ColumnSeries<dynamic, String>(
                                          width: 0.6,
                                          dataSource: controller.monthlyData,
                                          xValueMapper: (dynamic data, _) => DateFormat('dd MMM')
                                              .format(DateTime.parse(data.date)),
                                          yValueMapper: (dynamic data, _) => data.revenue,
                                          pointColorMapper: (dynamic data, int index) {
                                            return index == controller.tappedIndex.value ? AppColors.yellow : Colors.transparent;
                                          },
                                          borderColor: AppColors.yellow,
                                          borderWidth: 1,
                                          borderRadius: BorderRadius.circular(10),
                                          onPointTap: (ChartPointDetails details) {
                                            log('Tapped on index: ${details.pointIndex}');
                                            controller.updateTappedIndex(details.pointIndex!);
                                          },
                                        ),
                                      ];
                                      final chart = SfCartesianChart(
                                        plotAreaBorderWidth: 0,
                                        borderWidth: 0,
                                        tooltipBehavior: TooltipBehavior(
                                          canShowMarker: true,
                                          enable: true,
                                          color: Colors.red,
                                          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.yellow,
                                                borderRadius: BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.months[currentMonth.value - 1]} : ${data.period}',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Amount: AED ${data.amount.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        primaryXAxis:
                                        CategoryAxis(
                                          labelStyle: const TextStyle(color: AppColors.impgrey),
                                          majorGridLines: const MajorGridLines(width: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          isVisible: false,
                                          majorGridLines: const MajorGridLines(width: 0),
                                          autoScrollingMode: AutoScrollingMode.end,
                                          labelStyle: const TextStyle(color: AppColors.impgrey),
                                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                                          // Setting minimum and maximum to null will allow the axis to auto scale based on the data
                                          minimum: null,
                                          maximum: null,
                                          interval: null,  // Let the chart handle intervals automatically
                                        ),
                                        series: seriesList,
                                      );

                                      return controller.isWeekly.value
                                          ? chart
                                          : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SizedBox(
                                          width:controller. monthlyData.length * 50.0,
                                          child: chart,
                                        ),
                                      );
                                    },
                                  ),
                                );

                            } else  if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                            else  if (!snapshot.hasData) {
                              return SizedBox(
                                height: Get.height * .4,
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
                  ).paddingOnly(
                    top: 15,
                  ),
                  Container(
                    height: Get.height * .09,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.blackShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Earnings",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            ),
                            Text(
                              'AED ${controller.totalEarnings.value}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 15, right: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Sessions",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            ),
                            Text(
                              controller.totalSession.value,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.impgrey,
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 15, right: 15),
                      ],
                    ),
                  ).paddingOnly(top: 15, bottom: Get.height * 0.04),
                ],
              ).paddingOnly(
                left: Get.width * 0.03,
                right: Get.width * 0.03,
                top: Get.height * 0.02,
              ),
            ),
          ),
      ),
    );
  }
}
