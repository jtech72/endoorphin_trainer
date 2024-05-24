import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/exports.dart';

class CountryCodeUI extends StatelessWidget {
  CountryCodeUI({super.key});

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    CountryCodeController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPaths.bgBlackShade),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.023),
              Transform.translate(
                offset: Offset(-5, 0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.white,
                  ),
                ).paddingOnly(top: Get.height * 0.04),
              ),
              SizedBox(
                height: Get.height * .14,
              ),
              Center(
                child: Container(
                  height: 55,
                  width: 259.03,
                  child: Image.asset(ImagesPaths.logoimg),
                ),
              ),
              SizedBox(
                height: Get.height * .085,
              ),
              Text(
                'Country            Phone ',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.yellowishWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 50,
                width: Get.width,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 80,
                      child: Transform.translate(
                        offset: Offset(-2, 0),
                        child: GestureDetector(
                          onTap: () {
                            _focusNode.requestFocus();
                          },
                          child: Focus(
                            focusNode: _focusNode,
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                _focusNode.unfocus();
                              }
                            },
                            child: CountryCodePicker(
                              showDropDownButton: false,
                              showFlag: false,
                              searchDecoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                prefixIcon: Icon(
                                  CupertinoIcons.search,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                hintText: "Search your country code",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.black54,
                              ),
                              dialogSize: Size(Get.width, Get.height),
                              boxDecoration: const BoxDecoration(),
                              barrierColor: AppColors.greyButton,
                              searchStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              dialogTextStyle: const TextStyle(color: Colors.white),
                              dialogBackgroundColor: Colors.black54,
                              showFlagDialog: true,
                              textStyle: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              initialSelection: controller.countryCode,
                              onChanged: (CountryCode v) {
                                controller.countryCode = v.dialCode!;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height,
                      color: AppColors.grey,
                      width: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        _focusNode.requestFocus();
                      },
                      child: Transform.translate(
                        offset: Offset(-30, 0),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.greyButton,
                          size: 25,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: SizedBox(
                        height: 50,
                        width: Get.width * 0.52,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(64),
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          maxLength: 9,
                          controller: controller.phoneNumber,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColors.black),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: Get.height * .004),
                            counterText: "",
                            hintText: 'Enter phone number',
                            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: AppColors.lightGrey,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            fillColor: AppColors.yellowishWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .07,
              ),
              Center(
                child: InkButton(
                  child: Text(
                    'Next',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                      color: AppColors.black,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onTap: () {
                    controller.onNext();
                  },
                ),
              )
            ],
          ).paddingOnly(
            left: 25,
            right: 25,
          ),
        ),
      ),
    );
  }
}
