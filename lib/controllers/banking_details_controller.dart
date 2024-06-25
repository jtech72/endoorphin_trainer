import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../services/network_services/api_call.dart';
class BankingDetailsController extends GetxController {
  final items2 = ['CURRENT ACCOUNT', 'SAVING ACCOUNT'];
  String accountType = "";
  RxString selectedOption1 = 'ACCOUNT TYPE'.obs;
  final ifscController = TextEditingController();
  final bankNameController = TextEditingController();
  final cityController = TextEditingController();
  final branchController = TextEditingController();
  final accountNameController = TextEditingController();
  final bankAcNumberController = TextEditingController();
  final confirmBankAcNumberController = TextEditingController();
  final accountTypeController = TextEditingController();
  final effectiveController = TextEditingController();

  var buttonText = 'Save'.obs;

  @override
  void onInit() {
    super.onInit();
    ever(selectedOption1, (_) {
      accountTypeController.text = selectedOption1.value;
    });
  }

  Future<bool> onSaveAndSubmitBooking() async {
    if (ifscController.text.isEmpty ||
        bankNameController.text.isEmpty ||
        cityController.text.isEmpty ||
        branchController.text.isEmpty ||
        selectedOption1.value == 'ACCOUNT TYPE' ||
        accountNameController.text.isEmpty ||
        bankAcNumberController.text.isEmpty ||
        confirmBankAcNumberController.text.isEmpty ||
        effectiveController.text.isEmpty || selectedOption1.value == 'ACCOUNT TYPE') {
      showSnackBar("Please fill all the fields");
      return false;
    } else {
      final saveBankDetailModel = {
        "ifscCode": ifscController.text.trim(),
        "trainerId": "${storage.read("userId")}",
        "bankName": bankNameController.text.trim(),
        "city": cityController.text.trim(),
        "branchName": branchController.text.trim(),
        "accountName": accountNameController.text.trim(),
        "banckAccountNumber": bankAcNumberController.text.trim(),
        "accountType": selectedOption1.value,
        "effectiveData": effectiveController.text.trim(),
      };

      try {
        final response = await CallAPI.saveBankDetail(request: saveBankDetailModel);
        if (response.status == 200) {
          if (kDebugMode) {
            print("Bank details saved successfully");
          }
          buttonText.value = 'Update'; // Change button text to Update
          Get.toNamed(AppRoutes.bottomNavigation);
          return true;
        } else {
          print('Saving bank details failed: ${response.message}');
          showSnackBar('Saving bank details failed: ${response.message}');
          return false;
        }
      } catch (e) {
        print('Error: $e');
        showSnackBar('Error: $e');
        return false;
      }
    }
  }

  void updateUser(String id) async {
    showLoader();
    try {
      Map<String, String> fields = {
        "id":id ,
        'ifscCode': ifscController.value.text.trim(),
        'bankName': bankNameController.value.text.trim(),
        'branchName': branchController.value.text.trim(),
        'accountName': accountNameController.value.text.trim(),
        'banckAccountNumber': bankAcNumberController.value.text.trim(),
        'accountType': selectedOption1.value.trim(),
        'effectiveData': effectiveController.value.text.trim(),
        'city': cityController.value.text.trim(),
      };
      log("Updating user with fields: $fields");

      final response = await CallAPI.updateBankDetail(request: fields);
      log("Update response: $response");

      if (response.status == 200) {
        dismissLoader();
        Get.offAllNamed(AppRoutes.bottomNavigation);
        showSnackBar(response.message.toString());
        log('User details updated successfully: ${response.message}');
      } else {
        dismissLoader();
        showSnackBar(response.message.toString());
        log('Failed to update user details: ${response.message}');
      }
    } catch (e, st) {
      dismissLoader();
      log('Error updating user details: $e', stackTrace: st);
    }
  }
  Future<void> onSaveButton() async {
    try {
      final response = await CallAPI.getBankDetail(id: storage.read("userId").toString());
      if (response.result == null) {
        log("message");
        onSaveAndSubmitBooking();
      } else {
        updateUser(response.result!.id.toString());
      }
    } catch (e) {
      // Handle the error (e.g., show a message to the user)
      print('Error: $e');
    }
  }

}
