import 'package:endoorphin_trainer/utils/exports.dart';

class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = ["Bookings","Sessions","Sessions","Sessions","Revenue"];
  RxInt selectedIndex = (-1).obs;
}