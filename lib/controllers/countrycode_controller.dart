

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/exports.dart';

class CountryCodeController extends GetxController {
  final phoneNumber = TextEditingController();
  String countryCode = "+971";
  dynamic finalOTP;

  void onNext() async {
    // if (phoneNumber.text.isNotEmpty) {
    //   if (phoneNumber.text.length < 9) {
    //     showSnackBar("Please enter valid phone number");
    //   } else {
    //     await CallAPI.sentOTP(request: {
    //       "phoneNumber": "$countryCode${phoneNumber.text.trim()}"
    //     }).then((value) {
    //       if (value.status == 200) {
    //         finalOTP = value.otp;
    //         showSnackBar("${value.otp}");
    //         Get.toNamed(AppRoutes.otp);
    //       }
    //     });
    //   }
    // } else {
    //   showSnackBar("Please enter your phone number");
    // }
  }
}
