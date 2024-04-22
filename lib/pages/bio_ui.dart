import 'package:flutter/material.dart';

import '../utils/exports.dart';

class BioUi extends StatelessWidget {
  const BioUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  myAppBar(
          title: Text('Bio',
            style: Theme.of(context).textTheme.headlineSmall,),
          context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [

              Image.asset(ImagesPaths.profile,scale: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("User Name:-",textAlign: TextAlign.start,),
                      Text("Kunal Thakur",textAlign: TextAlign.start,).paddingOnly(left: 10),
                    ],
                  ),
                  Icon(Icons.edit)

                ],
              ).paddingOnly(top: 20),
              Row(
                children: [
                  Text(
                    'Bio',
                    // style: Theme.of(context).textTheme.displayLarge,
                  ).paddingOnly(bottom: 12,),
                ],
              ).paddingOnly(top: 20),
              Container(
                height: Get.height * 0.15,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.yellowishWhite,
                    borderRadius: BorderRadius.circular(7)),
                child: TextField(
                  minLines: 1,
                  maxLines: 8,
                  style: const TextStyle(color: AppColors.impgrey, fontSize: 10),
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    fillColor: AppColors.yellowishWhite,
                    hintText: 'Tell us something about yourself ',
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: AppColors.yellowishWhite,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: AppColors.yellowishWhite,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.yellowishWhite,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkButton(
              child: Text(
                'Submit',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColors.black),
              ),
              onTap: () {

                Get.toNamed(AppRoutes.login);
              }).paddingOnly(bottom: 30)
        ],
      ).paddingOnly(left: 18,right: 18),

    );
  }
}
