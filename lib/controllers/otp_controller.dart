
import 'package:endoorphin_trainer/utils/exports.dart';

class OtpController extends GetxController {
  // CountryCodeController countryCodeController = Get.put(CountryCodeController());
  //
  // final otpController = TextEditingController();
  // Timer? _timer;
  // int remainingSeconds = 60;
  // final time = '00.00'.obs;
  // RxBool isPaused = false.obs;
  //
  // void startTimer(int seconds) {
  //   const duration = Duration(seconds: 1);
  //   remainingSeconds = seconds;
  //   _timer = Timer.periodic(duration, (Timer timer) {
  //     if (!isPaused.value) {
  //       if (remainingSeconds == 0) {
  //         timer.cancel();
  //       } else {
  //         int minutes = remainingSeconds ~/ 60;
  //         int seconds = (remainingSeconds % 60);
  //         time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  //         remainingSeconds--;
  //       }
  //     }
  //   });
  // }
  // @override
  // void onReady() {
  //   startTimer(60);
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //   super.onClose();
  // }
  // void onVerify() {
  //   if (otpController.text.trim().isNotEmpty) {
  //     if (otpController.text.trim().length == 6) {
  //       if (countryCodeController.finalOTP ==
  //           int.parse(otpController.text.trim())) {
  //         Get.offAllNamed(AppRoutes.signup);
  //         printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
  //       } else {
  //         showSnackBar("Invalid OTP");
  //       }
  //     }
  //   } else {
  //     showSnackBar("Please enter a valid OTP");
  //   }
  //}
}
