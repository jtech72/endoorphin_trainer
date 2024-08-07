import 'dart:async';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../custom_Widgets/common_widgets.dart';

class SessionRunningController extends GetxController {
  PanelController panelController = PanelController();
  late IO.Socket socket;
  var scheduleTime = 0.obs;
  Timer? _timer;
  int remainingSeconds = 60;
  final time = '01.00'.obs;
  RxBool isPaused = false.obs;
  Map<String, dynamic>? sessionIds;

  Future<void> initSocket() async {
    log("Initializing socket...");

    try {
      socket = IO.io("http://103.185.212.115:5002", <String, dynamic>{
        'autoConnect': false,
        'transports': ['websocket'],
      });

      socket.connect();

      socket.onConnect((_) {
        log('Connection established');
      });

      socket.onDisconnect((_) {
        log('Connection Disconnected');
      });

      socket.onConnectError((err) {
        log('Connection Error: $err');
      });

      socket.onError((err) {
        log('General Error: $err');
      });
    } catch (e) {
      log('Exception caught: $e');
    }
  }
  void updateScheduleTime(int newTime) {
    scheduleTime.value = newTime;
    log('Updated scheduleTime: $newTime');
  }
  @override
  void onInit() async {
    sessionIds = Get.arguments;
    await initSocket();
    // socket.on('message', (data) {
    //   log('session running: $data');
    //   if (data != null && data['scheduletime'] != null) {
    //     int scheduleTime = data['scheduletime'];
    //     updateScheduleTime(scheduleTime);
    //   }
    // });
    // socket.on('sessionCompleted', (data) {
    // Get.toNamed(AppRoutes.sessionComplete);
    // });
    // log(sessionIds.toString());
    super.onInit();
  }
  @override
  void onReady() {
    startTimer(3600);
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
