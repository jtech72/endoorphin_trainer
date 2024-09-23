import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../utils/exports.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
class BookingRequestController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  // BookingAcceptDetailsModel? bookingDetails;
  RxBool isLoading = false.obs;
  LatLng? northeastCoordinates;
  LatLng? southwestCoordinates;
  RxBool isLocationOn = false.obs;
  double? userLat;
  double? userLng;
  late GoogleMapController mapController;
  RxInt selectedIndex = 0.obs;
  LocationController locationController = Get.put(LocationController());
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  List<LatLng> polylineCoordinates = [];
  Map<dynamic, dynamic> notificationData = {};
  late IO.Socket socket;
  var messages = <String>[].obs;
  final TextEditingController messageController = TextEditingController();
  Timer? _timer;
  int remainingSeconds = 60;
  RxBool timerIsVisible = true.obs;
  final time = '03.00'.obs;
  RxString totalTIme = "".obs;
  RxString totalDistance = "".obs;
  dynamic socketData;
  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(messageController.text.trim());
      messageController.clear();
    }
  }

  Future<dynamic> sendMessageIo(String id, String pinSession) async {
    log(id.toString());
    log(pinSession.toString());
    if (id.isEmpty || pinSession.isEmpty) return null;

    Map<String, String> messageMap = {
      'id': id,
      'pinSession': pinSession,
    };
    log(messageMap.toString());
    socket.emit('message', messageMap);
  }

  void setMapStyle() async {
    String style = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/dark_map_style.json');
    mapController.setMapStyle(style);
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        showDialogBox(
            "Session request timeout", ImagesPaths.cooltick.toString(), () {
          Get.offAllNamed(AppRoutes.bottomNavigation);
        });
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  Future<Uint8List> getBytesFromNetwork(String url, int width) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Uint8List data = response.bodyBytes;
      ui.Codec codec = await ui.instantiateImageCodec(data, targetWidth: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();
    } else {
      throw Exception('Failed to load image from network');
    }

  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  int getMarkerSize() {
    double baseSize = 25.0; // Base marker size in dp
    double devicePixelRatio = ui.window.devicePixelRatio;
    double screenWidth = ui.window.physicalSize.width / devicePixelRatio;
    double scaleFactor =
        screenWidth / 360.0; // Assume 360dp as the reference screen width
    double scaledSize = baseSize * scaleFactor;
    double maxSize = 50.0; // Maximum size limit in dp
    return (scaledSize * devicePixelRatio)
        .clamp(baseSize * devicePixelRatio, maxSize * devicePixelRatio)
        .toInt();
  }

  Future<void> addMarker(LatLng position, String id, String image, {bool isNetworkImage = false}) async {
    int markerSize = getMarkerSize();
    Uint8List markerIcon;

    if (isNetworkImage) {
      markerIcon = await getBytesFromNetwork(image, markerSize);
    } else {
      markerIcon = await getBytesFromAsset(image, markerSize);
    }

    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.fromBytes(markerIcon),
      position: position,
    );
    markers[markerId] = marker;
    update();
  }

  void addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: AppColors.yellow, points: polylineCoordinates);
    polyLines[id] = polyline;
  }

  void getPolyline() async {
    try {
      log("getPolyline");
      if (locationController.currentLocation.value != null) {
        final origin = PointLatLng(
            locationController.currentLocation.value!.latitude,
            locationController.currentLocation.value!.longitude);
        final destination = PointLatLng(userLat!, userLng!);
        final wayPoints = [
          PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")
        ];

        // Construct the URL for logging with API key included
        String waypointsString = wayPoints.map((wp) => wp.location).join('|');
        String url = 'https://maps.googleapis.com/maps/api/directions/json?'
            'origin=${origin.latitude},${origin.longitude}&'
            'destination=${destination.latitude},${destination.longitude}&'
            'mode=driving&'
            'waypoints=$waypointsString&'
            'key=AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo';
        log("Request URL: $url");

        PolylineResult result = await PolylinePoints()
            .getRouteBetweenCoordinates(
                googleApiKey: "AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo",
                request: PolylineRequest(
                    origin: origin,
                    destination: destination,
                    mode: TravelMode.driving,
                    wayPoints: wayPoints));

        if (result.points.isNotEmpty) {
          log("result ===>$result");
          result.points.forEach((PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
        } else {
          log("No points found in the result.");
        }
        addPolyLine();
      } else {
        log("Current location is null.");
      }
    } catch (e, st) {
      log("Error occurred while getting polyline: $e");
      log("Stack trace: $st");
    }
  }

  Future<void> onAcceptButton() async {
    _timer!.cancel();
    timerIsVisible.value = false;
    startTimer(180);
    isLoading.value = true;
    try {
      Map<String, dynamic> request = {
        "trainerId": storage.read("userId").toString(),
        "userId": notificationData["userId"].toString(),
        "acceptBookingStatus": true
      };
      var response = await CallAPI.bookingAccept(request: request);
      if (response.status == 200) {
        _timer!.cancel();
        timerIsVisible.value = false;
        isLoading.value = false;
        if (response.result!.bookingType == "bookNow") {
          notificationData["userId"] = response.result!.userId.toString();
          notificationData["bookingId"] = response.result!.bookingId.toString();
          notificationData["trainerId"] =storage.read("userId").toString();
          selectedIndex.value = 1;
        } else {
          Get.toNamed(AppRoutes.bottomNavigation);
          showSnackBar("Booking successfully scheduled");
        }
      } else {
        _timer!.cancel();
        isLoading.value = false;
        timerIsVisible.value = false;
        Get.offAllNamed(AppRoutes.bottomNavigation);
        showSnackBar("Booking canceled");

      }
    } catch (e, st) {
      isLoading.value = false;
      timerIsVisible.value = false;
      _timer!.cancel();
      log('Error occurred: $e');
      log('Error occurred: $st');
    }
  }

  Future<void> onRejectButton() async {
    showLoader();
    _timer!.cancel();
    timerIsVisible.value = false;

    try {
      Map<String, dynamic> request = {
        "trainerId": storage.read("userId").toString(),
        "userId": notificationData["userId"].toString(),
        "acceptBookingStatus": false,
        "exploreNow": notificationData["type"].toString() ?? ""
      };
      var response = await CallAPI.bookingAccept(request: request);
      if (response.status == 200) {
        dismissLoader();
        Get.back();
        Get.back();
        showToast(response.message.toString());
      } else {
        dismissLoader();
        Get.back();
        Get.back();
        showToast(response.message.toString());
      }
    } catch (e, st) {
      dismissLoader();
      Get.back();
      Get.back();
      log('Error occurred: $e');
      log('Error occurred: $st');
    }
  }

  Future<void> onStartButton(String id) async {
    showLoader();

    try {
      Map<String, dynamic> request = {
        "id": id,
        "trainerOnTheWay": true
      };

      final result = await CallAPI.sessionStart(request: request);
      if (result.status == 200) {
        dismissLoader();
        selectedIndex.value = 2;
      } else {
        dismissLoader();
        Get.offAllNamed(AppRoutes.bottomNavigation);
        showToast(result.message.toString());
      }
    } catch (e, st) {
      dismissLoader();
      log(e.toString());
      log(st.toString());
    }
  }

  void showDialogBox(String title, String image, void Function() ontap) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.bottomNavigation, (route) => false);
            return false;
          },
          child: AlertDialog(
            backgroundColor: AppColors.Black3,
            title: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Image.asset(
                  image,
                  scale: 4,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ],
            ),
            content: SizedBox(
                width: Get.width, // Set width as per your requirement
                height: Get.height * 0.07, // Set height as per your requirement
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                )),
            actions: [
              Center(
                child: InkButton(
                    child: Text(
                      'OK',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: AppColors.black,
                              fontSize: 18,
                              fontFamily: 'Montserrat'),
                    ),
                    onTap: ontap,
                    height: 35,
                    width: 95),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }

  void openGoogleMaps(double originLat, double originLng, double destLat,
      double destLng) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&origin=$originLat,$originLng&destination=$destLat,$destLng&travelmode=driving';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<void> findDistanceAndTime(LatLng origin, LatLng destination) async {
    String apiKey = 'AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo';
    String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?origins=${origin.latitude},${origin.longitude}&destinations=${destination.latitude},${destination.longitude}&key=$apiKey';

    log("Fetching ETA and distance from URL: $url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log("API response: $data");
      if (data['rows'] != null &&
          data['rows'][0]['elements'] != null &&
          data['rows'][0]['elements'][0]['duration'] != null &&
          data['rows'][0]['elements'][0]['distance'] != null) {
        String durationText = data['rows'][0]['elements'][0]['duration']['text'];
        totalTIme.value = durationText.replaceAll('mins', 'min'); // Change here
        totalDistance.value = data['rows'][0]['elements'][0]['distance']['text'];

        log("ETA fetched successfully: ${totalTIme.value}");
        log("Distance fetched successfully: ${totalDistance.value}");
        update();
      } else {
        log("ETA or distance data is not in the expected format.");
      }
    } else {
      log('Failed to fetch ETA and distance. Status code: ${response.statusCode}');
    }
  }

  Future<void> onPinVerify(String id) async {
    showLoader();
    String otp = pinController.text.trim();
    log(pinController.text.trim());

    if (otp.isEmpty) {
      dismissLoader();
      showSnackBar("Please enter a valid OTP");
      return;
    }

    if (otp.length != 4) {
      dismissLoader();
      showSnackBar("Invalid OTP");
      return;
    }

    try {
      int enteredOtp = int.parse(otp);
      await sendMessageIo(id, enteredOtp.toString());

      socket.on('message', (data) {
        socketData = data;
        log('Received message: $data');
      });

      await Future.delayed(const Duration(seconds: 2));

      if (socketData["message"] != "Your request pin is not correct. Please try again.") {
        dismissLoader();
        Get.toNamed(AppRoutes.sessionRunning, arguments: {
          "id": id,
          "pin": enteredOtp.toString(),
        });
      } else {
        dismissLoader();
        log(socketData.toString());
        showDialogBox("Your Request pin is not correct. Please try again.",
            ImagesPaths.inVaildPopUp.toString(), () {
          pinController.clear();
          Get.back();
        });
      }
    } catch (e, st) {
      dismissLoader();
      log(e.toString());
      log(st.toString());
    }
  }

  void addPolyline(LatLng origin, LatLng destination) {
    const PolylineId polylineId = PolylineId('route');
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      color: AppColors.yellow,
      width: 5,
      points: [origin, destination],
    );
    polyLines[polylineId] = polyline;
    update();
  }


  @override
  void onClose() {
    selectedIndex.value = 0;
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

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

  @override
  void dispose() {
    socket.disconnected;
    super.dispose();
  }

  @override
  void onInit() async {
    try {
      // Initialize notification data
      notificationData = Get.arguments ?? {};
      isLocationOn.value = true;

      // Get current location
      await locationController.getCurrentLocation();
      isLocationOn.value = false;

      // Determine whether the trainer is on the way
      if (notificationData["trainerOnTheWay"] != null) {
        if(notificationData["trainerOnTheWay"] == "true"){
          selectedIndex.value = 2;
        }else{
          selectedIndex.value = 1;
        }

        log("Notification data ===> $notificationData");
        await initSocket();
      } else {
        // Parse latitude and longitude
        userLat = double.tryParse(notificationData["userLat"]) ?? 0.0;
        userLng = double.tryParse(notificationData["userLong"]) ?? 0.0;

        if (userLat == 0.0 || userLng == 0.0) {
          log("Invalid user location data: $notificationData");
          return;
        }

        await findDistanceAndTime(locationController.currentLocation.value!, LatLng(userLat!, userLng!));
        startTimer(180);
      }

      // Log the notification data
      log("Notification data ===> $notificationData");

      // Initialize map polyline and socket
      getPolyline();
      await initSocket();
    } catch (e,st) {
      log("Error in onInit: $e");
      log("Error in onInit: $st");
    }
  }
}
