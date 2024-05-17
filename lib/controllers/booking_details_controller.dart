import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';
class BookingDetailsController extends GetxController{
RxString bookingType = ''.obs;
@override
  void onInit() {
    bookingType.value=Get.arguments;
    log('${bookingType.value}');
    super.onInit();
  }
}