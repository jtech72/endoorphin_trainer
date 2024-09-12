import '../utils/exports.dart';


class SessionRunningController extends GetxController {
  PanelController panelController = PanelController();
  var scheduleTime = 0.obs;
  Timer? _timer;
  int remainingSeconds = 60;
  var time = '00:00';
  RxBool isPaused = false.obs;
  Map<String, dynamic>? sessionIds;
  Timer? timerSession;

  // Future<void> initSocket() async {
  //   log("Initializing socket...");
  //
  //   try {
  //     socket = IO.io("http://103.185.212.115:5002", <String, dynamic>{
  //       'autoConnect': false,
  //       'transports': ['websocket'],
  //     });
  //
  //     socket.connect();
  //
  //     socket.onConnect((_) {
  //       log('Connection established');
  //     });
  //
  //     socket.onDisconnect((_) {
  //       log('Connection Disconnected');
  //     });
  //
  //     socket.onConnectError((err) {
  //       log('Connection Error: $err');
  //     });
  //
  //     socket.onError((err) {
  //       log('General Error: $err');
  //     });
  //   } catch (e) {
  //     log('Exception caught: $e');
  //   }
  // }
  void updateScheduleTime(int newTime) {
    scheduleTime.value = newTime;
    log('Updated scheduleTime: $newTime');
  }
  @override
  void onInit() async {
    sessionIds = Get.arguments;
    await getSessionTimer();
    // await initSocket();
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
          final rawTime = v.result!.scheduletime!;
          final formattedTime = formatTimeToMinutesAndSeconds(rawTime); // Call formatTime to get MM:SS format
          time = formattedTime;
          update();
        } else {
          timer.cancel();
        }
      }).catchError((error) {
        timer.cancel();
      });
    });
  }
// Helper function to format time from "00:00:00" to "MM:SS"
  String formatTimeToMinutesAndSeconds(String rawTime) {
    // Assuming rawTime is in the format "HH:mm:ss"
    List<String> timeParts = rawTime.split(':');
    if (timeParts.length == 3) {
      // Take the minutes and seconds part
      String minutes = timeParts[1];
      String seconds = timeParts[2];
      return '$minutes:$seconds';
    }
    return rawTime; // Fallback if the time is not in expected format
  }
//   Future<void> getSessionTimer() async {
//     timerSession = Timer.periodic(const Duration(seconds: 1), (timer) {
//       CallAPI.getSessionDetails(
//           id: sessionIds!["id"].toString(),
//           pinSession: sessionIds!["pin"].toString()).then((v) {
//         if (v.status == 200) {
//           if (v.result!.bookingStatus != "pending") {
//             timer.cancel();
//             timerSession!.cancel();
//             Get.toNamed(AppRoutes.sessionComplete);
//           }
//
//           // Parse the scheduletime (in HH:MM:SS) into seconds
//           int currentTime = parseHHMMSS(v.result!.scheduletime!);
//           int maxTime = v.result!.duration * 60; // Assuming duration is in minutes, convert to seconds
//           int remainingTime = maxTime - currentTime; // Reverse the countdown
//
//           // Convert remaining time to MM:SS format
//           final formattedTime = formatTimeToMinutesAndSeconds(remainingTime);
//           time = formattedTime;
//
//           // If remaining time reaches 0, cancel the timer
//           if (remainingTime <= 0) {
//             timer.cancel();
//           }
//
//           update(); // Update UI to reflect the countdown
//         } else {
//           timer.cancel();
//         }
//       }).catchError((error) {
//         timer.cancel();
//       });
//     });
//   }
//
// // Function to format seconds into MM:SS
//   String formatTimeToMinutesAndSeconds(int seconds) {
//     final int minutes = seconds ~/ 60; // Integer division for minutes
//     final int remainingSeconds = seconds % 60; // Remainder for seconds
//     // Format the result as MM:SS
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }
//
// // Function to parse scheduletime from HH:MM:SS into total seconds
//   int parseHHMMSS(String time) {
//     final parts = time.split(':'); // Split into hours, minutes, seconds
//     final int hours = int.parse(parts[0]);
//     final int minutes = int.parse(parts[1]);
//     final int seconds = int.parse(parts[2]);
//
//     // Convert everything to seconds
//     return hours * 3600 + minutes * 60 + seconds;
//   }


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
