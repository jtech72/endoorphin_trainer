import 'package:endoorphin_trainer/utils/exports.dart';
class BookingDetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CountryCodeController());
  }

}