import 'dart:async';
import 'dart:developer';
import 'package:endoorphin_trainer/services/location_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/services/network_services/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../utils/exports.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BookingRequestController extends GetxController{
  final TextEditingController pinController = TextEditingController();
  final ValueNotifier<bool> isPinComplete = ValueNotifier(false);

  PinCodePage() {
    pinController.addListener(() {
      if (pinController.text.length == 4) {
        isPinComplete.value = true;
      }
    });
  }
  RxBool selectedbutton = true.obs;
  late GoogleMapController mapController;
  RxInt selectedIndex = 0.obs;
  LocationController locationController = Get.put(LocationController());
  double _originLatitude = 26.48424, _originLongitude = 50.04551;
  double _destLatitude = 26.46423, _destLongitude = 50.06358;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyDQ2c_pOSOFYSjxGMwkFvCVWKjYOM9siow";

  Map<dynamic,dynamic> notificationData = {};
  late IO.Socket socket;
  var messages = <String>[].obs;
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(messageController.text.trim());
      messageController.clear();
    }
  }
  initSocket() {
    socket = IO.io(Endpoints.baseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  sendMessageIo() {
    String message = messageController.text.trim();
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message,
      'senderId': "userId",
      'receiverId': "receiverId",
      'time': DateTime.now().millisecondsSinceEpoch,
    };
    socket.emit('sendNewMessage', messageMap);
  }
  @override
  void onClose() {
    selectedIndex.value = 0;
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
  void setMapStyle() async {
    String style = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/dark_map_style.json');
    log("message1111");
    mapController.setMapStyle(style);
  }
  Timer? _timer;
  int remainingSeconds = 60;
  final time = '01.00'.obs;
  RxBool isPaused = false.obs;

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (!isPaused.value) {
        if (remainingSeconds == 0) {
          timer.cancel();
          showDialogBox("Session request timeout");
        } else {
          int minutes = remainingSeconds ~/ 60;
          int seconds = (remainingSeconds % 60);
          time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
          remainingSeconds--;
        }
      }
    });
  }
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: AppColors.yellow, points: polylineCoordinates);
    polylines[id] = polyline;

  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
       googleApiKey:  "AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo",
        request: PolylineRequest(
            origin: PointLatLng(locationController.currentLocation.value!.latitude, locationController.currentLocation.value!.longitude),
            destination: PointLatLng(30.725238, 76.804086),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]));
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
  Future<void>onAcceptButton()async{
    showLoader();
    try {
      Map<String, dynamic> request = {
        "trainerId":storage.read("userId").toString(),
        "userId":notificationData["userId"].toString(),
        "acceptBookingStatus":"true"
      };
      var response = await CallAPI.bookingAccept(request: request);
      if (response.status == 200) {
        dismissLoader();
        log(response.message.toString());
      } else {
        dismissLoader();
        log(response.message.toString());
      }
    } catch (e,st) {
      dismissLoader();
      log('Error occurred: $e');
      log('Error occurred: $st');
    }
  }
  showDialogBox(String title) {
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
                  ImagesPaths.cooltick,
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
                    onTap: () {
                      Get.offAllNamed(AppRoutes.bottomNavigation);
                    },
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
  @override
  void onInit() async{
    notificationData = Get.arguments??{};
    log("notification data ===>$notificationData");
    await locationController.getCurrentLocation();
    startTimer(180);
    /// origin marker
    _addMarker(LatLng(locationController.currentLocation.value!.latitude, locationController.currentLocation.value!.longitude), "origin",
        BitmapDescriptor.defaultMarker);
    /// destination marker
    _addMarker(LatLng(30.725238, 76.804086), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
    log(locationController.currentLocation.toString());
    // initSocket();
  }
}