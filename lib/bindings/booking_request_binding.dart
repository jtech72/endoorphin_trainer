import 'package:endoorphin_trainer/utils/exports.dart';
class BookingRequestBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BookingRequestController());
  }
}