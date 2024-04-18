import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/booking_request_controller.dart';



class BookingRequestBinding   implements Bindings{

  @override
  void dependencies() {
    Get.put(BookingRequestController());
  }

}