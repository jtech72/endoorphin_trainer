


import '../services/network_services/api_call.dart';
import '../utils/exports.dart';

class CountryCodeController extends GetxController {
  final phoneNumber = TextEditingController();
  String countryCode = "+971";
  dynamic finalOTP;

  void onNext() async {
    showLoader(color: AppColors.yellow);
    if (phoneNumber.text.isNotEmpty) {
      if (phoneNumber.text.length < 9) {
        dismissLoader();
        showSnackBar("Please enter valid phone number");
      } else {
        await CallAPI.sentOTP(request: {
          "phoneNumber": "$countryCode${phoneNumber.text.trim()}"
        }).then((value) {
          if (value.status == 200) {
            dismissLoader();
            finalOTP = value.otp;
            showSnackBar("${value.otp}");
            Get.toNamed(AppRoutes.otp,arguments:phoneNumber.text.toString() );
          }
        });
      }
    } else {
      dismissLoader();
      showSnackBar("Please enter your phone number");

    }
  }
}
