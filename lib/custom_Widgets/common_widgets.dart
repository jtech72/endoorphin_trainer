import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
void printResult({
  required String screenName,
  String? msg,
  String? error,
  StackTrace? stackTrace,
}) {
  log(
    msg!,
    name: screenName,
    error: error,
    stackTrace: stackTrace,
  );
}

void showSnackBar(message) {
  Get.snackbar(
      duration: Duration(seconds: 6),
      colorText: AppColors.black,
      AppStrings.appName,
      "${message ?? "Something went wrong Status Code"}",
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.yellow);
}

Widget InkButton({
  double? borderRadius,
  double? height,
  double? width,
  Color backGroundColor = AppColors.yellow,
  Color? rippleColor,
  required Widget child,
  required Function onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(borderRadius ?? 36),
    color: backGroundColor,
    child: InkWell(
      splashColor: rippleColor ?? AppColors.lightGrey,
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      onTap: () {
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        } else {
          onTap();
        }
      },
      child: Container(
          decoration: const BoxDecoration(),
          alignment: Alignment.center,
          height: height ?? 35,
          width: width ?? Get.width * .3,
          child: child),
    ),
  );
}


AppBar myAppBar({
  Color?backGroundColor,
  List<Widget>? action,
  required Widget title,
  required BuildContext context,

}) {
  return AppBar(
    toolbarHeight: 50,
    leadingWidth: Get.width * 0.17,
    centerTitle: false,
    leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: const SizedBox(
            height: 30,
            width: 40,
            child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.lightGrey1,size: 18,))),
    title: title,
    surfaceTintColor: Colors.transparent,
    backgroundColor: backGroundColor??AppColors.black,
    elevation: 3,
    titleSpacing: -10,
    actions: action,
  );
}
AppBar myAppBar2({
  Color?backGroundColor,
  List<Widget>? action,
  required Widget title,
  required BuildContext context,

}) {
  return AppBar(
    toolbarHeight: 50,
    leadingWidth: Get.width * 0.17,
    centerTitle: false,
    leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: const SizedBox(
            height: 30,
            width: 40,
            child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.lightGrey1,size: 18,))),
    title: title,
    surfaceTintColor: Colors.transparent,
    backgroundColor: backGroundColor??AppColors.black,
    elevation: 3,
    titleSpacing: -10,
    actions: action,
  );
}

