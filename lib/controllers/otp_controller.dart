import 'dart:async';
import 'package:endoorphin_trainer/utils/exports.dart';

class OtpController extends GetxController {
  Timer? _timer;
  int remainingSeconds = 60;
  final time = '00:00'.obs;
  RxBool isPaused = false.obs;
  RxBool showResendText = false.obs;

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
  void onInit() {
    startTimer(60);
    super.onInit();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
}
