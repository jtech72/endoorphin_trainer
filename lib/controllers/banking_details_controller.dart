import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../services/network_services/api_call.dart';

class BankingDetailsController extends GetxController{
  final items2 = ['CURRENT ACCOUNT','SAVING ACCOUNT'];
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

  @override
  void onInit() {
    super.onInit();
    ever(selectedOption1, (_) {
      accountTypeController.text = selectedOption1.value;
    });
  }

  void onSaveAndSubmitBooking() async {
    if (ifscController.text.isEmpty ||
        bankNameController.text.isEmpty ||
        cityController.text.isEmpty ||
        branchController.text.isEmpty ||
        selectedOption1.value == 'ACCOUNT TYPE' ||
        accountNameController.text.isEmpty ||
        bankAcNumberController.text.isEmpty ||
        confirmBankAcNumberController.text.isEmpty ||
        effectiveController.text.isEmpty||selectedOption1.value=='ACCOUNT TYPE') {
      showSnackBar("Please fill all the fields");
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
          Get.toNamed(AppRoutes.earning);
        } else {
          print('Saving bank details failed: ${response.message}');
          showSnackBar('Saving bank details failed: ${response.message}');
        }
      } catch (e) {
        print('Error: $e');
        showSnackBar('Error: $e');
      }
    }
  }
}
