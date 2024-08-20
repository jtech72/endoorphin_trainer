import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/models/response_models/get_monthly_data.dart';

class EarningController extends GetxController{
  RxString type = "".obs;
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
  Future<void> getMonthlyData()async{
    try{
      final response = await CallAPI.getMonthlyData(trainerId: storage.read("userId").toString());
      if(response.status == 200){

      }
    }
        catch(e,st){
      log(e.toString());
      log(st.toString());

        }
  }

}
