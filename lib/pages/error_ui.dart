import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class ErrorUi extends StatelessWidget {
  const ErrorUi({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorController controller =Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          Column(
            children: [
              SizedBox(
                height: Get.height*0.05,
              ),
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
              InkButton(
                  backGroundColor: Colors.transparent,
                  child: Text("Go back",  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.yellow,
                      fontSize: 18,
                      fontFamily: 'Montserrat'),),

                  onTap: () {
                  }).paddingOnly(top: Get.height*0.02,bottom: Get.height*0.02),
              InkButton(
                  child: Text(
                    "Reload",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontSize: 18,
                        fontFamily: 'Montserrat'),
                  ),
                  onTap: () {
Get.back();
                  })
            ],
          ).paddingOnly(left: 20,right: 20),
        ],
      ),
    );
  }
}
