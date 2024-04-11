import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_controller.dart';
import '../custom_Widgets/common_widgets.dart';


class OtpUI extends StatelessWidget {
  const OtpUI({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
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
              'Check your phone. We’ve sent\nyou the PIN at your number',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: Get.height * 0.04,
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
                    fieldWidth: 40,
                    inactiveColor: AppColors.lightGrey,
                    selectedColor: AppColors.yellow,
                    activeColor: AppColors.yellow,
                  inactiveBorderWidth: 1,
                  selectedBorderWidth: 1,
                  activeBorderWidth: 1

                ),
                autoDisposeControllers: true,
                enablePinAutofill: true,
                appContext: context,
                hintStyle: TextStyle(color: AppColors.grey,fontSize: 22),
                hintCharacter: '●',
                blinkWhenObscuring: true,
                cursorColor: AppColors.yellow,
                keyboardType: TextInputType.number,
                backgroundColor: AppColors.backgroundBlack,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                length: 6),
            // Center(
            //   child: Obx(
            //     ()=> Text(
            //       '${controller.time.value} ',
            //       style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.yellow, fontSize:14,fontWeight: FontWeight.w700),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: Get.height * 0.15,
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
              height: Get.height * 0.029,
            ),
            Center(
              child: InkButton(
                onTap: () {
                  // controller.onVerify();
                },
                child: Text('Verify',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black)),
              ),
            ),
          ],
        ).paddingOnly(
            top: Get.height * 0.16,
            left: Get.width * 0.09,
            right: Get.width * 0.09),
      ),
    );
  }
}
