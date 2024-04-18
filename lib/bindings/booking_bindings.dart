import 'package:endoorphin_trainer/controllers/booking_controller.dart';
import 'package:endoorphin_trainer/utils/exports.dart';


class BookingBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BookingController());
  }

}