import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/models/response_models/get_monthly_data.dart';

class EarningController extends GetxController{
  RxString type = "".obs;
  RxString totalEarnings = "".obs;
  RxString totalSession = "".obs;
  RxString totalAmount = "".obs;
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<String> days = ['1-7','8-14','15-21','21-28','29-31'  ];
  late List<dynamic> weeklyData = [];
  late List<RevenueByDay> monthlyData = [];
  var isWeekly = true.obs;
  Rx<int> tappedIndex = (-1).obs;
  void toggleView() {
    isWeekly.value = !isWeekly.value;
    update();
  }
  void updateTappedIndex(int index) {
    tappedIndex.value = index;
    update();

  }
  Future<void> getWalletAmount()async{
    final result = await CallAPI.getWalletAmount(trainerId: storage.read("userId").toString());
    if(result.status == 200){
      totalAmount.value = result.result.toString();
    }
  }
@override
  void onInit() {
  getWalletAmount();
  super.onInit();
  }

}
