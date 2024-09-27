import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/models/request_models/withdraw_request_model.dart';
import 'package:http/http.dart'as http;
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
      "bookingId": selectedItems,
    };

    try {
      WithdrawRequestModel result = await CallAPI.withdrawReq(request: request);
      if (result.status == 200) {
        log('Withdraw request successful');
      } else {
        log('Withdraw request failed');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  //save image
  saveNetworkImage(String url) async {
    try{
      showLoader();
      log("message");

      // Fetch the image data using http
      final response = await http.get(Uri.parse(url));
      log("messageq");

      if (response.statusCode == 200) {
        dismissLoader();
        // Save the image to the gallery without decoding it as JSON
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.bodyBytes),
            quality: 60,
            name: "Image");
        log("done");
          showSnackBar("Payment slip downloaded in Gallery");
        log(result);
      } else {
        dismissLoader();
        log("Failed to download image");
      }
    }catch(e,st){
      dismissLoader();
      log("ERROR-> ",error: e.toString(),stackTrace: st);
    }

  }

}
