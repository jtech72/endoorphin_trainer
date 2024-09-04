import 'dart:async';
import 'dart:developer';
import 'package:endoorphin_trainer/utils/app_routes.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../custom_Widgets/common_widgets.dart';
import '../services/network_services/api_call.dart';

class SessionRunningController extends GetxController {
  PanelController panelController = PanelController();
  var scheduleTime = 0.obs;
  Timer? _timer;
  int remainingSeconds = 60;
  var time = '0';
  RxBool isPaused = false.obs;
  Map<String, dynamic>? sessionIds;
  Timer? timerSession;

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
  await getSessionTimer();
    await initSocket();

    super.onInit();
  }
  Future<void> getSessionTimer() async {
    timerSession = Timer.periodic(const Duration(seconds: 1), (timer) {
      CallAPI.getSessionDetails(
          id: sessionIds!["id"].toString(),
          pinSession: sessionIds!["pin"].toString()).then((v) {
        if (v.status == 200) {
          if(v.result!.bookingStatus !="pending"){
            timer.cancel();
            timerSession!.cancel();
            Get.toNamed(AppRoutes.sessionComplete);
          }
          time = v.result!.scheduletime!;
          update();
        } else {
          timer.cancel();
        }
      }).catchError((error) {
        timer.cancel();
      });
    });
  }

  @override
  void onClose() {
    timerSession!.cancel();
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  // void startTimer(int seconds) {
  //   const duration = Duration(seconds: 1);
  //   remainingSeconds = seconds;
  //   _timer = Timer.periodic(duration, (Timer timer) {
  //     if (!isPaused.value) {
  //       if (remainingSeconds == 0) {
  //         timer.cancel();
  //         Get.toNamed(AppRoutes.sessionComplete);
  //       } else {
  //         int minutes = remainingSeconds ~/ 60;
  //         int seconds = (remainingSeconds % 60);
  //         time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  //         remainingSeconds--;
  //       }
  //     }
  //   });
  // }

  // void pauseTimer() {
  //   if (_timer != null && _timer!.isActive) {
  //     _timer!.cancel();
  //     isPaused.value = true;
  //   }
  // }
  //
  // void resumeTimer() {
  //   if (isPaused.value) {
  //     isPaused.value = false;
  //     startTimer(remainingSeconds);
  //   }
  // }
}
