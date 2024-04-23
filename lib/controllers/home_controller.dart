import 'package:endoorphin_trainer/utils/exports.dart';

class HomeController extends GetxController {
  RxBool isTrainerOnline = false.obs;
  List<String> quickGlanceList = ["Earnings", "Sessions","Sessions","Sessions",];
  RxInt selectedIndex = (-1).obs;

  final items = [ "Yoga","Padel Tennis","Swimming","Tennis","Boxing","Personal Training"];
  final items2 = ['Male','Female',];
  RxString selectedItem = 'Male'.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }



  // Define an observable variable to track the selected option
  final selectedOption = 'Yoga''Tennis'.obs;
  final selectedOption1 = 'Select'.obs;
}