import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
class OtpUI extends StatelessWidget {
  const OtpUI({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Transform.scale(
              scaleX: 1.1,
              scaleY: 1,
              child: Image.asset(ImagesPaths.bgBlackShade,)),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                    offset: const Offset(-17,0),
                    child: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios,size: 18,color: Colors.white,))),

                Text(
                  'Verification',
                  style: Theme.of(context).textTheme.headlineLarge,
                ).paddingOnly(top: Get.height*0.04),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  'Check your phone. We’ve sent\nyou the OTP at your ${controller.phoneNumber!["otp"] != "" || controller.phoneNumber!["phoneNumber"] !=""?"Email":"Number"}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                PinCodeTextField(
                  controller: controller.otpController,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 30),
                  animationCurve: Curves.easeInCubic,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 34,
                    inactiveColor: AppColors.lightGrey,
                    selectedColor: AppColors.yellow,
                    activeColor: AppColors.yellow,
                    inactiveBorderWidth: 1,
                    selectedBorderWidth: 1,
                    activeBorderWidth: 1,
                  ),
                  autoDisposeControllers: true,
                  enablePinAutofill: true,
                  appContext: context,
                  hintStyle: const TextStyle(color: AppColors.grey, fontSize: 22),
                  hintCharacter: '●',
                  blinkWhenObscuring: true,
                  cursorColor: AppColors.yellow,
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.transparent,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 6,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ).paddingOnly(left: 5, right: 5),
                Center(
                  child: Obx(
                        () => GestureDetector(
                      onTap: () {
                        if (controller.time.value == "00:01") {
                          controller.resendOtp();
                        }
                      },
                      child: Text(
                        controller.time.value == "00:01" ? "Resend OTP" : controller.time.value.toString(),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Center(
                  child: Text(
                    'Resend the code if not received?',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.whiteShade, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: inkButton(
                    onTap: () {
                      controller.onVerify();
                    },
                    child: Text('Verify', textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontSize: 18,
                            fontFamily: 'Montserrat',
                            )),
                  ),
                ),
              ],
            ).paddingOnly(
                top: Get.height * 0.064,
                left: Get.width * 0.09,
                right: Get.width * 0.09),
          ),
        ],
      ),
    );
  }
}