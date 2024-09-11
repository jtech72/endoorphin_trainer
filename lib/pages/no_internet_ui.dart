import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';

class NoInternetUI extends StatelessWidget {
  const NoInternetUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                ImagesPaths.noInternet,
                scale: 5,
              )),
              Text(
                "No internet connection",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: AppColors.yellow),
              ).paddingOnly(top: Get.height * 0.08, bottom: Get.height * .035),
              const Center(
                child: Text(
                  "Oops! Looks like you're flying solo without\n internet. Hang tight, and we'll reconnect to our\n adventure as soon as we find our way back to\n the digital world.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.impgrey,
                  ),
                  textAlign: TextAlign.center,
                ),

              )
            ],
          ).paddingOnly(left: 20, right: 20),
        ],
      ),
    );
  }
}
