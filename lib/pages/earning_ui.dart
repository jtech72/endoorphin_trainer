import 'package:flutter/material.dart';
import 'package:endoorphin_trainer/custom_Widgets/common_widgets.dart';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _SalesData {
  final String day;
  final int amount;

  _SalesData(this.day, this.amount);
}

class EarningUi extends StatelessWidget {
  const EarningUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('  S', 35),
      _SalesData(' M ', 28),
      _SalesData(' T', 34),
      _SalesData(' W ', 32),
      _SalesData(' T ', 44),
      _SalesData(' F ', 49),
      _SalesData(' S ', 54),
    ];
    return Scaffold(
      appBar: myAppBar(
        title: Text(
          "My Earnings",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        context: context,
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * .09,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.grey,
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
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
             height: 432,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),
              color: AppColors.grey,

            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                SfCartesianChart(

                  primaryYAxis: NumericAxis(
                    isVisible: false,
                    majorTickLines: MajorTickLines(size: 0), // Remove major tick lines for y-axis
                  ),
                  primaryXAxis: CategoryAxis(
                    isVisible: true,
                    labelPlacement: LabelPlacement.onTicks, // Set labelPlacement here
                    majorTickLines: MajorTickLines(size: 0,),
                    // Remove major tick lines
                  ),
                  // Chart title
                  title: ChartTitle(text: 'Week Earnings'),
                  // Enable legend
                  legend: Legend(isVisible: false),

                  // Enable tooltip

                  series: <CartesianSeries<_SalesData, String>>[
                    ColumnSeries<_SalesData, String>(
                      isTrackVisible: false,
                      enableTooltip: true,
                      initialIsVisible: true,
                      isVisibleInLegend: true,
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.day,
                      yValueMapper: (_SalesData sales, _) => sales.amount,
                      name: 'Earnings', // You can set any name here
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: false),
                      color: Colors.transparent,
                      borderColor: AppColors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    )
                  ],
                ),
              ),
            ),
          ).paddingOnly(top: 15),

          Container(
            height: Get.height * .09,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [

  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Earnings",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.impgrey,),),
      Text("AED 1950.30",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.impgrey,),),

    ],
  ).paddingOnly(left: 15,right: 15),
  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Total Sessions",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.impgrey,),),
      Text("140",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.impgrey,),),

    ],
  ).paddingOnly(left: 15,right: 15),
],
            ),
          ).paddingOnly( top: 15),
        ],
      ).paddingOnly(left: 25, right: 20, top: 15),
    );
  }
}
