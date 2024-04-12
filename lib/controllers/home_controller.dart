import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = ["Bookings","Sessions","Sessions","Sessions","Revenue"];
  RxInt selectedIndex = (-1).obs;
}