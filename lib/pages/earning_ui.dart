import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _SalesData {
  final String day;
  final int amount;

  // final int time;

  _SalesData(
    this.day,
    this.amount,
  );
}

class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    EarningController controller = Get.put(EarningController());
    List<_SalesData> data = [
      _SalesData(' S' , 35,),
      _SalesData(' M ', 21,),
      _SalesData(' T' , 60,),
      _SalesData(' W ', 30,),
      _SalesData(' T ', 40,),
      _SalesData(' F ', 30,),
      _SalesData(' S ', 54,),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: myAppBar(
      //   title: Text(
      //     "My Earnings",
      //     style: Theme.of(context).textTheme.bodyMedium,
      //   ),
      //   context: context,
      // ),
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height*0.055,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.arrow_back_ios,size: 18,).paddingOnly(right: Get.width*0.02)),
                    ),
                    Text('My Earnings',
                      style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ).paddingOnly(left: Get.width*0.04,bottom: Get.height*0.04),
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
                                ?.copyWith(color: AppColors.black,fontSize: 14,fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.withdraw);
                          })
                    ],
                  ),
                ),
                Container(
                    height: 432,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackShade,
                    ),
                    child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        borderWidth: 5,
                        legend: Legend(
                            textStyle: TextStyle(color: AppColors.impgrey),
                            isVisible: true),
                        tooltipBehavior: TooltipBehavior(
                            canShowMarker: false,
                            textStyle: TextStyle(color: AppColors.black),
                            enable: true,
                            color: AppColors.yellow),
                        primaryXAxis: CategoryAxis(
                          labelStyle: TextStyle(color: AppColors.impgrey),
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                            isVisible: false,
                            labelStyle: TextStyle(color: AppColors.impgrey),
                            majorGridLines: MajorGridLines(width: 0),
                            minimum: 0,
                            maximum: 70,
                            interval: 10),
                        series: <CartesianSeries<_SalesData, String>>[
                          ColumnSeries<_SalesData, String>(
                            dataSource: data,
                            xValueMapper: (_SalesData data, _) => data.day,
                            yValueMapper: (_SalesData data, _) => data.amount,
                            name: 'Dec 7 - 14',
                            color: AppColors.yellow,
                            borderColor: AppColors.grey,borderWidth: 1,
                            borderRadius: BorderRadius.circular(10),
                          )
                        ])).paddingOnly(
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
                InkButton(
                    child: Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: AppColors.black,fontWeight: FontWeight.w500,fontSize: 20),
                    ),
                    onTap: () {
                      Get.offAllNamed(AppRoutes.bottomNavigation);
                    })
              ],
            ).paddingOnly(
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                top: Get.height * 0.02),
          ),
        ],
      ),
    );
  }
}
