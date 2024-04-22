import 'package:endoorphin_trainer/utils/exports.dart';
class RegistrationController extends GetxController{
  final items = [ "Yoga","Padel Tennis","Swimming","Tennis","Boxing","Personal Training"];
  final items2 = ['Male','Female',];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }

  final List<String> dataList = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  // Define an observable variable to track the selected option
  final selectedOption = 'Yoga''Tennis'.obs;
  final selectedOption1 = 'Select'.obs;
}
