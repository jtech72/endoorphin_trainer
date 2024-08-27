import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../services/models/request_models/withdraw_request_model.dart';
class WithdrawController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var selectedItems = <String>[].obs;

  void toggleSelection(String id) {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
  }
  RxDouble totalBalance = 0.0.obs;

  // Function to post data
  Future<void> postWithdrawRequest() async {
    var request = {
      "trainerId":"${storage.read("userId")}",
      "bookingId": selectedItems.value,
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
