import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _SalesData {
  final String period; // This could be 'day' for weekly data and 'month' for monthly data
  final double amount;

  _SalesData(this.period, this.amount);
}

class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelected = false;
    EarningController controller = Get.put(EarningController());
    // List<_SalesData> data = [
    //   _SalesData(' S' , 35,),
    //   _SalesData(' M ', 21,),
    //   _SalesData(' T' , 60,),
    //   _SalesData(' W ', 30,),
    //   _SalesData(' T ', 40,),
    //   _SalesData(' F ', 30,),
    //   _SalesData(' S ', 54,),
    // ];
    bool isWeekly = true;

    // Example weekly data
    final List<_SalesData> weeklyData = [
      _SalesData('Sun', 30),
      _SalesData('Mon', 42),
      _SalesData('Tue', 54),
      _SalesData('Wed', 70),
      _SalesData('Thu', 35),
      _SalesData('Fri', 50),
      _SalesData('Sat', 40),

    ];

    // Example monthly data
    final List<_SalesData> monthlyData = [
      _SalesData('Jan', 300),
      _SalesData('Feb', 420),
      _SalesData('Mar', 540),
      _SalesData('Apr', 200),
      _SalesData('May', 350),
      _SalesData('Jun', 500),
      _SalesData('Jul', 400),
      _SalesData('Aug', 450),
      _SalesData('Sep', 480),
      _SalesData('Oct', 420),
      _SalesData('Nov', 510),
      _SalesData('Dec', 600),
    ];
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
        title: GestureDetector(onTap: (){Get.offAllNamed(AppRoutes.bottomNavigation);},
          child: Text(
            "My Earnings",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      // appBar: myAppBar(
      //   title: Text(
      //     "My Earnings",
      //     style: Theme.of(context).textTheme.bodyMedium,
      //   ),
      //   context: context,
      // ),
      body: Container(
        height:Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesPaths.bgBlackShade,),fit: BoxFit.cover
            )
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
                      height: 35,width: 130,
                        child: Text(
                          "WITHDRAW",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: AppColors.black,fontSize: 14,
                              fontFamily: 'Montserrat'),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.withdraw);
                        })
                  ],
                ),
              ),
              Container(
                  height: Get.height*0.55,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blackShade,
                  ),
                  child:Column(
                    children: [
                      // Dropdown to switch between weekly and monthly data
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => DropdownButton<String>(
                          value: controller.isWeekly.value ? 'Weekly' : 'Monthly',
                          items: [
                            DropdownMenuItem(
                              value: 'Weekly',
                              child: Text('Weekly'),
                            ),
                            DropdownMenuItem(
                              value: 'Monthly',
                              child: Text('Monthly'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.toggleView();
                          },
                        )),
                      ),
                      Expanded(
                        child: Obx(() {
                          final List<CartesianSeries<dynamic, dynamic>> seriesList = [
                            ColumnSeries<_SalesData, String>(
                              dataSource: controller.isWeekly.value ? weeklyData : monthlyData,
                              xValueMapper: (_SalesData data, _) => data.period,
                              yValueMapper: (_SalesData data, _) => data.amount,
                              name: controller.isWeekly.value ? 'AED 1959.90' : 'AED 1959.90',
                              color: AppColors.yellow,
                              borderColor: AppColors.yellow,
                              borderWidth: 1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ];
                          return SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            borderWidth: 4,
                            title: ChartTitle(
                              text: controller.isWeekly.value ? 'Dec 7 - 14' : '2024',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            legend: Legend(
                              toggleSeriesVisibility: false,
                              textStyle: TextStyle(
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                              isVisible: true,
                            ),
                            tooltipBehavior: TooltipBehavior(
                              canShowMarker: false,
                              textStyle: TextStyle(color: AppColors.black),
                              enable: true,
                              color: AppColors.yellow,
                            ),
                            primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(color: AppColors.impgrey),
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              isVisible: false,
                              labelStyle: TextStyle(color: AppColors.impgrey),
                              majorGridLines: MajorGridLines(width: 0),
                              minimum: 0,
                              maximum: controller.isWeekly.value ? 70 : 700,
                              interval: controller.isWeekly.value ? 10 : 100,
                            ),
                            series: seriesList,
                          );
                        }),
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
                          "AED 1950.30",
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
                          "140",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.impgrey,
                              ),
                        ),
                      ],
                    ).paddingOnly(left: 15, right: 15),
                  ],
                ),
              ).paddingOnly(top: 15,bottom: Get.height*0.04),
              // InkButton(
              //     child: Text(
              //       "Logout",
              //       style: Theme.of(context)
              //           .textTheme
              //           .displayLarge
              //           ?.copyWith(color: AppColors.black,fontWeight: FontWeight.w500,fontSize: 20),
              //     ),
              //     onTap: () {
              //       Get.offAllNamed(AppRoutes.signinoption);
              //     })
            ],
          ).paddingOnly(
              left: Get.width * 0.0,
              right: Get.width * 0.0,
              top: Get.height * 0.02),
        ),
      ),
    );
  }
}
