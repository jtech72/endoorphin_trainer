import 'package:endoorphin_trainer/controllers/earning_controller.dart';
import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _SalesData {
  final String day;
  final int amount;
  // final int time;

  _SalesData(this.day, this.amount,);
}

class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    EarningController controller = Get.put(EarningController());
    List<_SalesData> data = [
      _SalesData(' S', 35,),
      _SalesData(' M ', 21,),
      _SalesData(' T', 40,),
      _SalesData(' W ', 30,),
      _SalesData(' T ', 40,),
      _SalesData(' F ', 49,),
      _SalesData(' S ', 54,),
    ];
    return Scaffold(
      appBar: myAppBar(
        title: Text(
          "My Earnings",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        context: context,
      ),
      body: SingleChildScrollView(
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
                      child: Text(
                        "WITHDRAW",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: AppColors.black),
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
                    borderWidth: 5,
                    legend: Legend(
                        textStyle: TextStyle(
                            color: AppColors.impgrey),
                            isVisible: true),
                    tooltipBehavior: TooltipBehavior(
                        textStyle: TextStyle(color: AppColors.black),
                        enable: true,color: Colors.grey),

                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 70, interval: 10),
                    series: <CartesianSeries<_SalesData, String>>[
                      ColumnSeries<_SalesData, String>(

                          dataSource: data,
                          xValueMapper: (_SalesData data, _) => data.day,
                          yValueMapper: (_SalesData data, _) => data.amount,
                          name:'Dec 7 - 14',

                          color: AppColors.yellow,
                        borderColor: AppColors.grey,
                        borderRadius: BorderRadius.circular(10),
                      )
                    ])

            ).paddingOnly(top: 15,),

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
            ).paddingOnly(top: 15),
          ],
        ).paddingOnly( left:Get.width*0.01,right:Get.width*0.01,top: Get.height*0.02),
      ),
    );
  }
}
