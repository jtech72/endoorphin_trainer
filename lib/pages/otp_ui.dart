import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';


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
            ///
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verification',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  'Check your phone. We’ve sent\nyou the OTP at your number',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
            PinCodeTextField(
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
            ).paddingOnly(left: 5,right: 5),
                Center(
                  child: Obx(
                        ()=> Text(
                      controller.time.value == "00:01"?"00:00":controller.time.value.toString(),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.yellow, fontSize:14,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                //
                //


                SizedBox(
                  height: Get.height * 0.08,
                ),
                Center(
                  child: Text(
                    'Resend the code if not received?',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.yellow,fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: InkButton(
                    onTap: () {

                      Get.offAllNamed(AppRoutes.registration);
                      // controller.onVerify();
                    },
                    child: Text('Verify',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ).paddingOnly(
                top: Get.height * 0.16,
                left: Get.width * 0.09,
                right: Get.width * 0.09),
          ),
        ],
      ),
    );
  }
}
