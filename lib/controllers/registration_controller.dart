import 'dart:ffi';

import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
class RegistrationController extends GetxController{
  final items = [ "Yoga","Padel Tennis","Swimming","Tennis","Boxing","Personal Training"];
  final items2 = ['Male','Female',];
  RxString selectedItem = 'Male'.obs;
  RxList<String> selectedOne = <String>[].obs;
  RxList<String> selectedOne2 = <String>[].obs;
  final List<String> dataList = [
    'Yoga',
    'Tennis',
    'Swimming',
    'Boxing',
    'Padel Tannis',
    'Personal Training',
    'Football',
  ];
  void setSelectedItem(String value) {
    selectedItem.value = value;
  }
  RxList<bool> checkedList = <bool>[].obs;

  void toggleItem(String item, int index) {
    if (checkedList.length <= index) {
      // Expand the list to accommodate the new item's index
      checkedList.addAll(List.filled(index - checkedList.length + 1, false));
    }
    checkedList[index] = !checkedList[index]; // Toggle the checked state
  }


  // Define an observable variable to track the selected option
  final selectedOption = 'Yoga''Tennis'.obs;
  final selectedOption1 = 'Select'.obs;
}
