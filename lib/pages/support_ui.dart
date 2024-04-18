import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class SupportUI extends StatelessWidget {
  const SupportUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: Text('Support',
            style: Theme.of(context).textTheme.headlineSmall,),
          context: context),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email Description',style: Theme.of(context).textTheme.labelLarge,).paddingOnly(bottom: Get.height*.01),
          Container(
            height: 111,
            width: Get.width,
            decoration: BoxDecoration(
                color: AppColors.greyButton,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey3)
            ),
            child: TextField(
              minLines: 1,
              maxLines: 8,
              style: const TextStyle(
                  color: AppColors.grey3,fontSize: 10
              ),
              decoration: InputDecoration(filled: true,
                contentPadding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                fillColor: AppColors.greyButton,
                hintText: 'Enter Email description',
                hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightGrey,fontWeight: FontWeight.w400),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.greyButton,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.greyButton,
                    width: 1,
                  ),
                ),
              ),
            ),
          ).paddingOnly(bottom: Get.height*0.08),
          Center(child: InkButton(child: Text('Submit',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),), onTap: (){}))
        ],
      ).paddingOnly(left: Get.width*0.03,right: Get.width*0.03,top: Get.height*0.02),
    );
  }
}
