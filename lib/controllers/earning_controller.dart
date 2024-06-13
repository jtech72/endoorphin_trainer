import 'package:endoorphin_trainer/utils/exports.dart';

class EarningController extends GetxController{
  List<String> days = ['7','8','9','10','11','12','13','14'];
  var isWeekly = true.obs;
  Rx<int> tappedIndex = (-1).obs;
  void toggleView() {
    isWeekly.value = !isWeekly.value;
    update();
  }
  void updateTappedIndex(int index) {
    tappedIndex.value = index;
    update(); // Make sure to call update() to notify listeners

  }
}