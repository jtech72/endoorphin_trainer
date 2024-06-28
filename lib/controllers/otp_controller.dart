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
  Map<String, dynamic>? userDetails;
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
    startTimer(59);
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
        startTimer(59);

        secondOtp = value.otp;
        if (value.status == 200) {
          showSnackBar("${value.otp}");
        }
      });
    }

  }

  void onNumberVerify() {
    showLoader();

    String otp = otpController.text.trim();

    if (otp.isEmpty) {
      dismissLoader();
      showSnackBar("Please enter a valid OTP");
      return;
    }

    if (otp.length != 6) {
      dismissLoader();
      showSnackBar("Invalid OTP");
      return;
    }

    try {
      int enteredOtp = int.parse(otp);
      if (enteredOtp == countryCodeController.finalOTP || enteredOtp == secondOtp) {
        dismissLoader();
        Get.toNamed(AppRoutes.registration);
        printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
      } else {
        dismissLoader();
        showSnackBar("Invalid OTP");
      }
    } catch (e) {
      dismissLoader();
      showSnackBar("Invalid OTP format");
    }
  }
  void onEmailVerify() {
    showLoader();

    String otp = otpController.text.trim();

    if (otp.isEmpty) {
      dismissLoader();
      showSnackBar("Please enter a valid OTP");
      return;
    }

    if (otp.length != 6) {
      dismissLoader();
      showSnackBar("Invalid OTP");
      return;
    }

    try {
      int enteredOtp = int.parse(otp);
      if (enteredOtp == countryCodeController.finalOTP || enteredOtp == secondOtp) {
        dismissLoader();
        Get.toNamed(AppRoutes.registration);
        printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
      } else {
        dismissLoader();
        showSnackBar("Invalid OTP");
      }
    } catch (e) {
      dismissLoader();
      showSnackBar("Invalid OTP format");
    }
  }
  @override
  void onInit() {
    phoneNumber = Get.arguments;

    log(phoneNumber.toString());
    super.onInit();
  }
}
