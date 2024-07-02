import 'package:endoorphin_trainer/utils/exports.dart';

class EarningController extends GetxController{
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<String> days = ['1-7','8-14','15-21','21-28','29-31'  ];
  /////
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