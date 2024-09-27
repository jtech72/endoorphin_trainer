import 'package:flutter/material.dart';
import '../utils/exports.dart';
class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: Get.height * .49,
                      width: Get.width * 9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage(
                            ImagesPaths.loginImage,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Image.asset(ImagesPaths.imagelogin),
                    Positioned(
                      left: Get.width * 0.03,
                      bottom: Get.height * 0.05,
                      child: Text(
                        'Nice to see you again,\nLet’s Begin ...',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ).paddingOnly(bottom: 50, left: Get.width * .05),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0, -70),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * .05, right: Get.width * .05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Country             Phone",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ).paddingOnly(
                            bottom: Get.height * .008,
                            top: Get.height * .02),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.lightWhite),
                              borderRadius: BorderRadius.circular(5)),
                          height: 50,
                          width: Get.width,
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width: 80,
                                  child: Transform.translate(
                                    offset: const Offset(-6, 0),
                                    child: CountryCodePicker(
                                      showDropDownButton: false,
                                      showFlag: false,
                                      searchDecoration:
                                          const InputDecoration(
                                        hintText:
                                            "Search your country code",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: Colors.white),
                                        filled: true,
                                        fillColor: Colors.black54,
                                      ),
                                      dialogSize:
                                          Size(Get.width, Get.height),
                                      boxDecoration:
                                          const BoxDecoration(),
                                      barrierColor:
                                          AppColors.greyButton,
                                      searchStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.white),
                                      dialogTextStyle: const TextStyle(
                                          color: Colors.white),
                                      dialogBackgroundColor:
                                          Colors.black54,
                                      showFlagDialog: true,
                                      textStyle: const TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w400),
                                      initialSelection:
                                          controller.countryCode,
                                      onChanged: (CountryCode v) {
                                        controller.countryCode =
                                            v.dialCode!;
                                      },
                                    ),
                                  )),
                              Container(
                                height: Get.height,
                                color: AppColors.lightGrey,
                                width: 1,
                              ),
                              Transform.translate(
                                  offset: const Offset(-30, 0),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.greyButton,
                                    size: 25,
                                  )),
                              Transform.translate(
                                offset: const Offset(-10, 0),
                                child: SizedBox(
                                  height: 50,
                                  width: Get.width * 0.52,
                                  child: TextField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                            64),
                                        FilteringTextInputFormatter
                                            .deny(RegExp(r'\s')),
                                      ],
                                      maxLength: 9,
                                      controller: controller
                                          .phoneNumberController,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: AppColors.black),
                                      keyboardType:
                                          TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(
                                                  top:
                                                      Get.height * .00),
                                          counterText: "",
                                          hintText:
                                              'Enter phone number',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  color: AppColors
                                                      .lightGrey,
                                                  fontSize: 14),
                                          border: InputBorder.none,
                                          fillColor: AppColors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Password",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ).paddingOnly(
                            bottom: Get.height * .008,
                            top: Get.height * .02),
                        Obx(
                          () => Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.impgrey),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: controller.passwordController,
                              obscureText: controller.obscureText.value,
                              obscuringCharacter: "*",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')),
                              ],
                              enableInteractiveSelection: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.black),
                              cursorColor: AppColors.grey,
                              cursorHeight: 18,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    controller.obscureText.value
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    controller.toggleObscureText();
                                  },
                                ),
                                filled: true,
                                fillColor: AppColors.yellowishWhite,
                                border: InputBorder.none,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: AppColors.lightGrey,
                                        fontSize: 14),
                                contentPadding: const EdgeInsets.only(
                                    top: 10, left: 15),

                                hintText: "Enter your password",

                                alignLabelWithHint:
                                    true, // Center the hintText
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotPassword);
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: AppColors.yellow),
                                  children: const [
                                    TextSpan(
                                      text: 'Forgot ',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: 'Password',
                                      style: TextStyle(
                                          color: AppColors.yellow,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: ""),
                                    ),
                                    TextSpan(
                                      text: ' ?',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: ""),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ).paddingOnly(top: Get.height * .013),
                        Center(
                          child: inkButton(
                              child: Text(
                                "Log In",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat'),
                              ),
                              onTap: () {
                                controller.onLogin();
                              }).paddingOnly(top: Get.height * .17),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: Get.width * 0.035,
              top: Get.height * 0.045,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.signinoption);
                },
              ))
        ],
      )),
    );
  }
}
