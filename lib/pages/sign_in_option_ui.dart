import 'package:flutter/material.dart';

import '../controllers/sign_in_option_controller.dart';
import '../utils/exports.dart';

class SignInOptionUi extends StatelessWidget {
  const SignInOptionUi({super.key});

  @override
  Widget build(BuildContext context) {
    SignInOptionController controller = SignInOptionController();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
              opacity: 0.3,
              fit: BoxFit.cover,
              image: AssetImage(ImagesPaths.imgSignInOption)),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagesPaths.appLogo,
              height: 47,width: 29,
            ),

            Column(
              children: [
                Text(
                  "Welcome to",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.white, fontSize: 32),
                ),
                Image.asset(
                  ImagesPaths.logoimg,
                  scale: 2.9,
                ),
                RichText(
                    text: TextSpan(
                        text: "Step into Endoorphin, where wellness and fitness",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.w400,color: AppColors.whiteShade),
                        children: [
                          TextSpan(
                            text: "\n      thrive! With over ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400,color: AppColors.whiteShade),
                          ),
                          TextSpan(
                            text: " 2000+",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w700, color: AppColors.yellow),
                          ),
                          TextSpan(
                            text: " certified trainers",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.w400,color: AppColors.whiteShade),
                          ),
                        ])).paddingOnly(top: 20,bottom: 20),
                InkButton(
                    child: Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      controller.onCreateAccount();

                    }).paddingOnly(bottom: 20),
                InkButton(
                    backGroundColor: Colors.transparent,
                    child: Text("Sign In",  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),),

                    onTap: () {
                      controller.onSignIn();
                    })
              ],
            ).paddingOnly(bottom: 30)

          ],
        ).paddingOnly(top: Get.height*.06,bottom: Get.height*.03),

      ),
    );
  }
}
