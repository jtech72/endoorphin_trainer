import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/models/request_models/booking_accept_model.dart';
import '../utils/exports.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class BookingRequestController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  BookingAcceptDetailsModel? bookingDetails;
  RxBool isLoading = false.obs;
  LatLng? northeastCoordinates;
  LatLng? southwestCoordinates;
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
  final time = '01.00'.obs;
  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(messageController.text.trim());
      messageController.clear();
    }
  }

  void initSocket() {
    socket = IO.io(Endpoints.baseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => log('Connection Disconnection'));
    socket.onConnectError((err) => log(err));
    socket.onError((err) => log(err));
  }

  void sendMessageIo() {
    String message = "messageController.text.trim()";
    log(message.toString());
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message,
      'senderId': "userId",
      'receiverId': "receiverId",
      'time': DateTime.now().millisecondsSinceEpoch,
    };
    log(messageMap.toString());
    socket.emit('sendNewMessage', messageMap);
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
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: AppColors.yellow, points: polylineCoordinates);
    polyLines[id] = polyline;
  }
  void getPolyline() async {
    try {
      log("getPolyline");
      if (locationController.currentLocation.value != null) {
        PolylineResult result = await PolylinePoints()
            .getRouteBetweenCoordinates(
                googleApiKey: "AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo",
                request: PolylineRequest(
                    origin: PointLatLng(
                        locationController.currentLocation.value!.latitude,
                        locationController.currentLocation.value!.longitude),
                    destination: PointLatLng(30.725238, 76.804086),
                    mode: TravelMode.driving,
                    wayPoints: [
                      PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")
                    ]));

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
    timerIsVisible.value = true;
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
        timerIsVisible.value = false;
        isLoading.value = false;
        bookingDetails = response;
        selectedIndex.value = 1;
        _timer!.cancel();
      } else {
        isLoading.value = false;
        timerIsVisible.value = false;
        _timer!.cancel();
        Get.back();
        showSnackBar(response.message.toString());
      }
    } catch (e, st) {
      isLoading.value = false;
      timerIsVisible.value = false;
      _timer!.cancel();
      log('Error occurred: $e');
      log('Error occurred: $st');
    }
  }
  Future<void>onStartButton()async{
    showLoader();

    try{
      Map<String, dynamic> request = {
        "id":bookingDetails!.result!.bookingId.toString(),
        "trainerOnTheWay":true
      };

   final result = await CallAPI.sessionStart(request: request);
    if(result.status == 200){
      dismissLoader();
      selectedIndex.value = 2;
      showSnackBar(bookingDetails!.result!.sessionPin.toString());
    }else{
      dismissLoader();
      showToast(result.message.toString());
    }
    }
    catch(e,st){
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
  void openGoogleMaps(double originLat, double originLng, double destLat, double destLng) async {
    final String googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&origin=$originLat,$originLng&destination=$destLat,$destLng&travelmode=driving';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  Future<void> onPinVerify() async{
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
      final result = await CallAPI.getSessionDetails(id: bookingDetails!.result!.bookingId.toString(), pinSession: enteredOtp.toString());
      if(result.status == 200){
           dismissLoader();
         Get.toNamed(AppRoutes.sessionRunning,arguments: {
           "id":bookingDetails!.result!.bookingId.toString(),
           "pin":enteredOtp.toString()
         });
      }
      else {
        dismissLoader();
        showDialogBox("Your Request pin is not correct Please try Again",
            ImagesPaths.inVaildPopUp.toString(),(){Get.back();});
      }
    } catch (e) {
      dismissLoader();
      showSnackBar("Invalid OTP format");
    }
  }
  @override
  void onClose() {
    selectedIndex.value = 0;
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
  @override
  void onInit() async {
    initSocket();
    notificationData = Get.arguments ?? {};
    userLat = double.parse(notificationData["userLat"]);
    userLng = double.parse(notificationData["userLong"]);
    log("notification data ===> $notificationData");
    await locationController.getCurrentLocation();
    startTimer(180);
    // getPolyline();

  }
}
