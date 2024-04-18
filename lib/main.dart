import 'package:endoorphin_trainer/utils/app_pages.dart';
import 'package:endoorphin_trainer/utils/app_strings.dart';
import 'package:endoorphin_trainer/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const EndoorphinTrainer());
}

class EndoorphinTrainer extends StatelessWidget {
  const EndoorphinTrainer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppThemes.appTheme,
    );
  }
}


