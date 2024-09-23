import 'package:get/get.dart';
import '../utils/exports.dart';
class MoreAboutYouController extends GetxController{
  RxList<String> photo = ['Front','End'].obs;
  RxInt selectedIndex = (-1).obs;
  RxBool isFrontImageVisible = true.obs;
  RxBool isFrontImageVisible1 = true.obs;
  RxBool isFrontImageVisible2 = true.obs;
  List<String> newList = <String>[];
RxBool isChecked = false.obs;
  List<String>item =[
  'Clear Images: Ensure documents are clear, not blurry.',
  'Correct Naming: Upload each document with its respective name.',
  'Alignment: Properly align the camera for accurate capture.',
  'Review & Submit: Double-check all documents before submitting.'];
  List<String>categoryname=['Emirates ID','Passport'];



  RxBool isButtonVisible = false.obs;

  void showButton(bool value) {
    isButtonVisible.value = value;
  }
}


