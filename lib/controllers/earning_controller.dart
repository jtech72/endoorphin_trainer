import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/models/response_models/get_monthly_data.dart';
class EarningController extends GetxController{
  RxString type = "".obs;
  RxString totalEarnings = "".obs;
  RxString totalSession = "".obs;
  RxString totalAmount = "0.0".obs;
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<String> days = ['1-7','8-14','15-21','21-28','29-31'  ];
  late List<dynamic> weeklyData = [];
  late List<RevenueByDay> monthlyData = [];
  var isWeekly = true.obs;
  Rx<int> tappedIndex = (-1).obs;
  var tooltipVisible = false.obs;
  Timer? _tooltipTimer;
  void showTooltip() {
    tooltipVisible.value = true;
    _tooltipTimer?.cancel();
    _tooltipTimer = Timer(const Duration(seconds: 3), () {
      tooltipVisible.value = false;
    });
  }

  @override
  void onClose() {
    _tooltipTimer?.cancel();
    super.onClose();
  }
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
      totalAmount.value = result.result == 0?"0": result.result!.amount.toString();
    }
  }
@override
  void onInit() {
  getWalletAmount();
  super.onInit();
  }

}
