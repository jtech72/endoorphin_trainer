import 'dart:developer';
import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    final EarningController controller = Get.put(EarningController());
    final List<_SalesData> weeklyData = [
      _SalesData('Sun', 30),
      _SalesData('Mon', 42),
      _SalesData('Tue', 54),
      _SalesData('Wed', 65),
      _SalesData('Thu', 35),
      _SalesData('Fri', 50),
      _SalesData('Sat', 40),
    ];
    final List<_SalesData> monthlyData = [
      _SalesData('1', 300),
      _SalesData('2', 420),
      _SalesData('3', 540),
      _SalesData('4', 200),
      _SalesData('5', 350),
      _SalesData('6', 500),
      _SalesData('7', 300),
      _SalesData('8', 450),
      _SalesData('9', 310),
      _SalesData('10', 420),
      _SalesData('11', 510),
      _SalesData('12', 600),
      _SalesData('13', 450),
      _SalesData('14', 350),
      _SalesData('15', 460),
      _SalesData('16', 210),
      _SalesData('17', 310),
      _SalesData('18', 200),
      _SalesData('19', 400),
      _SalesData('20', 550),
      _SalesData('21', 310),
      _SalesData('22', 100),
      _SalesData('23', 150),
      _SalesData('24', 190),
      _SalesData('25', 310),
      _SalesData('26', 210),
      _SalesData('27', 150),
      _SalesData('28', 200),
      _SalesData('29', 330),
      _SalesData('30', 410),
      _SalesData('31', 600),
    ];
    final currentMonth = DateTime.now().month.obs;
    final currentDay = DateTime.now().weekday.obs;// Current month index
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
                        RichText(
                          text: TextSpan(
                            text: "Wallet Balance\n",
                            style: Theme.of(context).textTheme.displayLarge,
                            children: [
                              TextSpan(
                                text: "AED 59.90",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(color: AppColors.yellow),
                              ),
                            ],
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
                        controller.isWeekly.value ==true ?
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      if (currentDay.value > 1) {
                                        currentDay.value = currentDay.value - 1;
                                      }
                                    },
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle
                                        ),
                                        child: const Icon(Icons.arrow_back_ios,size: 16,).paddingOnly(right: Get.width*0.01))),
                                Container(
                                  width: Get.width*0.29,
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.days[currentDay.value - 1],
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      if (currentDay.value < controller.days.length) {
                                        currentDay.value = currentDay.value + 1;
                                      }
                                    },
                                    child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle
                                        ),
                                        child: const Icon(Icons.arrow_forward_ios,size: 16,).paddingOnly(left: Get.width*0.01))),
                              ],
                            ),
                          ],
                        ):
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  currentMonth.value = (currentMonth.value - 2 + 12) % 12 + 1;
                                },
                                child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle
                                    ),
                                    child: const Icon(Icons.arrow_back_ios,size: 16,).paddingOnly(right: Get.width*0.01))),
                            Container(alignment: Alignment.center,
                              width: Get.width*0.18,
                              child: Text(controller.months[currentMonth.value - 1],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  currentMonth.value = (currentMonth.value % 12) + 1;
                                },
                                child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle
                                    ),
                                    child: const Icon(Icons.arrow_forward_ios,size: 16,).paddingOnly(left: Get.width*0.01))),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            controller.isWeekly.value ? 'AED 1959.90' : 'AED 7950.90',
                            style: const TextStyle(
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GetBuilder<EarningController>(
                            builder: (controller) {
                              final List<CartesianSeries<dynamic, dynamic>> seriesList = [
                                ColumnSeries<_SalesData, String>(
                                  width: 0.6,
                                  dataSource: controller.isWeekly.value ? weeklyData : monthlyData,
                                  xValueMapper: (_SalesData data, _) => data.period,
                                  yValueMapper: (_SalesData data, _) => data.amount,
                                  pointColorMapper: (_SalesData data, int index) {
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
                                  canShowMarker: false,
                                  enable: true,
                                  color: Colors.white,
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
                                primaryXAxis: const CategoryAxis(
                                  labelStyle: TextStyle(color: AppColors.impgrey),
                                  majorGridLines: MajorGridLines(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
                                  isVisible: false,
                                  labelStyle: const TextStyle(color: AppColors.impgrey),
                                  majorGridLines: const MajorGridLines(width: 0),
                                  minimum: 0,
                                  maximum: controller.isWeekly.value ? 70 : 600,
                                  interval: controller.isWeekly.value ? 10 : 100,
                                ),
                                series: seriesList,
                              );

                              return controller.isWeekly.value
                                  ? chart
                                  : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: monthlyData.length * 50.0,
                                  child: chart,
                                ),
                              );
                            },
                          ),
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
                              controller.isWeekly.value ? 'AED 1959.90' : 'AED 7950.90',
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
                              controller.isWeekly.value ?"30":"140",
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
class _SalesData {
  final String period;
  final double amount;

  _SalesData(this.period, this.amount);
}
