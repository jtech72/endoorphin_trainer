import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

import '../controllers/error_controller.dart';
class ErrorUi extends StatelessWidget {
  const ErrorUi({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorController controller =Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Whoops!",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 60,
                  color: AppColors.impgrey),
            ).paddingOnly(bottom: Get.height*.07),
            Image.asset(
              ImagesPaths.light,
            ),
            const Text(
              "It Looks like the page you are trying to\nreach is no longer available!",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.impgrey),
              textAlign: TextAlign.center,

            ).paddingOnly(top: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              InkButton(
                  child: Text(
                    "Go back",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),
                  ),
                  onTap: () {

                  }),
              InkButton(
                  child: Text(
                    "Reload",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black),
                  ),
                  onTap: () {

                  })
            ],).paddingOnly(top: Get.height*.08)
          ],
        ).paddingOnly(left: 20,right: 20),
      ),
    );
  }
}
