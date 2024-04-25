import 'dart:developer';

import '../utils/exports.dart';

class MoreAboutYouController extends GetxController{
  RxInt selectedIndex = (-1).obs;
  RxList<String> getCatergory = <String>[].obs;
  List<String> newList = <String>[];

  List<String>item =[
  'Clear Images: Ensure documents are clear, not blurry.',
  'Correct Naming: Upload each document with its respective name.',
  'Alignment: Properly align the camera for accurate capture.',
  'Review & Submit: Double-check all documents before submitting.'];
  List<String>categoryname=['Emirates','Passport'];



  RxBool isButtonVisible = false.obs;

  void showButton(bool value) {
    isButtonVisible.value = value;
  }
  @override
  void onInit() {
    getCatergory.value = Get.arguments;
    newList = List.from(categoryname)..addAll(getCatergory);
    log("list of category${newList}");

    super.onInit();
  }
}

