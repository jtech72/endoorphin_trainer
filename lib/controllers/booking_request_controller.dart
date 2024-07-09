
import 'dart:developer';

import 'package:endoorphin_trainer/services/network_services/endpoints.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
  Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  Location location = Location();
  RxInt selectedIndex = 0.obs;
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
  @override
  void onInit() {
    notificationData = Get.arguments??{};
    log("notification data ===>$notificationData");
    initSocket();
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
    // TODO: implement onClose
    super.onClose();
  }
  void setMapStyle() async {
    String style = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/dark_map_style.json');
    log("message1111");
    mapController.setMapStyle(style);
  }
  // void getCurrentLocation() async {
  //   try {
  //     LocationData currentLocationData = await location.getLocation();
  //     currentLocation.value =
  //         LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
  //   } catch (e) {
  //     log("Error getting current location: $e");
  //     // Handle errors here
  //   }
  // }

}