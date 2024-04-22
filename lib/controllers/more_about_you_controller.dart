import '../utils/exports.dart';

class MoreAboutYouController extends GetxController{
  RxInt selectedIndex = (-1).obs;
List<String>item =[
  'Clear Images: Ensure documents are clear, not blurry.',
  'Correct Naming: Upload each document with its respective name.',
  'Alignment: Properly align the camera for accurate capture.',
  'Review & Submit: Double-check all documents before submitting.'];
  List<String>categoryname=['Emirates ID','Passport','Certification'];
List<String>categorysubname=['Upload your Emirates ID ...','Upload your passport ...','Upload your Certification ...'];



  RxBool isButtonVisible = false.obs;

  void showButton(bool value) {
    isButtonVisible.value = value;
  }
}

