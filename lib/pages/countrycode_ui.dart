import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/material.dart';


class CountryCodeUI extends StatelessWidget {
  const CountryCodeUI({super.key});

  @override
  Widget build(BuildContext context) {
    CountryCodeController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height*.3,
            ),
            Center(
              child: SizedBox(
                  height: 55.0,
                  width: 259.03,
                  child: Image.asset(ImagesPaths.logoimg)),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              'Phone Number',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Container(

              decoration: BoxDecoration(
                  color: AppColors.yellowishWhite,
                  borderRadius: BorderRadius.circular(5)),

              height: 50,
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                      width: 121,
                      child: CountryCodePicker(
                         searchDecoration: const InputDecoration(

                           hintText: "search your country code",
                             hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.white),
                             filled: true,fillColor:  Colors.black54),
                          dialogSize: Size(Get.width, Get.height),
                          boxDecoration: const BoxDecoration(),
                          barrierColor: AppColors.blackShade,
                          searchStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),
                        dialogTextStyle: const TextStyle(color: Colors.white),
                          dialogBackgroundColor: Colors.black54,
                        showFlagDialog: true,
                        showDropDownButton: false,
                        textStyle: const TextStyle(color: AppColors.black,fontWeight: FontWeight.w400),
                        initialSelection: controller.countryCode,
                        onChanged: (CountryCode v) {
                          controller.countryCode = v.dialCode!;
                        }



                      )),
                  Transform.translate(offset: const Offset(-30,0),
                  child: const Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.greyButton,)),
                  Transform.translate(
                    offset: const Offset(-20, 0),
                    child: SizedBox(
                      height: 50,
                      width: Get.width * 0.52,
                      child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(64),
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          maxLength: 12,
                          controller: controller.phoneNumber,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.black),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: Get.height*.004),
                              counterText: "",
                              hintText: 'Enter Phone Number',
                              hintStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              border: InputBorder.none,
                              fillColor: AppColors.yellowishWhite)),


                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            Center(
              child: InkButton(
                  child: Text(
                    'Next',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.black),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoutes.otp);
                    // controller.onNext();
                  }),
            )
          ],
        ).paddingOnly(left: 18, right: 18, ),
      ),
    );
  }
}
