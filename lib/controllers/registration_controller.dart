import 'package:endoorphin_trainer/utils/exports.dart';
class RegistrationController extends GetxController{
  final items = ['Male', 'Female', 'Others'];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }
}
