import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/countrycode_controller.dart';

class BookingDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CountryCodeController());
  }

}