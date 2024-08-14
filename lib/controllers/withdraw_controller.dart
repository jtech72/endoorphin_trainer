import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/models/request_models/withdraw_request_model.dart';
class WithdrawController extends GetxController {
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  RxInt selectedIndex = 0.obs;

  // Data to be posted
  var bookingId = [];

  void toggleCheckbox1() {
    isChecked1.value = !isChecked1.value;
  }

  void toggleCheckbox2() {
    isChecked2.value = !isChecked2.value;
  }

  void toggleCheckbox3() {
    isChecked3.value = !isChecked3.value;
  }

  // Function to post data
  Future<void> postWithdrawRequest() async {
    var request = {
      "trainerId":"${storage.read("userId")}",
      "bookingId": bookingId,
    };

    try {
      WithdrawRequestModel result = await CallAPI.withdrawReq(request: request);
      if (result.status == 200) {
        print('Withdraw request successful');
      } else {
        print('Withdraw request failed');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
