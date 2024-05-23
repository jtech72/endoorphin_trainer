import 'dart:async';
import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SessionRunningController extends GetxController {
  PanelController panelController = PanelController();

  Timer? _timer;
  int remainingSeconds = 60;
  final time = '00.03'.obs;
  RxBool isPaused = false.obs;

  @override
  void onReady() {
    startTimer(3);
    super.onReady();
  }
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (!isPaused.value) {
        if (remainingSeconds == 0) {
          timer.cancel();
          Get.toNamed(AppRoutes.sessionComplete);
        } else {
          int minutes = remainingSeconds ~/ 60;
          int seconds = (remainingSeconds % 60);
          time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
          remainingSeconds--;
        }
      }
    });
  }

  void pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      isPaused.value = true;
    }
  }

  void resumeTimer() {
    if (isPaused.value) {
      isPaused.value = false;
      startTimer(remainingSeconds);
    }
  }
}
