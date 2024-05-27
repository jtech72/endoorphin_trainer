import 'dart:async';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/network_services/api_call.dart';
class OtpController extends GetxController {
  CountryCodeController countryCodeController = Get.put(CountryCodeController());

  final otpController = TextEditingController();
  Timer? _timer;
  RxBool showResendText = false.obs;

  int remainingSeconds = 60;
  final time = '00.00'.obs;
  RxBool isPaused = false.obs;
  String ?phoneNumber;
  dynamic secondOtp;


  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (!isPaused.value) {
        if (remainingSeconds == 0) {
          timer.cancel();
          showResendText.value = true;  // Show resend text when timer reaches 00:00

        } else {
          int minutes = remainingSeconds ~/ 60;
          int seconds = (remainingSeconds % 60);
          time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
          remainingSeconds--;
        }
      }
    });
  }
  @override
  void onReady() {
    startTimer(60);
    super.onReady();
  }
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
  void resendOtp() async{
    if (time.value == "00:01"){
      await CallAPI.sentOTP(request: {
        "phoneNumber": phoneNumber
      }).then((value) {
        startTimer(60);

        secondOtp = value.otp;
        if (value.status == 200) {
          showSnackBar("${value.otp}");
        }
      });
    }

  }
  void onVerify() {
    showLoader();
    if (otpController.text.trim().isNotEmpty) {
      if (otpController.text.trim().length == 6) {
        if (countryCodeController.finalOTP == int.parse(otpController.text.trim())) {
          dismissLoader();
          Get.toNamed(AppRoutes.registration);
          printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
        } else if (secondOtp == int.parse(otpController.text.trim())) {
          dismissLoader();
          Get.toNamed(AppRoutes.registration);
          printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
        } else {
          dismissLoader();
          showSnackBar("Invalid OTP");

        }

      }
    } else {
      dismissLoader();
      showSnackBar("Please enter a valid OTP");
    }
  }
  @override
  void onInit() {
    phoneNumber = Get.arguments;
    log(phoneNumber.toString());
    super.onInit();
  }
}
