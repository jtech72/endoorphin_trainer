import 'dart:developer';
import 'dart:io';

import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TrainerPassportController extends GetxController{
  int?  documentIndex ;


  @override
  void onInit() {
    documentIndex = Get.arguments;
    print(documentIndex.toString());
    super.onInit();
  }
}