import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class EarningUi extends StatelessWidget {
  const EarningUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: Text(
            "My Earnings",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          context: context),
      body: Column(
        children: [
          Container(
            height: Get.height * .09,
            width: Get.width,
            decoration: BoxDecoration(
                color: AppColors.grey, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround
              ,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Wallet Balance\n",
                        style: Theme.of(context).textTheme.displayLarge,
                        children: [
                          TextSpan(
                            text: "AED 59.90",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppColors.yellow),

                          )
                        ]
                    )
                ),
                InkButton(child: Text("WITHDRAW",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColors.black),
                ), onTap: (){
                  Get.toNamed(AppRoutes.withdraw);
                })

              ],
            ),
          )
        ],
      ).paddingOnly(left: 25, right: 20,top: 15),
    );
  }
}



