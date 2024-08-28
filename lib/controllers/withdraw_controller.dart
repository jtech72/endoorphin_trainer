import 'dart:convert';
import 'dart:developer';

import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
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
            Uint8List.fromList(response.bodyBytes), // Use response.bodyBytes for raw bytes
            quality: 60,
            name: "hello");
        log("done");
          showSnackBar("Payment slip downloaded");
        print(result);
      } else {
        dismissLoader();
        print("Failed to download image");
      }
    }catch(e,st){
      dismissLoader();
      log("ERROR-> ",error: e.toString(),stackTrace: st);
    }

  }

}
