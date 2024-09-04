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
  Map<String,dynamic>?phoneNumber;
  dynamic secondOtp;
  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (!isPaused.value) {
        if (remainingSeconds == 0) {
          timer.cancel();
          showResendText.value = true;

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
    startTimer(29);
    super.onReady();
  }
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }


  void resendOtp() async {
    log("z");
    try {
      if (phoneNumber!["otp"] != "" || phoneNumber!["phoneNumber"] != "") {
        showLoader();
          final response = await CallAPI.forgetPassword(request: {
            "loginData": phoneNumber!["email"],

          });
          startTimer(29);

          secondOtp = response.result!.otp.toString();
          countryCodeController.finalOTP = 0;
          if (response.status == 200) {
            dismissLoader();
            showSnackBar (response.message.toString());
          } else {
            dismissLoader();
            showSnackBar("Failed to resend OTP: ${response.message}");
          }

      }
      else {

        if (time.value == "00:01") {
          final response = await CallAPI.sentOTP(request: {
            "phoneNumber": storage.read("phoneNumber")
          });
          startTimer(29);
          secondOtp = response.otp;
          if (response.status == 200) {
            showSnackBarOtp("${response.otp}");
          } else {
            showSnackBar("Failed to send OTP: ${response.message}");
          }
        }
      }
    } catch (e) {
      dismissLoader();
      print("Error in resendOtp: $e");
      showSnackBar("An error occurred while resending OTP. Please try again.");
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
    log("message");
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
      log(enteredOtp.toString());
      log(phoneNumber!["otp"]);
      if (enteredOtp.toString() == phoneNumber!["otp"].toString() ||
          enteredOtp.toString() == secondOtp.toString()) {
        dismissLoader();
        Get.toNamed(AppRoutes.createNewPassword,
            arguments: phoneNumber!["phoneNumber"].toString());
        printResult(screenName: "OTP SCREEN", msg: "OTP VERIFIED");
      } else {
        dismissLoader();
        showSnackBar("Invalid OTP");
      }
    } catch (e, st) {
      dismissLoader();
      log(st.toString());
    }
  }
  void onVerify(){
    if(phoneNumber!["otp"] != "" || phoneNumber!["phoneNumber"] !=""){
     onEmailVerify();
    }else{
      onNumberVerify();
    }
  }
  @override
  void onInit() {
    phoneNumber = Get.arguments;

    log(phoneNumber.toString());
    super.onInit();
  }
}
