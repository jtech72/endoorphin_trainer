import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui'as ui;
import 'package:endoorphin_trainer/services/location_controller.dart';
import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/services/network_services/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/exports.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BookingRequestController extends GetxController{
  final TextEditingController pinController = TextEditingController();
  final ValueNotifier<bool> isPinComplete = ValueNotifier(false);
  LatLng?northeastCoordinates;
  LatLng?southwestCoordinates;
  double ?userLat;
  double ?userLng;
  late GoogleMapController mapController;
  RxInt selectedIndex = 0.obs;
  LocationController locationController = Get.put(LocationController());
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polyLines = {};
  List<LatLng> polylineCoordinates = [];
  Map<dynamic,dynamic> notificationData = {};
  late IO.Socket socket;
  var messages = <String>[].obs;
  final TextEditingController messageController = TextEditingController();
  Timer? _timer;
  int remainingSeconds = 60;
  final time = '01.00'.obs;


 void pinCodePage() {
    pinController.addListener(() {
      if (pinController.text.length == 4) {
        isPinComplete.value = true;
      }
    });
  }

  void getBothMarkers() {
    if (locationController.currentLocation.value != null) {
      LatLng currentLocation = locationController.currentLocation.value!;

      if (currentLocation.latitude <= 30.725238) {
        southwestCoordinates = currentLocation;
        northeastCoordinates = LatLng(30.725238, 76.804086);
      } else {
        southwestCoordinates = LatLng(30.725238, 76.804086);
        northeastCoordinates = currentLocation;
      }

      log('Northeast Coordinates: ${northeastCoordinates.toString()}');
      log('Southwest Coordinates: ${southwestCoordinates.toString()}');

      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: northeastCoordinates!,
            southwest: southwestCoordinates!,
          ),
          100.0, // padding
        ),
      );
    } else {
      log('Current location is null');
    }
  }
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
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
 void sendMessageIo() {
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
          showDialogBox("Session request timeout");
        } else {
          int minutes = remainingSeconds ~/ 60;
          int seconds = (remainingSeconds % 60);
          time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
          remainingSeconds--;
        }
    });
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  int getMarkerSize() {
    double baseSize = 25.0; // Base marker size in dp
    double devicePixelRatio = ui.window.devicePixelRatio;
    double screenWidth = ui.window.physicalSize.width / devicePixelRatio;
    double scaleFactor = screenWidth / 360.0; // Assume 360dp as the reference screen width
    double scaledSize = baseSize * scaleFactor;
    double maxSize = 50.0; // Maximum size limit in dp
    return (scaledSize * devicePixelRatio).clamp(baseSize * devicePixelRatio, maxSize * devicePixelRatio).toInt();
  }
 Future<void> addMarker(LatLng position, String id) async{
    int markerSize = getMarkerSize();
   final Uint8List markerIcon = await getBytesFromAsset('assets/images/ic_current_location.png', markerSize);
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: BitmapDescriptor.fromBytes(markerIcon), position: position);
    markers[markerId] = marker;
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
        PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
            googleApiKey: "AIzaSyAb-OJXPRTflwkd0huWLB2ygvwMv2Iwzgo",
            request: PolylineRequest(
                origin: PointLatLng(
                    locationController.currentLocation.value!.latitude,
                    locationController.currentLocation.value!.longitude
                ),
                destination: PointLatLng(30.725238, 76.804086),
                mode: TravelMode.driving,
                wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
            )
        );

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
  void showDialogBox(String title) {
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
  void onClose() {
    selectedIndex.value = 0;
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
  @override
  void onInit() async {
    notificationData = Get.arguments ?? {};
    userLat = double.parse(notificationData["userLat"]);
    userLng = double.parse(notificationData["userLong"]);
    log("notification data ===> $notificationData");
    await locationController.getCurrentLocation();
      startTimer(180);

    // if (locationController.currentLocation.value != null) {
    //   LatLng currentLocation = LatLng(
    //       locationController.currentLocation.value!.latitude,
    //       locationController.currentLocation.value!.longitude
    //   );
    //   /// origin marker
    //  await addMarker(currentLocation, "origin", BitmapDescriptor.defaultMarker);
    //   /// destination marker
    //  await addMarker(LatLng(userLat!,userLng!), "destination", BitmapDescriptor.defaultMarkerWithHue(90));
    //   log(locationController.currentLocation.toString());
    // } else {
    //   log("Failed to get the current location.");
    // }
    getPolyline();

  }
}