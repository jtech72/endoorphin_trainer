import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/booking_request_controller.dart';



class BookingRequestBinding   implements Bindings{

  @override
  void dependencies() {
    Get.put(BookingRequestController());
  }

}