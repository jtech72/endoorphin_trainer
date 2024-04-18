import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController{
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;

  void toggleCheckbox1() {
    isChecked1.value = !isChecked1.value;
  }

  void toggleCheckbox2() {
    isChecked2.value = !isChecked2.value;
  }

  void toggleCheckbox3() {
    isChecked3.value = !isChecked3.value;
  }

}

