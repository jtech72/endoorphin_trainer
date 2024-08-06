import 'dart:developer';
import 'package:endoorphin_trainer/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import '../utils/exports.dart';

class RegistrationUi extends StatelessWidget {
  RegistrationUi({super.key});
  RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.signinoption, (route) => false);
        return false;
      },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              toolbarHeight: 50,
              leadingWidth: Get.width * 0.14,
              centerTitle: false,
              leading: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.signinoption);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white,
                    size: 18,
                  )),
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signinoption);
                    },
                    child: Transform.translate(
                      offset: const Offset(-25, 0),
                      child: Text(
                        "Welcome to ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-25, -2),
                    child: Image.asset(
                      ImagesPaths.logoimg,
                      scale: 4.2,
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagesPaths.bgBlackShade),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Please enter your details to create an account.",
                        style: Theme.of(context).textTheme.displayLarge,
                      ).paddingOnly(
                        bottom: Get.height * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "First Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.impgrey),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: controller.firstNameController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),

                              ],
                              enableInteractiveSelection: true,
                              style: Theme.of(context).textTheme.labelMedium,
                              cursorColor: AppColors.grey,
                              cursorHeight: 18,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.yellowishWhite,
                                border: InputBorder.none,
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 3, left: 15),

                                hintText: "Enter First Name",
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ), // Center the hintText
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Last Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.impgrey),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: controller.lastNameController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),

                              ],
                              enableInteractiveSelection: true,
                              style: Theme.of(context).textTheme.labelMedium,
                              cursorColor: AppColors.grey,
                              cursorHeight: 18,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.yellowishWhite,
                                border: InputBorder.none,
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 3, left: 15),

                                hintText: "Enter Last Name",
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ), // Cen// Center the hintText
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Email",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.impgrey),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              enableInteractiveSelection: true,
                              style: Theme.of(context).textTheme.labelMedium,
                              cursorColor: AppColors.grey,
                              cursorHeight: 18,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.yellowishWhite,
                                border: InputBorder.none,
                                hintStyle: Theme.of(context).textTheme.labelMedium,
                                contentPadding:
                                    const EdgeInsets.only(bottom: 3, left: 15),
                                hintText: "Enter Email",
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.yellowishWhite,
                                    width: 1,
                                  ),
                                ), // Cen// Center the hintText
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Obx(
                                () => Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.impgrey),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                onChanged: (v) {
                                  controller.isValidVisible.value = !controller.isPasswordValid(v);
                                },
                                controller: controller.passwordController,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(64),
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                ],
                                obscureText: controller.obscureText.value,
                                obscuringCharacter: '*',
                                enableInteractiveSelection: true,
                                style: Theme.of(context).textTheme.labelMedium,
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
                                  hintStyle: Theme.of(context).textTheme.labelMedium,
                                  contentPadding: const EdgeInsets.only(bottom: 3, left: 15),
                                  hintText: "Enter Password",
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                                () => Visibility(
                              visible: controller.isValidVisible.value,
                              child: Text(
                                "Your password must contain at least one uppercase letter, one number, and one special character",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.red),
                              ).paddingOnly(top: 5),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Confirm Password",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Obx(
                            () => Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.impgrey),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: controller.confirmPasswordController,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(64),
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                ],
                                obscureText: controller.obscureText1.value,
                                obscuringCharacter: '*',
                                enableInteractiveSelection: true,
                                style: Theme.of(context).textTheme.labelMedium,
                                cursorColor: AppColors.grey,
                                cursorHeight: 18,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    highlightColor: Colors.transparent,
                                    icon: Icon(
                                      controller.obscureText1.value
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      controller.toggleObscureText1();
                                    },
                                  ),
                                  filled: true,
                                  fillColor: AppColors.yellowishWhite,
                                  border: InputBorder.none,
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 3, left: 15),
                                  hintText: "Enter Confirm Password",
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                      color: AppColors.yellowishWhite,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Gender",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                log("${controller.isOptionsVisible.value}");
                                controller.isOptionsVisible.value =
                                    !controller.isOptionsVisible.value;
                              },
                              child: Container(
                                height: 45,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.impgrey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width * 0.035),
                                      child: Text(
                                        controller.selectedOption1.value.isEmpty
                                            ? "Select Gender"
                                            : controller.selectedOption1.value,
                                        style: const TextStyle(
                                          color: AppColors.lightGrey,
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                            controller.isOptionsVisible.value ==
                                                    false
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_up,
                                            size: 32,
                                            color: AppColors.grey4)
                                        .paddingOnly(right: 8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: controller.isOptionsVisible.value,
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: AppColors.impgrey),
                                  ),
                                  child: Column(
                                    children: controller.items2.map((String value) {
                                      return ListTile(
                                        title: Text(
                                          value,
                                          style:
                                              TextStyle(color: AppColors.lightGrey),
                                        ),
                                        onTap: () {
                                          controller.selectedOption1.value = value;
                                          controller.toggleOptionsVisibility();
                                          print(controller.selectedOption1.value);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Categories you want to provide coaching on",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14),
                              ).paddingOnly(top: 15, bottom: 8),
                              Text(
                                " *",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(fontSize: 14, color: Colors.red),
                              ).paddingOnly(top: 15, bottom: 8),
                            ],
                          ),
                          Obx(() {
                            if (controller.categories.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              ).paddingOnly(top: 20);
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Implement logic to toggle visibility of categories container
                                    controller
                                        .toggleVisibility(); // Assuming you have a method for this in your controller
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: AppColors.yellowishWhite,
                                      border: Border.all(
                                          color: Colors
                                              .transparent), // Example border styling
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller
                                                    .selectedItemsName.value.isEmpty
                                                ? "Select categories"
                                                : controller.selectedItemsName.value
                                                    .join(", "),
                                            style: const TextStyle(
                                              color: AppColors.lightGrey,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          controller.isCategoriesVisible.value ==
                                                  false
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_up,
                                          size: 32,
                                          color: AppColors.grey4,
                                        ),
                                      ],
                                    ).paddingOnly(left: 15, right: 8),
                                  ),
                                ).paddingOnly(bottom: 5),
                                Visibility(
                                  visible: controller.isCategoriesVisible.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.yellowishWhite,
                                      border: Border.all(
                                          color: Colors
                                              .transparent), // Example border styling
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: controller.categories.map((item) {
                                        return CheckboxListTile(
                                          checkColor: AppColors.black,
                                          title: Text(
                                            item.name ?? '',
                                            style: const TextStyle(
                                              color: AppColors.lightGrey,
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          value: controller.selectedItems
                                              .contains(item.id.toString()),
                                          onChanged: (bool? value) {
                                            controller.toggleSelection(
                                                item.id.toString(),
                                                item.name.toString());
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ).paddingOnly(top: 0, bottom: Get.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkButton(
                              child: Text(
                                "Continue",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat'),
                              ),
                              onTap: () {
                                controller.onContinueButton();
                              }),
                        ],
                      ).paddingOnly(top: 30, bottom: 30),
                    ],
                  ).paddingOnly(left: 18, right: 18),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
